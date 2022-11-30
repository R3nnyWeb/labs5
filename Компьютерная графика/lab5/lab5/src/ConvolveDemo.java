import java.awt.*;
import java.awt.image.*;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import javax.imageio.ImageIO;
import java.awt.event.*;
public class ConvolveDemo extends Frame{
    private static final long serialVersionUID = 1L;
    private BufferedImage bi;
    // Конструктор
    public ConvolveDemo(String s) {
        super (s) ;
        URL url = null;
// Адрес изображения на сайте РГРТУ
        try {
            url = new
                    URL("http://www.rsreu.ru/modules/mod_imgslide/images/fasade_rsreu_2020.jpg");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
//Читаем изображение с сайта РГРТУ
        BufferedImage img = null;
        try {
            img = ImageIO.read(url);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
// Создаем объект BufferedImage
        bi = new BufferedImage(img.getWidth(null),
                img.getHeight(null),BufferedImage.TYPE_INT_RGB);
// Выводим
        Graphics2D big = bi.createGraphics();
        big.drawImage(img, 0, 0, this);
    }
    public void paint(Graphics g){
        Graphics2D g2 = (Graphics2D)g;
        int w = this.getSize().width;
        int bw = bi.getWidth(null);
        int bh = bi.getHeight(null);
        BufferedImage bimg = new BufferedImage(bw, bh, BufferedImage.TYPE_INT_RGB);
        BufferedImage bimg2 = new BufferedImage(bw, bh, BufferedImage.TYPE_INT_RGB);
//Матрица фильтра размытия для ядра свёртки
        float[] wl = {
                0.11111111f, 0.11111111f, 0.11111111f,
                0.11111111f, 0.11111111f, 0.11111111f,
                0.11111111f, 0.11111111f, 0.11111111f };
//        float[] wl = {
//                0.25f, 0f, 0.25f,
//                0f, 0.0f, 0f,
//                0.25f, 0f, 0.25f };
//        float[] wl = {
//                10f, 10f, 10f,
//                10f, -80f, 10f,
//                10f, 10f, 10f };
        float[] wl2 = {
                -2f, -2f, -2f,
                0.5f, 0f, 0.5f,
                2f, 2f, 2f };
// Ядро свертки
        Kernel kern = new Kernel(3, 3, wl2);
        Kernel kern2 = new Kernel(3, 3, wl);
// Обънкт ConvolveOp
        ConvolveOp cop = new ConvolveOp(kern, ConvolveOp.EDGE_NO_OP, null);
        ConvolveOp cop2 = new ConvolveOp(kern2, ConvolveOp.EDGE_NO_OP, null);
// Применение свертки
        cop.filter(bi, bimg) ;
        cop2.filter(bimg, bimg2) ;
// Выводим исходное и размытое изображения
        g2.drawImage(bi, null, 0, 0);
        g2.drawImage(bimg, null, w/2, 0);
    }
    public static void main(String args[]){
        Frame f = new ConvolveDemo("ConvolveDemo - Исходное и размытое изображения");
        f.addWindowListener(new WindowAdapter(){
                                public void windowClosing(WindowEvent e) {
                                    System.exit(0);
                                }
                            }
        );
        f.setSize(800,300);
        f.setResizable(false);
        f.setVisible(true);
    }
}
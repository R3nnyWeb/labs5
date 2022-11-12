import java.awt.Graphics;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.awt.image.MemoryImageSource;
import java.awt.image.PixelGrabber;
import javax.swing.JFrame;
public class PixGrabberDemo extends JFrame {
    private static final long serialVersionUID = 1L;
    Image img, img1;
    PixGrabberDemo(String s){
        super(s);
//Запрашиваем исходное изображение
        Image img = Toolkit.getDefaultToolkit().getImage("images/sa.jpg");
//Ждем пока изображение загрузится. Изучите класс MediaTracker!!!
        MediaTracker mt = new MediaTracker(this);
        mt.addImage(img, 0);
        try
        {
            mt.waitForAll();
        }
        catch(InterruptedException ie)
        {
            return;
        }
//Определяем высоту и ширину загруженного изображения
        int h = img.getHeight(this);
        int w = img.getWidth(this);
//Устанавливаем ширину и высоту окна как ширина и высота изображения
        this.setSize(w, h);
//Определяем реакцию на закрытие окна
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
//Вызываем метод, который удаляет из изображения красную составляющую
//Метод описан ниже
        img1 = this.dropRed(img);
    }
    //Метод, удаляющий красную составляющую из изображения
    Image dropRed(Image img)
    {
        Image imgNew = null;
        int[] pix;

        // Определяем ширину и вычрту полученного в качестве пврвметра изображения
        int nImageWidth = img.getWidth(null);
        int nImageHeight = img.getHeight(null);
        //Создаем массив для хранения пикселей изображения
        pix = new int[nImageWidth * nImageHeight];
        //Создаем PixelGrabber
        PixelGrabber pgr = new PixelGrabber(img, 0, 0, nImageWidth, nImageHeight,
                pix, 0, nImageWidth);
        //С помощью PixelGrabber забираем массив цветов точек изображения
        try
        {
            pgr.grabPixels();
        }
        catch(InterruptedException ie)
        {
            return null;
        }
        //Последовательно просматриваем массив цветов точек и
        //из каждого цвета удаляем красную составляющую
        for(int i = 0; i < pix.length; i++)
        {
            int nPixel = pix[i];
            //int nG = 0xff & (nPixel >> 8);
            int nG = 0;
            int nB = 0xff & nPixel;
            pix[i] = 0xff000000 | nG << 8 | nB;
        }
//Создаем новое изображение из измененного массива цветов с помощью MemoryImageSource
        imgNew = this.createImage(new MemoryImageSource(nImageWidth, nImageHeight, pix, 0,
                nImageWidth));
        return imgNew;
    }
    public void paint(Graphics g)
    {
        super.paint(g);
//Выводим изображение без красной составляющей
        g.drawImage(img1, 0, 0, this);
    }
    public static void main(String[] args) {
        new PixGrabberDemo("PixGrabberDemo").setVisible(true);
    }
}
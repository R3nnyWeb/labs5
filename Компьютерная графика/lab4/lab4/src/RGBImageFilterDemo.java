import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.FilteredImageSource;
import java.awt.image.RGBImageFilter;
import javax.swing.JFrame;
public class RGBImageFilterDemo extends JFrame{
    private static final long serialVersionUID = 1L;
    private Image img, newimg, newimg2;
    //Конструктор
    public RGBImageFilterDemo(String s) {
//Вызов конструктора суперкласса
        super(s);
//Читаем изображение
        img = Toolkit.getDefaultToolkit().getImage("images/sa.jpg");
//Создаем экземпляр RGBImageFilter типа GrayColorFilter
        RGBImageFilter rgb = new GrayColorFilter();
        RGBImageFilter rgb2 = new GrayFilter();

//Создаем отфильтрованное изображние
        newimg = this.createImage(new FilteredImageSource(img.getSource(),rgb));
        newimg2 = this.createImage(new FilteredImageSource(img.getSource(),rgb2));
        this.setSize(800, 800);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setVisible(true);
    }
    public void paint(Graphics g) {
//Рисуем изображение
        g.drawImage(newimg, 0, 0, 800, 500, this);
        g.drawImage(newimg2, 800, 0, 800, 500, this);
    }
    public static void main(String[] args) {
        new RGBImageFilterDemo("RGBImageFilterDemo");
    }
}

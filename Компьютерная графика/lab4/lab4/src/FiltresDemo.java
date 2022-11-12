import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.AreaAveragingScaleFilter;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ReplicateScaleFilter;
import javax.swing.JFrame;
public class FiltresDemo extends JFrame {
    private static final long serialVersionUID = 1L;
    private Image img, simg, croping, scroping, replimg, averimg;
    //Конструктор
    FiltresDemo(String s){
        super(s);
//Получаем изображение из файла
        img = Toolkit.getDefaultToolkit().getImage("images/sa.jpg");
//Создаем фильтры
//Фильтр для обрезки изображения
        CropImageFilter cif = new CropImageFilter(200, 150, 600, 700);
//Простой фильтр для масштабирования в область 200 на 200 пикселей
        ReplicateScaleFilter rsf = new ReplicateScaleFilter(200, 200);
//Более сложный фильтр для масштабирования в область 200 на 200 пикселей
        AreaAveragingScaleFilter asf = new AreaAveragingScaleFilter(200, 200);
//Масштабированное AreaAveragingScaleFilter исходное изображение
        simg = this.createImage(new FilteredImageSource(img.getSource(), asf));
//Обрезанное и масштабированное ReplicateScaleFilter изображение
        croping = this.createImage(new FilteredImageSource(img.getSource(), cif));
        scroping = this.createImage(new FilteredImageSource(croping.getSource(), rsf));
//Масштабированное ReplicateScaleFilter исходное изображение


        CropImageFilter cif2 = new CropImageFilter(860, 120, 120, 120);

        replimg = this.createImage(new FilteredImageSource(img.getSource(), cif2));
        replimg = this.createImage(new FilteredImageSource(replimg.getSource(), asf));
//Масштабированное AreaAveragingScaleFilter исходное изображение
        CropImageFilter cif1 = new CropImageFilter(800, 70, 300, 300);
        averimg = this.createImage(new FilteredImageSource(img.getSource(), cif1));
        averimg = this.createImage(new FilteredImageSource(averimg.getSource(), asf));
        this.setSize(400, 400);
        this.setVisible(true);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    public void paint(Graphics g) {
//Выводим отфилтрованные изображения в разные места окна
        g.drawImage(simg, 0, 0, this);
        g.drawImage(scroping, 200, 0, this);
        g.drawImage(replimg, 0, 200, this);
        g.drawImage(averimg, 200, 200, this);
    }
    public static void main(String[] args) {
        new FiltresDemo("Фильтры");
    }

}

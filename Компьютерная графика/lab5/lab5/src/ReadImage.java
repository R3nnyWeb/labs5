import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
public class ReadImage
{
    public static void main( String[] args ) throws IOException {
        BufferedImage image = null;
        try {
//Если адрес изображения с заглавной страницы сайта РГРТУ изменился, то укажите новый
//URL
//Интернет должен быть подключен!!!
            URL url = new
                    URL("http://www.rsreu.ru/modules/mod_imgslide/images/fasade_rsreu_2020.jpg");
            image = ImageIO.read(url);
        } catch (IOException e) {
            e.printStackTrace();
        }
        File f = new File("src/images/Radik.png");
        ImageIO.write(image, "PNG", f);
//Определяем ширину и высоту изображения
        int w = image.getWidth();
        int h = image.getHeight();
//Создаем фрейм и определяем его размеры
        JFrame frame = new JFrame("Фотография с сайта РГРТУ");
        frame.setSize(w, h);
//Размещаем изображение на JLabel и выводим его
//Класс IconImage изучите самостоятельно!!!
        JLabel label = new JLabel(new ImageIcon(image));
        frame.add(label);
        frame.setVisible(true);
    }
}

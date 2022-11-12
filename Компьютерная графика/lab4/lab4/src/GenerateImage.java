import javax.swing.*;
import java.awt.*;
import java.awt.image.MemoryImageSource;

public class GenerateImage extends JFrame
{
    private static final long serialVersionUID = 1L;
    Image img2;
    int h, w;
    public GenerateImage( )
    {
        super("Изображениe в окне");
//Получаем размеры экрана
        h = Toolkit.getDefaultToolkit().getScreenSize().height;
        w = Toolkit.getDefaultToolkit().getScreenSize().width;
        //Устанавливаем размеры окна равными размеру экрана
        setSize(w, h);
        //Отключаем менеджер компоновки
        this.setLayout(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    public void paint(Graphics g)
    {
//Изображение из файла
//Создаем панель
        JPanel p1 = new JPanel();
//Определяем положение в окне и размер панели
        p1.setBounds(0, 0, w, h);
//Добавляем панель в окно
        this.add(p1);
//Получаем графический контекст панели
        Graphics2D gp1 = (Graphics2D) p1.getGraphics();
        int w = 1200;
        int h = 1200;
        int pix[] = new int[w * h];
        int index = 0;
        //Color c = new Color(255, 255, 255);
        for (int y = 0; y < h; y++) {
            int red = (y * 255) / (h - 1);
            for (int x = 0; x < w; x++) {
                int blue = (x * 255) / (w - 1);
                pix[index++] = (255 << 24) | (red << 16)| ( 125<<8) | blue;
            }
        }
        for(int x = 0; x < h; x++){
            pix[(x%w)+(x*w)] = (255 << 24);
        }
        Image img = createImage(new MemoryImageSource(w, h, pix, 0, w));
//Создаем изображение из файла
//Определяем размеры изображения
        int imh = img.getHeight(this);
        int imw = img.getWidth(this);
        //Масштабируем изображение так, чтобы оно уместилось на панели
        gp1.scale(0.5*(h/imh), 0.5*(w/imw));
//Выводим изображение в панель
        gp1.drawImage(img, 0, 0 ,this);
    }
    public static void main( String args[])
    {
        new GenerateImage();
    }
}

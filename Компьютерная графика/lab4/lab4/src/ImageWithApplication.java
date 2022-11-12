
import java.awt.*;
import javax.swing.JFrame;
import javax.swing.JPanel;
public class ImageWithApplication extends JFrame
{
    private static final long serialVersionUID = 1L;
    Image img2;
    int h, w;
    public ImageWithApplication( )
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
//Создаем изображение из файла
        Image img = Toolkit.getDefaultToolkit().getImage("images/sa.jpg");
        Image img2 = Toolkit.getDefaultToolkit().getImage("images/IMG.jpg");
//Определяем размеры изображения
        int imh = img.getHeight(this);
        int imw = img.getWidth(this);
        //Масштабируем изображение так, чтобы оно уместилось на панели
        gp1.scale(0.5*(h/imh), 0.5*(w/imw));
//Выводим изображение в панель
        gp1.drawImage(img2, 0, 0, 900, 1200,   this);
        gp1.drawImage(img, 900, 0 ,this);
    }
    public static void main( String args[])
    {
        new ImageWithApplication();
    }
}
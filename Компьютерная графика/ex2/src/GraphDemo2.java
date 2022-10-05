// GraphDemo2.java
import java.awt.*;
import java.awt.geom.Arc2D;
import java.awt.geom.CubicCurve2D;
import java.awt.geom.GeneralPath;
import javax.swing.JFrame;
public class GraphDemo2 extends JFrame {
    // Переопределяем метод paint, который вызывается
// автоматически,когда необходимо перерисовать окно
    public void paint(Graphics g) {
        super.paint(g);
// Получаем объект класса Graphics2D 
        Graphics2D g2 = (Graphics2D) g;
        float[] dashPattern = {12.0F,12.0F};
// Устанавливаем параметры пера
        g2.setStroke(new BasicStroke(12F, BasicStroke.CAP_ROUND,
                BasicStroke.JOIN_BEVEL, 10, dashPattern, 0.0f));
// Рисуем две линии
        g2.drawLine(50, 50, 100, 50);
        g2.drawLine(50, 50, 100, 100);
// Устанавливаем сглаживание
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
// Меняем перо
        g2.setStroke(new BasicStroke(3, BasicStroke.CAP_ROUND,
                BasicStroke.JOIN_BEVEL, 10, dashPattern, 0.0f));
// Создаём и выводим дугу. Обратите внимание на Arc2D.PIE
        Arc2D arc_1=new Arc2D.Double(100,120,150,150,0,90,Arc2D.PIE);
        Paint brush = new GradientPaint(100, 120, new Color(0, 0, 255), 250, 250, new Color(0, 255, 0));
        g2.setPaint(brush);
        g2.fill(arc_1);
        g2.copyArea(100, 120, 150, 150, -100, -50);
// Сбрасываем режим сглаживания, чтобы увидеть, что это даёт 
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_OFF);
        Arc2D arc_2=new
                Arc2D.Double(120,100,150,150,0,90,Arc2D.CHORD);
        g2.draw(arc_2);
// Обязательно сравните качество изображения
// со сглаживанием и без него!!! 
// Создаём и выводим кривую третьего порядка, предварительно
// включив сглаживание и изменив цвет и перо. 
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(new Color(200,25,100));
        g2.setStroke(new BasicStroke(5, BasicStroke.CAP_ROUND,
                BasicStroke.JOIN_BEVEL ));
        CubicCurve2D c = new CubicCurve2D.Double(10,250,100,
                190,150,200, 250,250);
        g2.draw(c);
// Создаём и выводим путь
        GeneralPath gp = new GeneralPath();
        gp.moveTo(100, 240);
        gp.lineTo(200, 240);
        gp.lineTo(200, 290);
        gp.lineTo(100, 290);
        gp.lineTo(100, 240);
        gp.closePath();
        g2.draw(gp);
// Изменяем текущий цвет
        g2.setColor(new Color(0,50,100));
// Заливаем сплошным цветом выведенный путь
        g2.fill(gp);
    }
    public static void main(String[] args) {
        GraphDemo2 gd = new GraphDemo2();
// Определяем заголовок окна
        gd.setTitle("Java 2D");
// Определяем размер окна
        gd.setSize(300, 300);
// Запрещаем пользователю изменять размеры окна
        gd.setResizable(false);
// Определяем, что при закрытии окна заканчивается работа 
// программы
        gd.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // Делаем окно видимым
        gd.setVisible(true);
    }
}
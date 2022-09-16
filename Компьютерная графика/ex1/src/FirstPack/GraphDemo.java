package FirstPack;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import javax.swing.JFrame;
public class GraphDemo extends JFrame {
    private static final long serialVersionUID = 1L;
    // Переопределяем метод paint, который вызывается автоматически,когда перерисовается окно
    @Override
    public void paint(Graphics g) {
        super.paint(g);
        // Устанавливаем текущий цвет
        g.setColor(new Color(255,0,0));
        // Устанавлмваем текущий шрифт
        g.setFont(new Font("Arial",Font.BOLD,24));
        // Выводим строку
        g.drawString("ФВТ - ...", 120, 80);
        // Изменяем текщие цвет и шрифт
        g.setColor(new Color(0,0,255));
        g.setFont(new Font("Arial",Font.ITALIC,24));
        // Выводим ещё три строки
        g.drawString("ВПМ", 20, 170);
        g.drawString("ЭВМ", 100, 170);
        g.drawString("САПР ВС", 180, 170);
        // Выводим три отрезка
        g.drawLine(120, 100, 60, 140);
        g.drawLine(150, 100, 140, 140);
        g.drawLine(180, 100, 220, 140);
        // Рисуем прямоугольники с закруглёнными краями
        g.drawRoundRect(15, 200, 270, 85, 20, 20);
        g.drawRoundRect(20, 205, 260, 75, 20, 20);
        // Изменяем текущий цвет контекста
        g.setColor(new Color(150,10,10));
        // Рисуем эллипс
        g.drawOval(25, 210, 250, 65);
        // Рисуем закрашенные окружности
        g.fillOval(40, 228, 30, 30);
        g.fillOval(75, 228, 30, 30);
        g.fillOval(110, 228, 30, 30);
    }
    public static void main(String[] args) {
        GraphDemo gd = new GraphDemo();
        // Определяем заголовок окна
        gd.setTitle("Пример графики на Java");
        // Определяем размер окна
        gd.setSize(300, 300);
        // Запрещаем пользователю изменять размеры окна
        gd.setResizable(false);
// Определяем, что при закрытии окна заканчивается работа программы
        gd.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // Делаем окно видимым
        gd.setVisible(true);
    }
}
package var10;


import javax.swing.*;
import java.awt.*;

public class Ex1 extends JFrame {
    private static final long serialVersionUID = 2L;
    private static final String[] FACULIES = {"ФВТ", "ФЭ", "ГФ"};

    public static void main(String[] args) {
        Ex1 gd = new Ex1();
        // Определяем заголовок окна
        gd.setTitle("Пример графики на Java");
        // Определяем размер окна
        gd.setSize(300, 240);
        // Запрещаем пользователю изменять размеры окна
        gd.setResizable(false);
// Определяем, что при закрытии окна заканчивается работа программы
        gd.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // Делаем окно видимым
        gd.setVisible(true);
    }


    // Переопределяем метод paint, который вызывается автоматически,когда перерисовается окно
    @Override
    public void paint(Graphics g) {
        super.paint(g);

        g.setColor(new Color(0, 0, 0));
        g.drawRoundRect(110, 60, 80, 50, 10, 10);

        g.drawLine(150, 110, 150, 150);
        g.drawLine(55, 140, 245, 140);
        for (int i = 0; i < 3; i++) {
            int x = 55 + 95 * i;
            g.drawLine(x, 140, x, 150);
        }
        g.setFont(new Font("Arial", Font.BOLD, 20));
        g.drawString("РГРТУ", 120, 90);

        g.setFont(new Font("Arial", Font.ITALIC, 20));
        for (int i = 0; i < 3; i++) {
            int x = 15 + 95 * i;
            g.setColor(new Color(0, 0, 0));
            g.drawRoundRect(x, 150, 80, 50, 10, 10);
            g.drawString(FACULIES[i], (x + 20), 185);
            x = 83 + 95 * i;
            g.setColor(new Color(255, 0, 0));
            g.fillOval(x, 155, 7, 7);
        }
        g.setColor(new Color(255, 0, 0));
        Polygon p = new Polygon();
        p.addPoint(160, 65);
        p.addPoint(165, 60);
        p.addPoint(170, 60);
        p.addPoint(175, 65);
        p.addPoint(170, 70);
        p.addPoint(165, 70);
        g.fillPolygon(p);


    }

}



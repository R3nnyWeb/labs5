import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class MouseExample {
    public static void main(String[] args) {
//Создаем фрейм
        JFrame f = new JFrame("События мыши");
//Получаем объект toolkit, который содержит много полезного
//toolkit изучить самостоятельно!!!
        Toolkit tk=f.getToolkit();
//Получаем размер экрана монитора как объект класса Dimension
        Dimension scrdim = tk.getScreenSize();
//Получаем широту и высоту экрана монитора
        int scrX=scrdim.width;
        int scrY=scrdim.height;
//Устанавливаем положение и размер фрейма
//Если что-то не нравится, то установите другие
        f.setBounds(scrX/6, scrY/6, scrX/3, scrY/3);
//Определяем реакцию на закрытие окна
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//Добавляем к фрейму слушателей. Обработчики реализованы в классе MObr
        f.addMouseListener(new MObr());
        f.addMouseMotionListener(new MObr());
        f.addMouseWheelListener(new MObr());
//делаем фрейм видимым
        f.setVisible(true);
    }
}

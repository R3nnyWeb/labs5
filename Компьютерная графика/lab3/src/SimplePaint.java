import javax.swing.*;
import java.awt.*;

public class SimplePaint extends JFrame {
    public JLabel l2;
    public JColorChooser ColCh;
    private static final long serialVersionUID = 1L;
    //Конструктор класса
    public SimplePaint(String s) {
//Вызываем конструктор суперкласса, то есть класса JFrame
//и передаем в него строку заголовка окна
        super(s);
//Запрещаем менять размеры окна
        this.setResizable(false);
//Устанавливаем размеры окна
        this.setSize(800, 500);
//Создаем объект класса PaintPanel, который описан ниже
        PaintPanel panel = new PaintPanel(this, 800, 800);
//Добавляем к созданному объекту обработчики событий
//В нашем случае этот объект сам будет обрабатывать свои события
        panel.addMouseListener(panel);
        panel.addMouseMotionListener(panel);
        panel.addMouseWheelListener(panel);
//Создаем скроллируемую панел, чтобы посмотреть, как это делается
//Скроллировать эта панель будет панель для рисования panel, её и
//передаем в конструктор JScrollPane
        JScrollPane pane = new JScrollPane(panel);
//Определяем, чтобы вертикальная и горизонтальная полосы прокрутки
// панели показывались всегда
        pane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        pane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
//Добавляем панель для рисования в центральную область нашего окна
//this - ссылка на самого себя, то есть в нашем случае объект
//класса SimplePaint
        this.add(pane, BorderLayout.CENTER);
//Создаем новую панель
        JPanel p = new JPanel();
//Добавляем эту панель в нижнюю часть нашего (южную) окна


        ColCh = new JColorChooser();
        ColCh.getSelectionModel().addChangeListener(panel);
        //ColCh.addPropertyChangeListener(panel);
        this.add(ColCh, BorderLayout.WEST);
        this.add(p, BorderLayout.SOUTH);
//Создаем несколько кнопок, каждую из которых добавляем на панель
//Определяем обработчика событий для каждой кнопки
        JLabel l1 = new JLabel("Толщина пера:");
        l2 = new JLabel();
        p.add(l1);
        p.add(l2);
        JButton b1 = new JButton("Красный");
        p.add(b1);
        b1.addActionListener(panel);
        JButton b2 = new JButton("Зеленый");
        p.add(b2);
        b2.addActionListener(panel);
        JButton b3 = new JButton("Синий");
        p.add(b3);
        b3.addActionListener(panel);
        JButton b4 = new JButton("Черный");
        p.add(b4);
        b4.addActionListener(panel);
        JButton b6 = new JButton("Белый");
        p.add(b6);
        b6.addActionListener(panel);
        JButton b5 = new JButton("Очистить");
        p.add(b5);
        b5.addActionListener(panel);
//Определяем действие при закрытии окна
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setResizable(true);
//Делаем окно видимым
        this.setVisible(true);
    }
    public static void main(String[] args) {
//Создаем окно как безымянный объект, потому что имя его нам не нужно
        new SimplePaint("Очень простой редактор");
    }
}

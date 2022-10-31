import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.event.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

//Класс, расширяющий JPanel и реализующий интерфейсы
//ActionListener - слушатель событий лействия
//MouseListener - слушатель событий мыши
//MouseMotionListener - слушатель событий перемещения мыши
public class PaintPanel extends JPanel implements ActionListener, MouseListener, MouseMotionListener, MouseWheelListener, ChangeListener {
    private static final long serialVersionUID = 1L;
    private float wl = 5.0F;
    protected int lastX, lastY, w, h;
    protected Color curColor = Color.BLACK;
    protected JFrame f;
//Конструктор. Принимает в качестве параметров фрейм, на котором будет размещена
    //панель и размеры панели
    public PaintPanel(JFrame frame, int width, int height) {
        super();
        f = frame;
        w = width;
        h = height;
    }
    //Обработчик события перемещения мыши с нажатой кнопкой
    @Override
    public void mouseDragged(MouseEvent me) {
//Если при перемещении нажата левая кнопка мыши
        if ((me.getModifiers() & MouseEvent.BUTTON1_MASK) ==
                MouseEvent.BUTTON1_MASK) {
//С поммощью вызова метода this.getGraphics() получаем графический контекст нашей панели
//и приводим его к Graphics2D
            Graphics2D g2 = (Graphics2D)this.getGraphics();
//Устанавливаем текущую ширина штриха (Stroke) в 5 пикселей
            g2.setStroke(new BasicStroke(wl, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
//Устанавливаем текущий цвет рисования
            g2.setColor(curColor);
//Рисуем текущим штрихом и цветом прямую линию от предыдущего
//положения мыши до текущего
            g2.drawLine(lastX, lastY, me.getX(), me.getY());
//Телаем текущее положение мыши предыдущим
            lastX = me.getX();
            lastY = me.getY();
        }
    }
    //Это событие не обработано
    @Override
    public void mouseMoved(MouseEvent e) {}
    //Это событие не обработано
    @Override
    public void mouseClicked(MouseEvent arg0) {}
    //Это событие не обработано
    @Override
    public void mouseEntered(MouseEvent arg0) {}
    //Это событие не обработано
    @Override
    public void mouseExited(MouseEvent arg0) {}
    //Обработчик события нажания мыши
    @Override
    public void mousePressed(MouseEvent me) {
//Если нажата левая кнопка мыши
        if ((me.getModifiers() & MouseEvent.BUTTON1_MASK) ==
                MouseEvent.BUTTON1_MASK) {
//устанавливаем предыдущие координаты мыши в текущие
            lastX = me.getX();
            lastY = me.getY();
        }
    }
//Это событие не обработано
    @Override
    public void mouseReleased(MouseEvent arg0) {}
    //Обработчик события действия. Применяется здесь для
//обработки нажатий на кнопки
    @Override
    public void actionPerformed(ActionEvent event) {
        String s = event.getActionCommand();
//Если нажата кнопка "Очистить", то очистить панель рисования
        if (s.equals("Очистить")) this.repaint();
//Если нажата кнопка "Красный", то установить текущий цвет рисования в красный
//Остальные кнопки аналогично
else if (s.equals("Красный")) curColor = Color.RED;
        else if (s.equals("Зеленый")) curColor = Color.GREEN;
        else if (s.equals("Синий")) curColor = Color.BLUE;
        else if (s.equals("Черный")) curColor = Color.BLACK;
        else if (s.equals("Белый")) curColor = Color.WHITE;
    }
    @Override
    public void mouseWheelMoved(MouseWheelEvent mwe) {
        wl+=mwe.getWheelRotation();
        if(wl<1)wl=1;
        if(wl>50)wl=50;
        ((SimplePaint)f).l2.setText(wl+"");
    }



    @Override
    public void stateChanged(ChangeEvent e) {
        curColor = ((SimplePaint)f).ColCh.getColor();
    }
}

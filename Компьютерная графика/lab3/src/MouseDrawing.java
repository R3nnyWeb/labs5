import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Arc2D;
import java.awt.geom.CubicCurve2D;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;

public class MouseDrawing {
    Stroke pen = new BasicStroke(1);
    Paint brush = new Color(0, 0, 0);
    static Point lastPoint;
    static boolean isPressed;

    public static void main(String[] args) {
        JFrame jFrame = new JFrame(){
            public void paint(Graphics g){
                super.paint(g);
                Graphics2D g2 = (Graphics2D) g;

            }
        };
        jFrame.setTitle("Java 2D");
        jFrame.setSize(800, 600);
        jFrame.setResizable(true);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setVisible(true);
        jFrame.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {

            }
            @Override
            public void mousePressed(MouseEvent e) {
                if(!isPressed){
                    lastPoint = e.getPoint();
                }
                isPressed = true;
            }
            @Override
            public void mouseReleased(MouseEvent e) {
                isPressed = false;
            }
            @Override
            public void mouseEntered(MouseEvent e) {

            }
            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jFrame.addMouseMotionListener(new MouseMotionListener() {
            @Override
            public void mouseDragged(MouseEvent e) {

            }
            @Override
            public void mouseMoved(MouseEvent e) {
                if(isPressed){
                    Point newPoint = e.getPoint();
                    Graphics2D g = (Graphics2D) jFrame.getGraphics();
                    g.setPaint(new Color(0, 0, 0));
                    g.setStroke(new BasicStroke(1));
                    g.drawLine(lastPoint.x, lastPoint.y, newPoint.x, newPoint.y);
                    lastPoint = newPoint;
                }
            }
        });
    }
}

import javax.swing.*;
import java.awt.*;

public class Java2dEx {

    public static void main(String[] args) {
        JFrame jFrame = new JFrame(){
            public void paint(Graphics g){
                super.paint(g);
                Graphics2D g2 = (Graphics2D) g;
                Stroke pen = new BasicStroke(8);
                Paint brush = new Color(0, 0, 0);
                g2.setStroke(pen);
                g2.setPaint(brush);
                Polygon polygon = new Polygon();
                g2.drawLine(20, 50, 100, 50);
            }
        };
        jFrame.setTitle("Java 2D");
        jFrame.setSize(800, 600);
        jFrame.setResizable(true);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setVisible(true);
    }

}

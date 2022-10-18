import javax.swing.*;
import java.awt.*;
import java.awt.geom.Arc2D;
import java.awt.geom.CubicCurve2D;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;

public class Java2dEx {

    public static void main(String[] args) {
        JFrame jFrame = new JFrame(){
            public void paint(Graphics g){
                super.paint(g);
                Graphics2D g2 = (Graphics2D) g;
                Stroke pen = new BasicStroke(5);
                Paint brush = new Color(0, 0, 0);
                g2.setStroke(pen);
                g2.setPaint(new Color(181, 255, 57));
                Ellipse2D clip = new Ellipse2D.Double(0, 0, 600, 500);
                g2.setClip(clip);
                g2.scale(1.1, 1.1);
                g2.fillRect(0, 0, 1000, 1000);
                int[] xpoints = {50, 150, 150, 200};
                int[] yxpoints = {150, 150, 250, 250};
                g2.setPaint(brush);
                g2.drawPolyline(xpoints, yxpoints, 4);
                float[] dash = {3,10};
                g2.setPaint(new Color(0, 255, 0));
                g2.setStroke(new BasicStroke(4, BasicStroke.CAP_SQUARE, BasicStroke.JOIN_MITER, 10, dash, 0));
                int[] xpoints2 = {40, 140, 140, 190};
                int[] yxpoints2 = {160, 160, 260, 260};
                g2.drawPolyline(xpoints2, yxpoints2, 4);
                g2.setStroke(pen);
                g2.rotate(Math.toRadians(40), 200, 150);
                RoundRectangle2D rect = new RoundRectangle2D.Double(200, 100, 150, 50, 20, 20);
                g2.setStroke(new BasicStroke(2));
                g2.setPaint(new Color(0, 166, 255));
                g2.fill(rect);
                g2.setPaint(brush);
                g2.draw(rect);
                g2.rotate(Math.toRadians(-40), 200, 150);
                CubicCurve2D curve = new CubicCurve2D.Double(300, 150, 530, 300, 350, 100, 500, 150);
                g2.setPaint(new Color(255, 0, 0));
                g2.setStroke(new BasicStroke(1));
                g2.draw(curve);
                Paint gradient = new GradientPaint(60, 180, new Color(255, 0, 0), 60, 210, new Color(255, 255, 0));
                g2.setPaint(gradient);
                g2.fillOval(60, 180, 60, 50);
                g2.setPaint(new Color(0, 255, 0));
                g2.drawOval(60, 180, 60, 50);
                g2.setPaint(new Color(0, 0, 255));
                Arc2D arc = new Arc2D.Double(400, 100, 150, 150, 0, -90, Arc2D.PIE);
                g2.draw(arc);
                g2.setPaint(new Color(0, 255, 0));
                Ellipse2D c1 = new Ellipse2D.Double(50, 300, 100, 100);
                g2.fill(c1);
                g2.setPaint(new Color(0, 0, 255, 100));
                Ellipse2D c2 = new Ellipse2D.Double(100, 300, 100, 100);
                g2.fill(c2);
                g2.setPaint(new Color(255, 0, 0, 150));
                Ellipse2D c3 = new Ellipse2D.Double(75, 350, 100, 100);
                g2.fill(c3);
            }
        };
        jFrame.setTitle("Java 2D");
        jFrame.setSize(800, 600);
        jFrame.setResizable(true);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setVisible(true);
    }

}

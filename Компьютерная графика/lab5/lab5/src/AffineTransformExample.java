import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.image.*;
import java.awt.geom.AffineTransform;
public class AffineTransformExample extends JFrame {
    ShowLabel label;
    JComboBox shearX, shearY;

    String[] shear={"0.0","0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9"};
    public AffineTransformExample() {
        super("Аффинное преобразование сдвига");
        //Container container = getContentPane();
        label = new ShowLabel();
        this.add(label);
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(2, 4, 5, 5));

        shearX = new JComboBox(shear);
        shearX.setSelectedItem("0.00");
        panel.add(new JLabel("Сдвиг по X:"));
        panel.add(shearX);
        shearX.addActionListener(new ComboBoxListener());

        shearY = new JComboBox(shear);
        shearY.setSelectedItem("0.0");
        panel.add(new JLabel("Сдвиг по Y:"));
        panel.add(shearY);
        shearY.addActionListener(new ComboBoxListener());
        this.add(BorderLayout.NORTH, panel);
        setSize(350,300);
        setVisible(true);
    }
    public static void main(String arg[]) {
        new AffineTransformExample();
    }
    //Обработка событий JComboBox
    class ComboBoxListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            JComboBox box = (JComboBox) e.getSource();
            if (box == shearX) {
                label.shearx = Double.parseDouble((String) box.getSelectedItem());
                label.value(true);
                label.filter();
                label.repaint();
            } else if (box == shearY) {
                label.sheary = Double.parseDouble((String) box.getSelectedItem());
                label.value(true);
                label.filter();
                label.repaint();
            }
        }
    }
}
class ShowLabel extends JLabel {
    private static final long serialVersionUID = 1L;
    Image image;
    BufferedImage bufferedImage1, bufferedImage2;
    BufferedImage bufferedImage;
    Graphics2D g2d;
    AffineTransform affineTransform;
    double shearx = 0.0, sheary = 0.0;
    ShowLabel() {
        image = Toolkit.getDefaultToolkit().getImage("src/images/Radik.png");
        MediaTracker mediaTracker = new MediaTracker(this);
        mediaTracker.addImage(image, 1);
        try {
            mediaTracker.waitForAll();
        } catch (Exception e) {}
        createImages();
        affineTransform = new AffineTransform();
    }
    public void createImages() {
        bufferedImage1 = new BufferedImage(image.getWidth(this), image.getHeight(this),
                BufferedImage.TYPE_INT_RGB);
        g2d = bufferedImage1.createGraphics();
        g2d.drawImage(image, 0, 0, this);
        bufferedImage = bufferedImage1;
        bufferedImage2 = new BufferedImage(image.getWidth(this), image.getHeight(this),
                BufferedImage.TYPE_INT_RGB);
    }
    public void value(boolean shear) {
        if (shear) {
            affineTransform.setToShear(shearx, sheary);
            shear = true;
        }
    }
    public void filter() {
        AffineTransformOp affineTransformOp = new AffineTransformOp(affineTransform, null);
        Graphics2D G2D = bufferedImage2.createGraphics();
        G2D.clearRect(0, 0, bufferedImage2.getWidth(this),bufferedImage2.getHeight(this));
        affineTransformOp.filter(bufferedImage1, bufferedImage2);
        bufferedImage = bufferedImage2;
    }
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2D = (Graphics2D) g;
        g2D.drawImage(bufferedImage, 0, 0, this);
    }
}
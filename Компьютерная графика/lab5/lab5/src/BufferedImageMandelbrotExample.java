import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
public class BufferedImageMandelbrotExample {
    public static void main(String[] args) {
        JFrame f = new RasterImageFrame();
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setVisible(true);
    }
}
class RasterImageFrame extends JFrame {
    private static final long serialVersionUID = 1L;
    public RasterImageFrame() {
        super("Множество Мандельброта");
        this.setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);
        BufferedImage image = makeMandebrot(DEFAULT_WIDTH, DEFAULT_HEIGHT);
        this.add(new JLabel(new ImageIcon(image)));
    }
    public BufferedImage makeMandebrot(int width, int height) {
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_BYTE_GRAY);
        WritableRaster raster = image.getRaster();
        ColorModel model = image.getColorModel();
        Color fractalColor = Color.RED;
        int argb = fractalColor.getRGB();
        Object colorData = model.getDataElements(argb, null);
        for (int i = 0; i < width; i++)
            for (int j = 0; j < height; j++) {
                double a = XMIN + i * (XMAX - XMIN)/width;
                double b = YMIN + j * (YMAX - YMIN)/height;
                if (!escapesToInfinity(a, b))
                    raster.setDataElements(i, j, colorData);
            }
        return image;
    }
    private boolean escapesToInfinity(double a, double b) {
        double x = 0.0;
        double y = 0.0;
        int iterations = 0;
        while ((x <= 2) && (y <= 2) && (iterations < MAX_ITERATIONS)) {
            double xnew = x * x - y * y + a;
            double ynew = 2 * x * y + b;
            x = xnew;
            y = ynew;
            iterations++;
        }
        return x > 2 || y > 2;
    }
    private static final double XMIN = -2;
    private static final double XMAX = 2;
    private static final double YMIN = -2;
    private static final double YMAX = 2;
    private static final int MAX_ITERATIONS = 20;
    private static final int DEFAULT_WIDTH = 400;
    private static final int DEFAULT_HEIGHT = 400;
}

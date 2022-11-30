import java.awt.image.BufferedImage;
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
public class BufferedImageJuliaExample {
    static final int w = 800;
    static final int h = 800;
    //Попробуйте разные варианты
    private static ComplexNumber c = new ComplexNumber(-0.523, 0.55);
    //private static ComplexNumber c = new ComplexNumber(-0.123, 0.745);
    //private static ComplexNumber c = new ComplexNumber(0.223, 0.1);

    //Массив пикселей для хранения фрактала
    private boolean[][] values = null;
    //Границы комплексной плоскости
    private double minX = -1.5;
    private double maxX = 1.5;
    private double minY = -1.5;
    private double maxY = 1.5;
    // BufferedImage для рисования фрактала
    private BufferedImage image = null;
    //Максимальное разрешенное значение ComplexNumer
    private double threshold = 1;
    //Глубина рекурсии
    private int iterations = 100;
    public BufferedImageJuliaExample(){
        // Создание объекта BufferedImage
        image = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
        // Заполняем booean[][]
        this.getValues();
        for(int i=0;i<h;i++){
            for(int j=0;j<w;j++){
                //Если точка принадлежит множеству Жулиа - она красная, если нет - желтая
                if(values[i][j]) image.setRGB(i, j, Color.RED.getRGB());
                if(!values[i][j]) image.setRGB(i, j, Color.YELLOW.getRGB());
            }
        }
        JFrame f = new JFrame("Множество Жулиа"){
            private static final long serialVersionUID = 1L;
            @Override
            public void paint(Graphics g){
                g.drawImage(image,0,0,null);
            }
        };
        f.setResizable(false);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setSize(w,h);
        f.repaint();
        f.setVisible(true);
    }
    //Заполнение boolean[][] данными
    private void getValues(){
        values = new boolean[w][h];
        for(int i=0;i<h;i++){
            for(int j=0;j<w;j++){
                double a = (double)i*(maxX-minX)/(double)w + minX;
                double b = (double)j*(maxY-minY)/(double)h + minY;
                values[i][j] = isInSet(new ComplexNumber(a,b));
            }
        }
    }
    private boolean isInSet(ComplexNumber cn){
        for(int i=0;i<iterations;i++){
            cn = cn.square().add(c);
        }
        return cn.magnitude()<Math.pow(threshold, 2);
    }
    public static void main(String[] args){
        new BufferedImageJuliaExample();
    }
}

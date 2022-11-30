import java.awt.image.*;
import java.net.*;
import java.awt.*;
import java.io.*;
import javax.imageio.*;
public class DemoRescaleOp {

    public static void main(String[] args) throws Exception
    {
        // Определяем URL изображения. Попробуйте другое
        URL url= new URL("http://www.rsreu.ru/images/stories/kevm/Nauka/1.jpg");

        // Читаем изображение
        BufferedImage image = ImageIO.read(url);
        // Сохраняем исходное изображение на диск
        ImageIO.write(image, "png", new File("src/images/image.png"));

        // Устанавливаем значение параметров масштабирования (factors)
        // и смещения (offsets) цвета

// масштаб для каждой составляющей цвета RGB. Поменяте!
        float[] factors = new float[] {1.45f, 1.45f, 1f};
        // смещение для каждой составляющей цвета RGB. Поменяте!
        float[] offsets = new float[] {75.0f, 75.0f, 0.0f};

        // Создаем объект RescaleOp
        RescaleOp rop = new RescaleOp(factors, offsets, null);

        // Фильтруем изображение
        BufferedImage bi = rop.filter((BufferedImage)image, null);

        // Получаем графический контекст изображения
        Graphics2D gbi = (Graphics2D) bi.getGraphics();

        // Добавляем к изображению строку
        gbi.setColor(new Color(0, 0, 0));
        gbi.setFont(new Font("Arial", Font.BOLD, 20));
        gbi.drawString("ЭВМ!!!", 400, 400);

        gbi.setColor(new Color(255, 0, 0));
        gbi.fillOval(5, 50, 50, 50);
        // Сохраняем отфильтрованное изображение в файл.
        ImageIO.write(bi, "png", new File("src/images/processed.png"));
    }
}
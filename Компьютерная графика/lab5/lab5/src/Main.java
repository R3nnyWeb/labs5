import java.io.*;
import java.awt.image.*;
import javax.imageio.*;
public class Main{
    public static void main(String args[]){
        try{
            //Создаеи изображение
            BufferedImage img = new BufferedImage(500, 500, BufferedImage.TYPE_INT_RGB);
            //Описываем файл
            File f = new File("src/images/MyFile.png");
            //Это нужно для создания изображения
            int r = 5;
            int g = 25;
            int b = 255;
            int col = (r << 16) | (g << 8) | b;
            //Создаем изображение
            for(int x = 0; x < 500; x++){
                for(int y = 20; y < 300; y++){
                    img.setRGB(x, y, col);
                }
            }
            //Сохраняем изображение в файл
            ImageIO.write(img, "PNG", f);
            //Выводим в консоль полный путь к файлу
            System.out.println(f.getAbsolutePath());
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
//Если изображения не будет видно в каталоге, то в Eclipse
//щелкните вравой кнопкой мыши на каталоге images и выберете пункт Refresh (обновить)
//или нажмите F5
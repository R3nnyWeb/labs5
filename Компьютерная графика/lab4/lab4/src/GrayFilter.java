import java.awt.image.RGBImageFilter;

public class GrayFilter extends RGBImageFilter {
    public GrayFilter() {
        this.canFilterIndexColorModel = true;
    }
    @Override
    public int filterRGB(int x, int y, int rgb) {
//Получаем красную компоненту цвета
        int r = (0x000000ff & (rgb>>16));
//Получаем зеленую компоненту цвета
        int g = (0x000000ff & (rgb>>8));
//Получаем синюю компоненту цвета
        int b = (0x000000ff & rgb);
//Вычисляем яркость точки
        int gray = (int)(g + r + b)/3;
//Получаем цвет точки в оттенках серого такой же яркости, как яркость
//        исходной точки
        int grayColor = (int) (0xff000000 | gray << 16 | gray << 8 | gray);
        return grayColor;
    }
}

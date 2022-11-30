public class ComplexNumber{
    private double a, b;
    // Создание комплексного числа из двух вещественных чисел
    public ComplexNumber(double a, double b){
        this.a = a;
        this.b = b;
    }
    // Возведение комплексных чисел в квадрат
    public ComplexNumber square(){
        return new ComplexNumber(this.a*this.a - this.b*this.b, 2*this.a*this.b);
    }
    // Сложение комплексных чисел
    public ComplexNumber add(ComplexNumber cn){
        return new ComplexNumber(this.a+cn.a, this.b+cn.b);
    }
    // Вычисление модуля^2
    public double magnitude(){
        return a*a+b*b;
    }
}

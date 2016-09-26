/*
Дан класс ComplexNumber. Переопределите в нем методы equals() и hashCode() так, чтобы equals() сравнивал экземпляры ComplexNumber по содержимому полей re и im, а hashCode() был бы согласованным с реализацией equals().

Реализация hashCode(), возвращающая константу или не учитывающая дробную часть re и im, засчитана не будет

ComplexNumber a = new ComplexNumber(1, 1);
ComplexNumber b = new ComplexNumber(1, 1);
// a.equals(b) must return true
// a.hashCode() must be equal to b.hashCode()

*/

public final class ComplexNumber {
    private final double re;
    private final double im;

    public ComplexNumber(double re, double im) {
        this.re = re;
        this.im = im;
    }

    public double getRe() {
        return re;
    }

    public double getIm() {
        return im;
    }


    // public equals(ComplexNumber another) {
    //     // ComplexNumber a = new ComplexNumber(1, 1);
    //     // ComplexNumber b = new ComplexNumber(1, 1);
    //     // a.equals(b) must return true
    // }

    // public hashCode() {
    //     // ComplexNumber a = new ComplexNumber(1, 1);
    //     // ComplexNumber b = new ComplexNumber(1, 1);
    //     // a.hashCode() must be equal to b.hashCode()
    // }

    public static void main(String[] args) {
        ComplexNumber a = new ComplexNumber(1, 1);
        ComplexNumber b = new ComplexNumber(1, 1);
        System.out.println(a.equals(b));
        System.out.println(a.hashCode());
        System.out.println(b.hashCode());
    }
}
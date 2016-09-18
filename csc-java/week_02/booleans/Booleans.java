// Реализуйте метод, возвращающий true, если среди четырех его аргументов ровно два истинны (любые). Во всех остальных случаях метод должен возвращать false.

public class Booleans {
    public static boolean booleanExpression(boolean a, boolean b, boolean c, boolean d) {
        return (a & b & !c & !d) | (a & !b & c & !d) | (a & !b & !c & d) | (!a & b & c & !d) | (!a & b & !c & d) | (!a & !b & c & d);
    }
}
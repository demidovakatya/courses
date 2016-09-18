// Реализуйте метод, который возвращает букву, стоящую в таблице UNICODE 
// после символа "\" (обратный слэш) на расстоянии a.

public class Char {
    public static char charExpression(int a) {
        int s = (int) '\\';
        int sum = s + a;
        char res = (char) sum;
        return res;
    }
    public static void main(String[] args) {
        System.out.println(charExpression(12));
        System.out.println(charExpression(29));
    }
}
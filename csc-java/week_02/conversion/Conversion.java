/* 
 int -> long +
 int -> boolean - incompatible types: int cannot be converted to boolean
 char -> Character +
 char -> int + 
 String -> int - incompatible types: String cannot be converted to int
 byte -> char - incompatible types: possible lossy conversion from byte to char
 float -> long - incompatible types: possible lossy conversion from float to long
 long -> float + 
*/

public class Conversion {
    public static void main(String[] args) {
        long x = 1L;
        float y = x;
        System.out.println(y);
    }
}
/*
Реализуйте метод, проверяющий, является ли заданное число по абсолютной величине степенью двойки.

Решать можно разными способами:
- воспользовавшись одним удобным статическим методом из класса java.lang.Integer;
- применив пару трюков из двоичной арифметики;
- написав решение "в лоб" с циклом и условными операторами (можете вернуться к этой задаче после просмотра соответствующих уроков).
*/

import java.math.*;
import java.lang.*;

public class PowerOfTwo {
    /**
     * Checks if given <code>value</code> is a power of two.
     *
     * @param value any number
     * @return <code>true</code> when <code>value</code> is power of two, <code>false</code> otherwise
     */

    public static boolean isPowerOfTwo(int value) {
        value = Math.abs(value);
        // return (Math.abs(value) | (Math.abs(value) - 1)) == 0;
        return Integer.bitCount(value) == 1;
    }

    public static void main(String[] args) {
        System.out.println(isPowerOfTwo(0));
        System.out.println(isPowerOfTwo(1));
        System.out.println(isPowerOfTwo(-2));
    }
}
package io.github.agcom.lexjava;

import java.util.function.Consumer;
import java.util.function.Supplier;

/**
 * This is a documentation comment spanning
 * multiple
 * lines.
 */
public class Main {

    public static void main(final String[] args) {
        // This is a simple comment.
        final var _I$Am__An$Identifier$$ = Integer.MAX_VALUE;

        var i = 2147483647;
        i = 0x00_FF__00_FF;
        i = 0177_7777_7777;
        i = 0b0111_1111_1111_1111_1111_1111_1111_1111;

        var l = 9223372036854775807L;
        l = 0x7fff_ffff_ffff_ffffL;
        l = 07_7777_7777_7777_7777_7777L;
        l = 0b0111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111L;

        var f = 1e1f;
        f = 2.f;
        f = .3f;
        f = 0f;
        f = 3.14f;
        f = 6.022137e+23f;
        f = 0x1.fffffeP+127f;

        var d = 1e1;
        d = 2.;
        d = .3;
        d = 0.0;
        d = 3.14;
        d = 1e-9d;
        d = 1e137;
        d = 0x1.f_ffff_ffff_ffffP+1023;

        var b = true;
        b = false;

        var c = 'a';
        c = '%';
        c = '\t';
        c = '\\';
        c = '\'';
        c = '\u03a9';
        c = '\uFFFF';
        c = '\177';

        var s = "";
        s = "\"";
        s = "This is a string";
        s = "\u0048ello";

        var tb = """
                "When I use a word," Humpty Dumpty said,
                in rather a scornful tone, "it means just what I
                choose it to mean - neither more nor less."
                "The question is," said Alice, "whether you
                can make words mean so many different things."
                "The question is," said Humpty Dumpty,
                "which is to be master - that's all.\"""";
        tb =
                """
                        String text = \"""
                            The quick brown fox jumps over the lazy dog
                        \""";
                        """;
        tb = """
                winter""";
        tb = """
                winter
                """;
        tb = """
                Hi, "Bob"
                """;
        tb = """
                Hi,
                 "Bob"
                """;
        tb = """
                """;
        tb = """
                "
                """;
        tb = """
                \\
                """;
        tb = """
                <html>
                    <body>
                        <p>Hello, world</p>
                    </body>
                </html>
                """;

        final var comma = new int[]{1, 2, 3, 4};
        @Deprecated
        final class T {
            private static void tripleDot(final String... ss) {
            }
        }
        final Consumer<String[]> doubleColon = T::tripleDot;

        var cmp = 1 > 2;
        cmp = 1 < 2;
        cmp = 1 <= 2;
        cmp = 1 >= 2;
        cmp = 1 != 2;
        cmp = true && false;
        cmp = false || false;

        final var negate = !true;

        var num = 0;
        num = ~num;
        num = true == false ? 1 : 0;
        num++;
        num--;
        num = num + num;
        num = num - num;
        num = num * num;
        num = num / num;
        num = num & num;
        num = num | num;
        num = num ^ num;
        num = num % num;
        num = num << num;
        num = num >> num;
        num = num >>> num;
        num += num;
        num -= num;
        num *= num;
        num /= num;
        num &= num;
        num |= num;
        num ^= num;
        num %= num;
        num <<= num;
        num >>= num;
        num >>>= num;

        final Supplier<Boolean> arrow = () -> true;
    }

}


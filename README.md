# Lex Java

Java SE 17 language Flex description; was made as a homework for a **compiler design principles** college course.

For the description's shortcomings toward its goal, see [the repository's issues](https://github.com/agcom/lex-java/issues); if you found one that isn't acknowledged, submit it as a new issue.

## Simple build & run

On a Linux operating system, clone the repository and open it in a terminal; then issue the following commands to run the lexical analyzer on `Example.java`.

```sh
flex desc.l && \
gcc lex.yy.c -w && \
cat Example.java | ./a.out
```

The side effect free version of the above code:

```sh
out=$(mktemp) && \
flex -t desc.l | \
gcc -w -x c -o $out - && \
cat Example.java | $out
```

## Resources

- [Description file](desc.l)
- [Issues](https://github.com/agcom/lex-java/issues)
- Reference: [Java SE language specification / Chapter 3. Lexical Structure](https://docs.oracle.com/javase/specs/jls/se17/html/jls-3.html)
- [Flex](https://github.com/westes/flex)

# Lex Java

Java SE 17 language Flex description; was made as a homework for a **compiler design principles** college course.

For the project's shortcomings, see [the issues](https://github.com/agcom/lex-java/issues); if you found one that isn't acknowledged, submit it as a new issue.

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
- [Java SE language specification / Chapter 3. Lexical Structure](https://docs.oracle.com/javase/specs/jls/se17/html/jls-3.html)
- [Flex](https://github.com/westes/flex)

## Embedding

If you want to use this as embedded, you probably need to expand some rules (and definitions); e.g. :point_down:

```lex
...
ReservedKeyword {AbstractKeyword}|{ContinueKeyword}|{ForKeyword}|...
AbstractKeyword abstract
ContinueKeyword continue
ForKeyword for
...
%%
...
{AbstractKeyword} {return ABSTRACT;}
{ContinueKeyword} {return CONTINUE;}
{ForKeyword} {return FOR;}
...
%%
...
```

instead of :point_down:

```lex
...
ReservedKeyword abstract|continue|for|...
...
%%
...
{ReservedKeyword} printlnCurrentToken();
...
%%
...
```

The focus of this project is on its standard text output; token names (first word of each output line) are probable terminals of a grammar for Java 17 language.

> Therefore, for example, it's normal to collapse all keywords in one rule, to save some ink and energy.

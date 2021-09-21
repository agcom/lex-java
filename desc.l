%top{
// Java SE 17 language Flex description
// Reference: https://docs.oracle.com/javase/specs/jls/se17/html/jls-3.html
}

%{
#include <stdarg.h>
%}

/* '\r' alone is a line terminator per Java 17 language specification. */
/* "\r\n" which counts as one line terminator, has more precedence over '\r' then '\n', which counts as two line terminators. */
LineTerminator \r\n|[\n\r]

/* Any character (in Unicode, unless something else is forced by the regex driver) except '\r' and '\n'. */
AnyCharacter [^\r\n]

/* '\f' stands for the form feed character, and is counter as a white space per Java 17 language specification. */
WhiteSpace [ \t\f]|{LineTerminator}
Comment "//"{AnyCharacter}*|"/*"({AnyCharacter}|{LineTerminator})*"*/"

Identifier {IdentifierStart}{IdentifierPart}*
IdentifierStart [A-Za-z]|_|"\$"
IdentifierPart {IdentifierStart}|[0-9]

ReservedKeyword abstract|continue|for|new|switch|assert|default|if|package|synchronized|boolean|do|goto|private|this|break|double|implements|protected|throw|byte|else|import|public|throws|case|enum|instanceof|return|transient|catch|extends|int|short|try|char|final|interface|static|void|class|finally|long|strictfp|volatile|const|float|native|super|while|_|var|yield|permits|sealed|non-sealed|record

Literal {IntegerLiteral}|{FloatingPointLiteral}|{BooleanLiteral}|{CharacterLiteral}|{StringLiteral}|{NullLiteral}

IntegerLiteral {DecimalIntegerLiteral}|{HexIntegerLiteral}|{OctalIntegerLiteral}|{BinaryIntegerLiteral}
DecimalIntegerLiteral {DecimalNumeral}{IntegerTypeSuffix}?
HexIntegerLiteral {HexNumeral}{IntegerTypeSuffix}?
OctalIntegerLiteral {OctalNumeral}{IntegerTypeSuffix}?
BinaryIntegerLiteral {BinaryNumeral}{IntegerTypeSuffix}?
IntegerTypeSuffix l|L

DecimalNumeral 0|[1-9](({DecimalDigit}|_)*{DecimalDigit})?
DecimalDigit [0-9]

HexNumeral 0[xX]{HexDigits}
HexDigit [0-9a-fA-F]
HexDigits {HexDigit}|{HexDigit}({HexDigit}|_)*{HexDigit}

OctalNumeral 0({OctalDigit}|_)*{OctalDigit}
OctalDigit [0-7]

BinaryNumeral 0[bB]({BinaryDigit}|{BinaryDigit}({BinaryDigit}|_)*{BinaryDigit})
BinaryDigit [01]

FloatingPointLiteral {DecimalFloatingPointLiteral}|{HexadecimalFloatingPointLiteral}

DecimalFloatingPointLiteral {FloatingPointDigits}\.{FloatingPointDigits}?{ExponentPart}?{FloatTypeSuffix}?|\.{FloatingPointDigits}{ExponentPart}?{FloatTypeSuffix}?|{FloatingPointDigits}{ExponentPart}{FloatTypeSuffix}?|{FloatingPointDigits}{ExponentPart}?{FloatTypeSuffix}
FloatingPointDigits {DecimalDigit}|{DecimalDigit}({DecimalDigit}|_)*{DecimalDigit}
ExponentPart [eE][+-]?{FloatingPointDigits}
FloatTypeSuffix [fFdD]

HexadecimalFloatingPointLiteral {HexSignificand}{BinaryExponent}{FloatTypeSuffix}?
HexSignificand {HexNumeral}\.?|0[xX]{HexDigits}?\.{HexDigits}
BinaryExponent [pP][+-]?{FloatingPointDigits}

BooleanLiteral true|false

CharacterLiteral \'({AnyCharacter}|{EscapeSequence})\'
EscapeSequence \\b|\\s|\\t|\\n|\\f|\\r|\\\"|\\\'|\\|{OctalEscape}
OctalEscape \\{OctalDigit}{1,2}|\\{ZeroToThree}{OctalDigit}{2}
ZeroToThree [0-3]

StringLiteral \"({AnyCharacter}|{EscapeSequence})*\"|{TextBlock}
TextBlock \"\"\"[ \t\f]*{LineTerminator}({AnyCharacter}|{EscapeSequence}|{LineTerminator})*\"\"\"

NullLiteral null

Separator [(){}[\];,.@]|"..."|::

Operator [=><!~?:+\-*^%|&/]|->|==|>=|<=|!=|&&|\|\||\+\+|--|<<|>>|>>>|\+=|-=|\*=|\/=|&=|\|=|\^=|%=|<<=|>>=|>>>=

%%

{WhiteSpace} ;
{Comment} ;

{ReservedKeyword} printlnCurrentToken();
{Literal} printlnCurrentTokenWithName("literal");
{Identifier} printlnCurrentTokenWithName("identifier");

{Separator} printlnCurrentToken();
{Operator} printlnCurrentToken();

(?s:.) printlnCurrentTokenWithName("unknown");

%%

void printlnCurrentToken() {
	printlnMonuple(yytext);
}

void printlnCurrentTokenWithName(const char* name) {
	printlnCouple(name, yytext);
}

void printlnMonuple(const char* first) {
	printfln("%s", first);
}

void printlnCouple(const char* first, const char* second) {
	printfln("%s %s", first, second);
}

void printfln(const char* format, ...) {
	va_list args;
	va_start(args, format);
	vprintf(format, args);
	va_end(args);
	printf("\n");
}

int yywrap() {
	return 1;
}
void main() {
	yylex();
}
//=============================================================================
/*
Copyright © 2025 Andrea Carboni andrea.carboni71@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
//=============================================================================

lexer grammar BflLexer;

//=== Keywords ================================================================

PACKAGE  : 'package';
PARAMS   : 'params';
FUNC     : 'func';
IF       : 'if';
ELSE     : 'else';
FOR      : 'for';
CONST    : 'const';

INT      : 'int';
REAL     : 'real';
STRING   : 'string';
BOOL     : 'bool';
TIME     : 'time';

//=== Identifiers =============================================================

PACKAGE_IDENTIFIER : [a-z]+ ;
LC_IDENTIFIER      : [a-z]+ ( '_' | [a-zA-Z] | [0-9] )* ;
UC_IDENTIFIER      : [A-Z]+ ( '_' | [a-zA-Z] | [0-9] )* ;

//=== Numbers =================================================================

//=== Strings =================================================================

STRING_LIT : '"' (~["\\] | ESCAPED_VALUE)* '"' ;

fragment ESCAPED_VALUE:
    '\\' (
        [abfnrtv\\'"]
    )
;

//=== Symbols =================================================================

L_PAREN    : '(';
R_PAREN    : ')';
L_BRACKET  : '[';
R_BRACKET  : ']';
L_CURLY    : '{' ;
R_CURLY    : '}' ;
EQUAL      : '=' ;

STAR       : '*' ;
SLASH      : '/' ;
PLUS       : '+' ;
MINUS      : '-' ;

//=== Comments and white spaces ===============================================

WS           : [ \t]+        -> channel(HIDDEN);
NEWLINE      : [\r\n]+       -> channel(HIDDEN);
BLOCK_COMMENT: '/*' .*? '*/' -> channel(HIDDEN);
LINE_COMMENT : '//' ~[\r\n]* -> channel(HIDDEN);

//=============================================================================

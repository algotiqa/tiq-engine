java -Xmx500M -cp "./antlr-4.13.2-complete.jar:$CLASSPATH" \
	org.antlr.v4.Tool \
	-Dlanguage=Go \
	-package parser \
	*.g4

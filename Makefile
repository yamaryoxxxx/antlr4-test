GRAMMAR_NAME='TestGrammar'
START_RULE='start'
TEST_DATA='testdata.txt'

ARG_CP=-cp "./antlr-4.7.1-complete.jar:$$CLASSPATH"
JAVA=java -Xmx500M ${ARG_CP}
JAVAC=javac ${ARG_CP}

default: build test

test:
	@(cat ${TEST_DATA} | ${JAVA} org.antlr.v4.gui.TestRig ${GRAMMAR_NAME} ${START_RULE} -tree)

grammar:
	@(${JAVA} org.antlr.v4.Tool ${GRAMMAR_NAME}.g4)

build: grammar
	@(${JAVAC} ${GRAMMAR_NAME}*.java)

clean:
	rm ${GRAMMAR_NAME}*.java || true
	rm ${GRAMMAR_NAME}*.class || true
	rm ${GRAMMAR_NAME}*.interp || true
	rm ${GRAMMAR_NAME}*.tokens || true



import java.io.IOException;
import java.io.StringReader;

public class AnaliseLinguagem {
    public static void main(String[] args) throws IOException {

        String expr = "fi 2 + 3+a then";

        LexicalAnalyzer lexical = new LexicalAnalyzer(new StringReader(expr));
        lexical.yylex();

    }
}

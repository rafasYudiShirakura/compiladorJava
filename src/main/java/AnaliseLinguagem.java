import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class AnaliseLinguagem {
    public static void main(String[] args) throws IOException {
        String filePath = "src/main/java/programa.vaj";
        LexicalAnalyzer lexer = new LexicalAnalyzer(new FileReader(filePath));

        NewToken token;
        while ((token = lexer.yylex()) != null) {
            System.out.printf(
                    "Token %-12s  lexema='%s'  linha=%d  coluna=%d%n",
                    token.name,
                    token.value,
                    token.line,
                    token.column
            );
        }

        lexer.yyclose();
    }
}

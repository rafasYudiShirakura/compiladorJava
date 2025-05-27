import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.nio.file.Paths;

public class Gerador {

    public static void main(String[] args) throws FileNotFoundException {
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "src/main/java/";


        String file = rootPath + "/" + subPath + "linguagem.lex";

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);
    }
}

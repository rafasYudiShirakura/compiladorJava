public class NewToken {
    public final String name;
    public final String value;
    public final Integer line;
    public final Integer column;

    public NewToken(String name, String value, Integer line, Integer column) {
        this.name = name;
        this.value = value;
        this.line = line;
        this.column = column;
    }

    @Override
    public String toString() {
        return String.format("%s('%s') @ %d:%d", name, value, line, column);
    }
}

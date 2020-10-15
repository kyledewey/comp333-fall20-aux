public interface IntToIntFunction {
    public int theFunction(final int param);
}

public class AddsParam implements IntToIntFunction {
    public final int first;
    public AddsParam(final int first) {
        this.first = first;
    }

    public int theFunction(final int second) {
        return first + second;
    }

    public static IntToIntFunction returnFunctionThatAdds(final int first) {
        return new AddsParam(first);
    }

    public static void main(String[] args) {
        final IntToIntFunction f = returnFunctionThatAdds(3);
        System.out.println(f.theFunction(2));
    }
}

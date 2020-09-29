import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

public class Subtyping {
    public void foo(Object obj) {}

    public static void main(String[] args) {
        foo("foobar");

        List<String> list = new ArrayList<String>();
        List<String> list2 = new LinkedList<String>();

        Object o = "foo";
    }
}

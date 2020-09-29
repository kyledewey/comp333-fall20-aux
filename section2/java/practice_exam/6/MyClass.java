// Reason #1 of not compiling: extends used instead of implements; implements is needed
// for interfaces
public class MyClass implements MyInterface {
    public void foo() {}
    public void bar() {}

    public static void main(String[] args) {
        MyInterface a = new MyClass();
        a.bar(); // Reason #2: bar is not defined on MyInterface
    } // Reason #3 of not compiling: forgotten "}"
} // MyClass

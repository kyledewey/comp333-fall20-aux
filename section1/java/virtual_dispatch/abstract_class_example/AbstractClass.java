public abstract class AbstractClass {
    public abstract int doSomething(boolean y);

    public int doSomethingElse() {
        return doSomething(true);
    }

    public static void blah() { }

    public static void main(String[] args) {
        blah();
    }
}

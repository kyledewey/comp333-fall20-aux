public abstract class MyAbstractClass {
    public MyAbstractClass() {}

    public int doAThing(boolean b) {
        if (b) {
            return 7;
        } else {
            return 8;
        }
    }

    public abstract boolean doAbstractThing(int x);
}

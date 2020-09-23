public class ConsoleDestination extends OutputDestination {
    public ConsoleDestination() {}
    
    public void writeThing(final int thing) {
        System.out.println(thing);
    }
}

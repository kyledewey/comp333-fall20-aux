public class ConsoleDestination extends OutputDestination {
    public ConsoleDestination() { }
    
    public void printThing(final int thingToPrint) {
        System.out.println(thingToPrint);
    } // printThing
}

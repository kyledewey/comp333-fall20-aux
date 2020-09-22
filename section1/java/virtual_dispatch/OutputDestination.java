public abstract class OutputDestination {
    public OutputDestination() { }
    
    public abstract void printThing(final int thingToPrint);

    public static OutputDestination makeDestination(final boolean userWantsConsole,
                                                    final String destinationFile) {
        if (userWantsConsole) {
            return new ConsoleDestination();
        } else {
            return new FileDestination(destinationFile);
        }
    } // makeDestination
}

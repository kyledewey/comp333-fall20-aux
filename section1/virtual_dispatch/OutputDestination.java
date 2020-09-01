public class OutputDestination {
    // ---BEGIN INSTANCE VARIABLES---
    public final boolean userWantsConsole;
    public final String destinationFile;
    private final FileOutputStream stream;
    // ---END INSTANCE VARIABLES---

    public OutputDestination(final boolean userWantsConsole,
                             final String destinationFile) {
        this.userWantsConsole = userWantsConsole;
        this.destinationFiles = destinationFile;

        if (userWantsConsole) {
            stream = null;
        } else {
            final File file = new File(destinationFile);
            stream = new FileOutputStream(file);
        }
    } // OutputDestination

    // Issues:
    // 2.) userWantsConsole and destinationFile are closely related (we've improved things, but it's still there)
    // 3.) userWantsConsole and destinationFile are somewhat conflicting (destinationFile doesn't
    //     make sense if userWantsConsole == true) (we've improved things, but it's still there)
    // 4.) We have different kinds of behavior that are being distinguished with if; they are all
    //     getting lumped into this class
    public void printThing(final int thingToPrint) {
        if (userWantsConsole) {
            System.out.println(thingToPrint);
        } else {
            stream.writeln(thingToPrint);
        }
    } // printThing
} // OutputDestination

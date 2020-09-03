public class FileDestination extends OutputDestination {
    // ---BEGIN INSTANCE VARIABLES---
    public final String destinationFile;
    private final FileOutputStream stream;
    // ---END INSTANCE VARIABLES---

    public FileDestination(final String destinationFile) {
        this.destinationFile = destinationFile;

        final File file = new File(destinationFile);
        stream = new FileOutputStream(file);
    }
    
    public void printThing(final int thingToPrint) {
        stream.writeln(thingToPrint);
    } // printThing
}

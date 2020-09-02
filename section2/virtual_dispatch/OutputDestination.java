// class OutputDestination(val userWantsConsole: Boolean)

public class OutputDestination {
    // ---BEGIN INSTANCE VARIABLES---
    public final boolean userWantsConsole;
    public final String destinationFile;
    private final FileOutputStream stream;
    // ---END INSTANCE VARIABLES---

    public OutputDestination(final boolean userWantsConsole,
                             final String destinationFile) {
        this.userWantsConsole = userWantsConsole;
        this.destinationFile = destinationFile;

        if (userWantsConsole) {
            stream = null;
        } else {
            final File file = new File(destinationFile);
            stream = new FileOutputStream(file);
        }
    } // OutputDestination

    // Issues:
    // 2.) userWantsConsole and destinationFile are closely related
    // 3.) destinationFile doesn't make sense if userWantsConsole == true
    public void writeThing(final int thing) {
        if (userWantsConsole) {
            System.out.println(thing);
        } else {
            stream.writeln(thing);
        }
    } // writeThing    
} // OutputDestination
    

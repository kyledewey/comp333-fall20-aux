import java.io.File;
import java.io.FileOutputStream;

public class Temp {
    public static boolean doesUserWantConsole(final String[] args) { ... }
    public static String getDestinationFile(final String[] args) { ... }
    
    public static int doComputation(final OutputDestination destination,
                                    final String[] args) {
        destination.writeThing(42);
    } // doComputation

    // java Temp foo bar baz
    // args = { "foo", "bar", "baz" }
    public static void main(final String[] args) {
        final boolean userWantsConsole = doesUserWantConsole(args);
        final String destinationFile = getDestinationFile(args);
        //final OutputDestination destination = new OutputDestination(userWantsConsole, destinationFile);
        final OutputDestination destination = OutputDestination.makeDestination(userWantsConsole, destinationFile);
        
        final int result = doComputation(destination, args);

        destination.writeThing(result);
    } // main
} // Temp

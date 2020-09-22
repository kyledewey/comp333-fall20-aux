import java.io.File;
import java.io.FileOutputStream;

// java Temp foo bar baz
// args = { "foo", "bar", "baz" }
public class Temp {    
    public static int doComputation(final OutputDestination destination,
                                    final String[] args) {
        destination.printThing(42);
    } // doComputation
    
    public static void main(final String[] args) {
        final boolean userWantsConsole = doesUserWantConsole(args);
        final String destinationFile = getDestinationFile(args);
        //final OutputDestination destination = new OutputDestination(userWantsConsole, destinationFile);
        final OutputDestination destination = OutputDestination.makeDestination(userWantsConsole, destinationFile);
        
        // do some computation
        final int result = doComputation(destination, args);

        destination.printThing(result);
        
        //printThing(userWantsConsole, destinationFile, result);
    } // main
} // Temp

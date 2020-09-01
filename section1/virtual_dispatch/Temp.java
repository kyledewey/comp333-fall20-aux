import java.io.File;
import java.io.FileOutputStream;

// java Temp foo bar baz
// args = { "foo", "bar", "baz" }
public class Temp {
    // Issues:
    // 1.) userWantsConsole and destinationFile keep getting repeated and passed around
    // 2.) userWantsConsole and destinationFile are closely related
    // 3.) userWantsConsole and destinationFile are somewhat conflicting (destinationFile doesn't
    //     make sense if userWantsConsole == true)
    // 4.) Repeated closing and opening of file hurts performance
    // 5.) Overwriting file each time we write right now
    public static void printThing(final boolean userWantsConsole,
                                  final String destinationFile,
                                  final int thingToPrint) {
        if (userWantsConsole) {
            System.out.println(42);
        } else {
            final File file = new File(destinationFile);
            final FileOutputStream stream = new FileOutputStream(file);
            stream.writeln(42);
            stream.close();
        }
    } // printThing
    
    public static int doComputation(final boolean userWantsConsole,
                                    final String destinationFile,
                                    final String[] args) {
        printThing(userWantsConsole, destinationFile, 42);
    } // doComputation
    
    public static void main(final String[] args) {
        final boolean userWantsConsole = doesUserWantConsole(args);
        final String destinationFile = getDestinationFile(args);

        // do some computation
        final int result = doComputation(userWantsConsole, destinationFile, args);

        // result = 7; // error: result is final; cannot reassign

        printThing(userWantsConsole, destinationFile, result);
    } // main
} // Temp
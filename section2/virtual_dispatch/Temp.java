import java.io.File;
import java.io.FileOutputStream;

public class Temp {
    public static boolean doesUserWantConsole(String[] args) { ... }
    public static String getDestinationFile(String[] args) { ... }

    public static void writeThing(boolean userWantsConsole,
                                  String destinationFile,
                                  int thing) {
        if (userWantsConsole) {
            System.out.println(thing);
        } else {
            File file = new File(destinationFile);
            FileOutputStream stream = new FileOutputStream(file);
            stream.writeln(thing);
            stream.close();
        }
    } // writeThing
    
    public static int doComputation(boolean userWantsConsole,
                                    String destinationFile,
                                    String[] args) {
        writeThing(userWantsConsole, destinationFile, 42);
    } // doComputation
    
    // java Temp foo bar baz
    // args = { "foo", "bar", "baz" }
    public static void main(String[] args) {
        boolean userWantsConsole = doesUserWantConsole(args);
        String destinationFile = getDestinationFile(args);
        
        int result = doComputation(args);

        writeThing(userWantsConsole, destinationFile, result);
    } // main
} // Temp

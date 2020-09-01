import java.io.File;
import java.io.FileOutputStream;

public class Temp {
    public static boolean doesUserWantConsole(String[] args) { ... }
    public static String getDestinationFile(String[] args) { ... }

    // Issues:
    // 1.) userWantsConsole and destinationFile keep getting passed around
    // 2.) userWantsConsole and destinationFile are closely related
    // 3.) destinationFile doesn't make sense if userWantsConsole == true
    // 4.) open/closes files each time, which is expensive
    // 5.) we need to append to the end of the file, not overwrite it every time
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
        
        int result = doComputation(userWantsConsole, destinationFile, args);

        writeThing(userWantsConsole, destinationFile, result);
    } // main
} // Temp

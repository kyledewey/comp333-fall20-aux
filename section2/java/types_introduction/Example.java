// JavaScript: dynamically typed, strongly typed
//   - Types are associated values
//     - 5: int
//     - "foo": String
// Java: statically typed, strongly typed
//   - Types are associated values
//     - 5: int
//     - "foo": String
//   - Types are ALSO associated with variables
//     - int x; String y; Object z; ImmutableList list;
// C: statically typed, weakly typed
//   - Weak typing: the type might not be correct;
//     the type can lie
// Assembly: untyped
//
// x86: AH, AL, AX, EAX, RAX
// RAX (64 bits): [            EAX (lower 32 bits)   AH AL]

// C has "undefined behavior"

// static: happens at compile time
// dynamic: happens at runtime

// type inference: statically typed, but less explicit

// > let x = 5
// undefined
// > x
// 5
// > x + 1
// 6
// > x = "foo"
// 'foo'
// > x
// 'foo'

public class Example {
    //public static (Int OR String?) foo() {

    public static int add(int x, int y) {
        return x + y;
    }
    
    public static void main(String[] args) {
        int[] arr = new int[3];
        arr[0] = 5;
        arr[1] = 7;
        arr[2] = 3;
        System.out.println(arr[700052]);

        MyReallyLongClassNameThatWowTheCharacterLimitHurts x =
            new MyReallyLongClassNameThatWowTheCharacterLimitHurts();
        
        //ArrayList<String> arr = new ArrayList<String>();
    }
}

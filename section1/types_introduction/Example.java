// JavaScript: dynamically typed, strongly typed
//    - Types are associated with values
//       - 5: int
//       - true: boolean
//    - Types are NOT associated with variables
//    - (Strongly typed): types don't lie
// Java: statically typed, strongly typed
//    - Types are associated with values
//       - 5: int
//       - true: boolean
//    - Types are ALSO associated with variables
//       - int x; String y; Object z; Cons list;
//    - (Strongly typed): types don't lie
// C: statically typed, weakly typed
//    - (Weakly typed): types can lie (an int might not be an int)
//
// type inference: static typing, but you don't need to explicitly
// write the types (e.g., Scala, Swift, modern C++ with auto)

// Static: happens at compile time
// Dynamic: happens at runtime
//
// "typeless"; "untyped"
//
// untyped: there are no types ever.  Assembly languages.
// untyped _sometimes_ can mean dynamically typed (but this is a bad)



// JavaScript output:
// > let x = 5;
// undefined
// > x
// 5
// > x + 1
// 6
// > x = "foo"
// 'foo'
// > x
// 'foo'
// > 

public class Example {
    public int add(int x, int y) {
        return x + y;
    }
    
    public static void main(String[] args) {
        int x = 5;

        int[] array = new int[3];
        array[0] = 0;
        array[1] = 2;
        array[2] = 90;

        System.out.println(array[70002]);
    }
}

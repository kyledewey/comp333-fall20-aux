// algebraic data types - in functional languages

// we need a way to introduce a Bool
let b1: Bool = true;
let b2: Bool = false;

// one type (Bool), two constructors of that type - true and false
// look at booleans with if/else
//
// We need a way to execute different code depending on what the specific
// Bool value is.
// if (b) {
//   print("b is true");
// } else {
//   print("b is false");
// }
//
// algebraic data types: generalize what a boolean (or boolean-like type)
//
// type color_in_traffic_light = { red, yellow, green }
//
// red, yellow, and green are _constructors_ of color_in_traffic_light
//
// type Bool = { true, false }
//
// let value: color_in_traffic_light = red;
// switch (value) {
//   case red:
//     ...
//   case yellow:
//     ...
//   case green:
//     ...
// }
//
// switch (boolean) {
//   case true:
//     ...
//   case false:
//     ...
// }
//
// type IntList = { Nil, Cons(Int, IntList) }
//
// public interface IntList {}
// public class Cons implements IntList {
//   public final int value;
//   public final IntList rest;
//   public Cons(final int value,
//               final IntList rest) {
//     this.value = value;
//     this.rest = rest;
//   }
// public class Nil impelemnts IntList {}
//
// final Cons c = new Cons(5, new Nil());
//
// final IntList c = Cons(5, Nil);

// Haskell has algebraic data types
// Swift and Rust have algebraic data types.  They both use "enum" - just like C/C++/Java!

// Not possible with regular enums - can't hold data
// type IntList = { Nil, Cons(Int, IntList) } 

// type color_in_traffic_light = { red, yellow, green }

// enums are popular
enum ColorInTrafficLight {
    // each case is one constructor
    case red
    case yellow
    case green
}

// let value: color_in_traffic_light = red;
let temp: Int = 47;
let myVariable: ColorInTrafficLight = ColorInTrafficLight.yellow;

// if (value == red) {
//   ...
// } else if (value == yellow) {
//   ...
// } else if (value == green) {
//   ...
// }

switch (myVariable) {
    case .red:
        print("it's red");
    case .yellow:
        print("it's yellow");
    case .green:
        print("it's green");
}

enum ContainsOther {
    case isABoolean(Bool)
    case isAnInteger(Int)
}

enum UhOh {
    case isABoolean(Bool)
}

//let value = ContainsOther.isABoolean(true);
var value: ContainsOther = ContainsOther.isAnInteger(8);
//value = ContainsOther.isABoolean(true);

// switch performs pattern matching
// switch performs exhaustivity checking
switch value {
    case .isABoolean(let b):
        print(b)
    case .isAnInteger(7):
        print("lucky seven")
    case .isAnInteger(_):
        print("it's some other integer")
    case _:
        print("catch-all")
}

let x = 0;

switch x {
    case 0:
        print("it's zero")
    case 1:
        print("it's one")
    case _:
        print("it's something else")
}

let y: Int = 7;
let z: Int? = nil;

// Java
// Object obj = ...; // obj could be null

// Concerns #A
// Concerns #B
// Class MyClass is used in both #A and #B -> MyClass will get methods specific to #A and #B
// Anti-patterns: God class (common issue if everything is virtual dispatch)

indirect enum IntTree {
    case leaf(Int)
    case internalNode(IntTree, Int, IntTree)
}

var myTree: IntTree = IntTree.leaf(7);
myTree = IntTree.internalNode(IntTree.leaf(1), 2, IntTree.leaf(3));

func getSum(tree: IntTree) -> Int {
    switch tree {
        case .leaf(let value):
            return value
        case .internalNode(let leftTree, let value, let rightTree):
            return getSum(tree: leftTree) + value + getSum(tree: rightTree)
    }
}

print(getSum(tree: myTree))

// Java
// public interface IntTree {}
// public class Leaf implements IntTree {
//   public final int value;
//   public Leaf(final int value) { this.value = value; }
// }
// public class InternalNode implements IntTree {
//   public final IntTree left;
//   public final int value;
//   public final IntTree right;
//   public InternalNode(final IntTree left, final int value, final IntTree right) {
//     this.left = left; this.value = value; this.right = right;
//   }
// }

indirect enum MyList
{
	case Cons(Int, MyList)
	case Nil
}

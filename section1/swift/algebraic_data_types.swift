// Algebraic Data Types
// need: a way to introduce the type and its constructors
// type TrafficLightColor = { red, green, yellow }
// enum is short for "enumeration" 
enum TrafficLightColor {
    case red
    case green
    case yellow
}

// switch implements pattern matching - this is how look at a value of the type
// switch performs exhaustivity checking
let value: TrafficLightColor = TrafficLightColor.green;
/*
switch value {
    case .red:
        print(0);
    case _:
        print(1);
//    case .yellow:
//        print(1);
//    case .green:
//        print(2);
}
*/

enum ContainsOther {
    case isABoolean(Bool)
    case isAnInteger(Int)
}

let containsOtherValue: ContainsOther = ContainsOther.isAnInteger(5);
switch containsOtherValue {
    case .isABoolean(let b):
        print(b)
    case .isAnInteger(let i):
        print(i)
}

indirect enum IntTree {
    case leaf(Int)
    case internalNode(IntTree, Int, IntTree)
}

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

indirect enum MyList {
  case empty
  case Cons(Int, MyList)
}

let optionalInt: Int? = nil;
let optionalInt2: Int? = 7;

// Java
// Object obj; // obj could be null

// Swift
// let obj: Object? = ...;

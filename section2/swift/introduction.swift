// a: Int is the same thing as "int a"
// b: Int is the same thing as "int b"
// Swift: local type inference (usually what languages have)
//    - Has subtyping
// Java:
//    Object x = "SomeString";
//    what is the type of x? - String, Object
// Haskell: global type inference
//    - Does NOT have subtyping
func subtract(a: Int, b: Int) -> Int {
    // temp: Int
    // let temp = a - b;
    // type inference ^
    let temp = a - b;
    //temp = 27.82;
    return temp;
}

print(subtract(a: 1, b: 2))

// someComplexFunction(first: 1, second: 2)

// auto x = 1 + 2;
// int x = 1 + 2;
//
// Rough equivalent in Java
// public static int subtract(int a, int b) {
//    final int temp = a - b;
//    return temp;
// }

func subtract2(firstLabel first: Int, secondLabel second: Int) -> Int {
    return first - second;
}

print(subtract2(firstLabel: 3, secondLabel: 1))


func subtract3(_ first: Int, _ second: Int) -> Int {
    return first - second;
}

print(subtract3(3, 1))

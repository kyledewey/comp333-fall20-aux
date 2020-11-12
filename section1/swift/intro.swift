// public static int subtract(int first, int second) {
func subtract(_ first: Int, _ second: Int) -> Int {
    // delcares a local variable
    // temp is of type Int
    // type inference
    // int temp = first = second;
    let temp = first - second;
    return temp;
}

print(subtract(2, 1))

func add(_ leftToAdd: Int, _ rightToAdd: Int) -> Int {
    return leftToAdd + rightToAdd;
}

add(2, 3)

func sub(a: Int, b: Int) -> Int { return a - b; }

func callsAnother(f: (Int, Int) -> Int, first: Int, second: Int) -> Int {
    return f(first, second);
}

print(callsAnother(f: add, first: 7, second: 3))
print(callsAnother(f: +, first: 8, second: 1))
print(callsAnother(f: sub, first: 2, second: 1))

func returnsAddSomething(first: Int) -> ((Int) -> Int) {
    return { b in first + b };
}

print(callsAnother(f: { (a, b) in a * b }, first: 2, second: 3))

// { (a, b) in a * b }
// (a, b) => a * b
// function (a, b) { return a * b; }


// 1 + 2
// +(1, 2)

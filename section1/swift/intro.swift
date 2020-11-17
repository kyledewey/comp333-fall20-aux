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

func takesFunctionWithNoArgs(f: () -> Int) -> Int {
    //return f();
    return 42;
}

func infiniteLoop() -> Int {
    while true {}
    return 7;
}

//let a: (() -> Int) -> Int = takesFunctionWithNoArgs;
//takesFunctionWithNoArgs(f: { 2 + 2 });

print(takesFunctionWithNoArgs(f: { 1 + 1 }))
print(takesFunctionWithNoArgs(f: infiniteLoop));

//print(takesFunctionWithNoArgs(f: 1 + 1))

let b1: Bool = false;
if (b1) {
    print("in true");
} else {
    print("in false");
}
let temp: Int = (b1) ? 72 : 89;
print(temp);

func returnsNothing(x: Int) {
    print(x);
}

func returnsTuple() -> (Int, String, Bool) {
    let temp = (17, "foo", true);
    case let (a, b, c) = temp;
}

func indirectIf(_ a: Bool, ifTrue: () -> Int, ifFalse: () -> Int) -> Int {
    return (a) ? ifTrue() : ifFalse();
    /*
	if a {
		return ifTrue();
	} else {
		return ifFalse();
	}*/
}

print(indirectIf(true, ifTrue: { 1 + 1 }, ifFalse: { 2 + 2 })) // should be 2
print(indirectIf(false, ifTrue: { 3+3 }, ifFalse: { 4 + 4 })) // should be 8

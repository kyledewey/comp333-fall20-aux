/*func subtract(a: Int, b: Int) -> Int {
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
*/

func sub(_ a: Int, _ b: Int) -> Int {
    return a - b;
} 

func callOther(f: () -> Int) -> Int {
    return f()
}

func returns7() -> Int { return 7; }

//print(callOther(f: returns7))


func callForward(f: (Int, Int) -> Int, param: Int) -> Int {
    return f(param, param)
}

func plus(a: Int, b: Int) -> Int { return a + b; }

/*print(callForward(f: plus, param: 2))
print(callForward(f: +, param: 3))
print(callForward(f: -, param: 4))
print(callForward(f: { (a, b) in a * b }, param: 5))*/

// function makeAddSomething(param) {
//   return otherParam => param + otherParam;
// }
// --OR--
// function makeAddSomething(param) {
//   return function (otherParam) {
//     return param + otherParam;
//   }
// }

/*
func makeAddSomething(param: Int) -> ((Int) -> Int) {
    return { otherParam in param + otherParam }
}

let f1 = makeAddSomething(param: 1);
let f2 = makeAddSomething(param: 2);
print(f1(5));
print(f2(5));
*/

func callsFunc(f: (Int) -> Int, i: Int) -> Int {
  let temp = f(i)
  return temp
}

print(callsFunc(f: { a in 1 + a }, i: 5))

//let temp = { a in a };
let temp = { (a: Double) in a + 1 };
temp(4.3);
//let temp = 1 + 2.2;
//print(temp)

let t: Bool = true;
let f = false;

if 1 > 0 {
    print("foobar");
} else {
    print("baz");
}

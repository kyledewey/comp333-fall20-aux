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

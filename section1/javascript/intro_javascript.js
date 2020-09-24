function returnsNothing() {}

function foo() {
    return 1 + 2;
}

// V8: Chrome's JavaScript engine
// node is a fork of V8
function bar(x, y) {
    return x + y;
}

function printAllLessThanFive(arr) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (arr[index] < 5) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

function printEverythingThatIsNotThisString(arr, thisString) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (arr[index] !== thisString) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

function printAllGreaterThanValue(arr, value) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (arr[index] > value) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

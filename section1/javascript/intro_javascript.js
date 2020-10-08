function returnsNothing() {}

function foo() {
    return 1 + 2;
}

// V8: Chrome's JavaScript engine
// node is a fork of V8
function bar(x, y) {
    return x + y;
}

// higher-order function, in contrast to first-order functions
// distinction: is a function data?
function printAllMatchingCondition(arr, condition) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (condition(arr[index])) {
            console.log(arr[index]);
        }
    }
}

function isLessThanFive(e) {
    return e < 5;
}

function printAllLessThanFive(arr) {
    printAllMatchingCondition(arr, isLessThanFive);
    // let condition = function (e) {
    //     return e < 5;
    // };
    // printAllMatchingCondition(arr, condition);
    //printAllMatchingCondition(arr, function (e) { return e < 5; });
}

// Original version - doesn't use printAllMatchingCondition
// function printAllLessThanFive(arr) {
//     let index;
//     for (index = 0; index < arr.length; index++) {
//         if (arr[index] < 5) {
//             // System.out.println(arr[index]);
//             console.log(arr[index]);
//         }
//     }
// }

function printEverythingThatIsNotThisString(arr, thisString) {
    let f = function (foobar) {
        return foobar !== thisString;
    };
    printAllMatchingCondition(arr, f);
    // let index;
    // for (index = 0; index < arr.length; index++) {
    //     if (arr[index] !== thisString) {
    //         // System.out.println(arr[index]);
    //         console.log(arr[index]);
    //     }
    // }
}

function printAllGreaterThanValue(arr, value) {
    let f = function (element) {
        return element > value;
    };
    //foobar(27);
    printAllMatchingCondition(arr, f);
    // let index;
    // for (index = 0; index < arr.length; index++) {
    //     if (arr[index] > value) {
    //         // System.out.println(arr[index]);
    //         console.log(arr[index]);
    //     }
    // }
}

// global variable
//f = "blah";

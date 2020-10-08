function returnsNothing() {}

function foo() {
    return 1 + 2;
}

function bar(x, y) {
    return x + y;
}

function baz() {
    let b = 17;

    // c
    
    // if (some condition) {
    //     let a = 12; // only in scope in this block
    // } else {
    //     var c = 87; // in scope throughout all of baz
    // }
    
    return b;
}

// higher-order functions: functions are data
// something is a higher-order function if it treats functions
// as data (assigns a function to a variable, takes a function
// as a parameter, returns a function)
function printAllMatchingCondition(arr, condition) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (condition(arr[index])) {
            console.log(arr[index]);
        }
    }
}

function printAllLessThanFive(arr) {
    let foobar = (function (element) {
        return element < 5;
    });
    
    printAllMatchingCondition(arr, foobar);
}

function printAllNotEqualThisValue(arr, value) {
    let f = function (e) {
        return e !== value;
    };
    printAllMatchingCondition(arr, f);
}

function printAllGreaterThan(arr, value) {
    let f = function (e) {
        return e > value;
    };
    printAllMatchingCondition(arr, f);
}

// Original version: no use of higher-order functions
// function printAllLessThanFive(arr) {
//     let index;
//     for (index = 0; index < arr.length; index++) {
//         if (arr[index] < 5) {
//             // System.out.println(arr[index]);
//             console.log(arr[index]);
//         }
//     }
// }

// Original version: no use of higher-order functions
// function printAllNotEqualThisValue(arr, value) {
//     let index;
//     for (index = 0; index < arr.length; index++) {
//         // != has the same issue as ==
//         // !== behaves like ===
//         if (arr[index] !== value) {
//             // System.out.println(arr[index]);
//             console.log(arr[index]);
//         }
//     }
// }

// Original version: no use of higher-order functions
// function printAllGreaterThan(arr, value) {
//     let index;
//     for (index = 0; index < arr.length; index++) {
//         // != has the same issue as ==
//         // !== behaves like ===
//         if (arr[index] > value) {
//             // System.out.println(arr[index]);
//             console.log(arr[index]);
//         }
//     }
// }

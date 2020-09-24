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

function printAllLessThanFive(arr) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (arr[index] < 5) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

function printAllNotEqualThisValue(arr, value) {
    let index;
    for (index = 0; index < arr.length; index++) {
        // != has the same issue as ==
        // !== behaves like ===
        if (arr[index] !== value) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

function printAllGreaterThan(arr, value) {
    let index;
    for (index = 0; index < arr.length; index++) {
        // != has the same issue as ==
        // !== behaves like ===
        if (arr[index] > value) {
            // System.out.println(arr[index]);
            console.log(arr[index]);
        }
    }
}

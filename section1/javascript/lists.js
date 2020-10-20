// filter
function filterLike(arr, condition) {
    let index;
    for (index = 0; index < arr.length; index++) {
        if (condition(arr[index])) {
            // add to return result
        }
    }
    // return whole result
}

function findSum(arr) {
    // arr.reduce((sum, e) => sum + e, 0)
    let sum = 0;
    let index;

    for (index = 0; index < arr.length; index++) {
        sum = sum + arr[index];
    }
    return sum;
}

function findProduct(arr) {
    // arr.reduce((product, e) => product + e, 1)
    let product = 1;
    let index;

    for (index = 0; index < arr.length; index++) {
        product = product * arr[index];
    }
    return product;
}

// concatenateAll(['foo', 'bar', 'baz']) === 'foobarbaz'
function concatenateAll(arr) {
    // arr.reduce((concat, e) => concat + e, "")
    let concat = "";
    let index;

    for (index = 0; index < arr.length; index++) {
        concat = concat + arr[index];
    }
    return concat;
}

function reduce(arr, operation, initialValue) {
    let accumulator = initialValue;
    let index;

    for (index = 0; index < arr.length; index++) {
        accumulator = operation(accumulator, arr[index]);
    }
    return accumulator;
}

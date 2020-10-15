// Produce the smallest element in arr.  You may assume
// that no element is greater than 0 (hint: use reduce).
function findSmallest(arr) {
    let result = 0;
    let index;
    for (index = 0; index < arr.length; index++) {
        result = (arr[index] < result) ? arr[index] : result;
        // if (arr[index] < result) {
        //     result = arr[index];
        // }
    }
    return result;
}

function findSum(arr) {
    let result = 0;
    let index;
    for (index = 0; index < arr.length; index++) {
        result = result + arr[index];
    }
    return result;
}

function findSum2(arr) {
    let reducer = function (result, currentValue) {
        return result + currentValue;
    };
    return arr.reduce(reducer, 0);
}

function findSum3(arr) {
    //return arr.reduce((result, currentValue) => result + currentValue, 0);
    return arr.reduce((accum, e) => accum + e, 0);
}

function appendAllAsStrings(arr) {
    let result = "";
    let index;
    for (index = 0; index < arr.length; index++) {
        result = result + arr[index].toString();
    }
    return result;
}

function appendAllAsStrings2(arr) {
    return arr.reduce((accum, e) => accum + e.toString(), "");
}

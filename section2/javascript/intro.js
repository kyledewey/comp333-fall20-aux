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

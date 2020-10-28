// how to use: add(1, 2)
// add = function(x, y) {
//     return x + y;
// }
function add(x, y) {
    return x + y;
}

// creates constructors on the fly
function weird(param) {
    return function () {
        this.myField = param;
    }
}

function test() {
    return console.log(123);
}

// how to use: new MyObject(3)
function MyObject(myField) {
    // semantics of constructor call: `this` is bound to a new, empty object
    this.myField = myField;
}

MyObject.prototype.addMyField = function (param) {
    // semantics of method call: `this` is bound to the object it was called on
    return param + this.myField;
};
// NOT __proto__


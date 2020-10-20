// how to use: add(1, 2)
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
    this.myField = myField;
    this.addMyField = function (param) {
        return param + this.myField;
    };
}
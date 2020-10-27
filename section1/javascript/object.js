// constructor
function MyObject(param) {
    // by using the word `new`, `this` is initially bound to a new empty object
    // WITHOUT `new`, `this` is bound to the global object
    // as a method call (obj.method), `this` is bound to `obj`
    this.param = param;
}
MyObject.prototype.getParam = function() {
    return this.param;
}

    

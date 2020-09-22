// static typing: error: returned something of the wrong type
// dynamically typed: ok.
function foo() {
    if (some condition) {
        return 42;
    } else {
        return "blah";
    }
}

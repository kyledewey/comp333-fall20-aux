function AddThis(x) { this.x = x; }
AddThis.prototype.add = function (y) { return this.x + y; }
//AddThis.prototype.sub = function (y) { return y - this.x; }

let withOne = new AddThis(1);

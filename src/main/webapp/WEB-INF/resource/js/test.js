var F = function() {};
Object.prototype.a = function() {
	console.log(1)
};
Function.prototype.b = function() {
	console.log(1)
};
var f = new F();
f.a();
f.b();
// console.log(w)
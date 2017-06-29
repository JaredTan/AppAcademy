Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

[1, 2, 3,4,5,100].myEach(function(el) {
  console.log((el + 100));
}); // => 6

Array.prototype.myMap = function(callback) {
  const newArr = [];
  // console.log(this.myEach(callback));
  this.myEach( el => newArr.push(callback(el)) );
  return newArr;
};

([1, 2, 3,4,5,100].myMap(function(el) {
  return (el + 100);
})); // => 6

Array.prototype.myReduce = function(callback, initialValue){
  const newArr = [];
  let result = initialValue;
  console.log(result);
  if (!initialValue){
    result = this[0];
    this.slice(1).myEach(function(el){result = callback(result,el);
    });
  }
  else {
    this.myEach(function(el){result = callback(result,el);
    });}
    return result;
};

console.log(NUMS.myReduce( (total, item) => total + item ));
// const NUMS = [1, 2, 3, 4, 5];

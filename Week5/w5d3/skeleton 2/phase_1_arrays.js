 Array.prototype.my_uniq = function () {
  let newArr = [];
  this.forEach ( el => {
    // console.log(el);
    // console.log(newArr);
    if (!newArr.includes(el)) {
      newArr.push(el);}
  });
  return newArr;
};

console.log([1,1,1,2,3].my_uniq());

Array.prototype.my_two_sum = function(){
  let newArr = [];
  for (let i = 0; i < this.length -1; i++) {
    for (let j = i + 1; j < this.length; j++){
      if (this[i] + this[j] === 0) {
        newArr.push([i,j]);
      }
    }
  }
  return newArr;
};

console.log([1,-1,-1,2,-3].my_two_sum());

[
[1, 2, 3],
[4, 5, 6],
]

[
[1, 4],
[2, 5],
[3, 6]
]

Array.prototype.myTranspose = function() {
  let newArr = new Array(this[0].length);
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[0].length; j++){
      if (!newArr[j]) {
        newArr[j] = [];
      }
      newArr[j].push(this[i][j]);
      }
    }
  return newArr;

};

console.log([
[1, 2, 3],
[4, 5, 6],
].myTranspose());


const columns = Array.from(
    { length: 4 },
    () => Array.from({ length: 4 })
  );

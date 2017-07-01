
function sum() {
  let newArr = Array.from(arguments);
  return newArr.reduce( (acc, el) => acc + el );
  }

// console.log(sum(1,2,3,69));

// Function.prototype.myBind = function(context) {
//   let firstArgs = Array.from(arguments).slice(1);
//   return (...args) => this.apply(context, args.concat(firstArgs));
// };
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//

Function.prototype.curry = function(num) {
  let args = [];
  let curriedFunc = (arg) => {
    args.push(arg);
    if (args.length === num) return this(...args);
    return curriedFunc;
  };
  return curriedFunc;
};

//
// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }
//
// sumThree(4, 20, 6); // == 30
//
// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
//
// // or more briefly:
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30

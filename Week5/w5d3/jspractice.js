Object Oriented Javascript

function NBAPlayer(name, team, pos) {
  this.name = name
  this.team = team
  this.pos = pos

}

const curry = new NBAPlayer(...)

NBAPlayer.prototype.dunk = function(){}
curry.__proto__ === NBAPlayer.prototype


function soundMaker(sound, times) {

//closure
  function makeSound() {
    console.log(`${sound}`);
  }


  for(let i = 0; i < times; i++) {
    makeSound();
  }
}

soundMaker("woof", 5)


function summation(arr) {
  let sum = 1;

  function summer() {
    for(let i = 0; i < arr.length; i++) {
      sum += arr[i];
    }
  }

  summer();

  return sum;
}

console.log(summation([1,2,3,4]));


let callback = function() {
  console.log("It has been 5 seconds");
}
let time ToWait = 5000; //ms
global.setTimeout(callback, timeToWait);

//or

global.setTimeout(function()  {
  console.log("It has been 5 seconds!")

}, 5000);

//ES6!!

global.setTimeout(() => {
  console.log("It has been 5 seconds!");
}, 5000);

//PREF SYNTAX

window.setTimeout(function() {
  alert('Hammer Time');
}, 5000);

function HammerTime(time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, 5000);
}

HammerTime('5pm')

//Ask user if they want tea and biscuits

const readline = require('readline');
//like require in ruby!

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// get i/o from user!
function teaAndBiscuits () {
  reader.question('Would you like some tea?', function(res) {
    console.log(`You replied ${res}.`);
    reader.question(`Would you like some biscuits?`, function(res2) {
      console.log(`You replied ${res2}.`);
      if (res1 === 'yes') {
      const first = 'do'
    }
      else {
        const first = 'don\'t';
      }
      if (res2 === 'yes') {
        const second = 'do'
      }
      else {
        const second = 'don\t';
      }
      console.log(`You ${res} want tea and you ${res2} want biscuits.`)
      reader.close();
    });
  });
}


function Cat () {
  this.name = 'Markov';
  this.age = '3';
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I am chasing ${cat.name}!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
//this set to Noodles

Noodles.chase.call(Markov, Noodles);

//this set to Markov

Noodles.chase.apply(Markov, Noodles);
//this too??

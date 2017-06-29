function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1();
// in block, in block!

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2();
// in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3();
// Syntax Error


function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4();

// in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}


mysteryScoping5();
// Syntax Error



function madLib(verb, adjective, noun) {
  return `We Shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzbuzz(array) {
  // capture the array first!
  const Arr = [];
  array.forEach(el => {
    if (( el % 3 === 0 || el % 5 === 0 ) && el % 15 ! 0) {
      Arr.push(el);
    }
  });
  return Arr
}

function isPrime(n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++ ) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  //define variables first!!
  let sum = 0;
  let primes = 0;
  let i = 2;

  while (primes < n) {
    if (isPrime(i)) {
      sum += i;
      primes ++;
    }
    i++;
  }
  return sum;
}


function titleize(nameArray, callback) {
  let titles = nameArray.map(name =>
    `Mx. ${name} Jingleheimer Schmidt`
  );
  callback(titles);
}

titleize(["Mary", "Brian", "Leo"], (nameArray) => {
  nameArray.forEach(name => console.log(name));
});

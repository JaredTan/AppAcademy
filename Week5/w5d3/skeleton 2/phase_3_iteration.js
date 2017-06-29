Array.prototype.bubblesort = function(){
  let sorted = false;
  while(!sorted) {
    sorted = true;
    for(let i = 0; i < this.length -1; i++){
      for(let j = i+1; j < this.length; j++){
        if(this[i] > this[j]) {
          sorted = false;
          let variable = this[j];
          this[j] = this[i];
          this[i] = variable;
        }
      }
  }
  }
  return this;
};

[9,0,3,1,5].bubblesort();

String.prototype.substrings = function() {
  let newArr = [];
  for ( let i = 0; i < this.length; i++) {
    for ( let j = i; j <= this.length; j++) {
      if (!newArr.includes(this.slice(i,j))) {
        newArr.push(this.slice(i,j));
      }
    }
  }
  return newArr;
};

'hello'.substrings();

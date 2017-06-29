function range(start, end) {
  if (start === end) {
    return [start];
  }
  let newThing = range(start+1, end);
  (newThing.push(start));
  return newThing;
}

range(5,10);

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return sumRec(arr.slice(1)) + arr[0];
}

sumRec([1,2,33,15]);

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return exponent1(base, exp - 1) * base;
}

exponent1(2, 5);

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  } else {
    if (exp % 2 === 0) {
      return Math.pow(exponent2(base, exp / 2), 2);
    } else {
      return base * Math.pow(exponent2(base, ((exp - 1) / 2)), 2);
    }
  }
}

exponent2(2, 5);

function fibonacci(n) {
  if (n === 1){
    return [1];
  } else if (n === 2) {
    return [1,1];
  } else {
    let arr = fibonacci(n-1);
    let length = arr.length;
    arr.push(arr[length - 1] + arr[length -2]);
    return arr;
  }
}

fibonacci(7);


function bsearch(arr, target){
  if (arr.length === 0){
    return -1;
  }
  let midIdx = arr.length/2;
  if(arr[midIdx] > target){
    return bsearch(arr.slice(0,midIdx), target);
  }
  else if(arr[midIdx] === target) {
    return midIdx;
  }
  else
  {
    return bsearch(arr.slice(midIdx + 1), target) + midIdx + 1;
  }

}

bsearch([1,2,3,6,8,9],9);


function mergesort(arr) {
    if(arr.length < 2) {
      return arr;
    }
    let midIdx = arr.length/2;
    let left = arr.slice(0,midIdx);
    let right = arr.slice(midIdx);
    return merge(mergesort(left),mergesort(right));
}

function merge(left,right){
  let new_sub_arr = [];
  while (left.length > 0 && right.length > 0){
    if (left[0] <= right[0]){
      new_sub_arr.push(left[0]);
      left = left.slice(1);
    }
    else {
      new_sub_arr.push(right[0]);
      right = right.slice(1);
    }
  }

  return new_sub_arr.concat(left).concat(right)
}

mergesort([2,5,1,3,7,3,9,0]);
merge([2,5,8],[1,3,9]);

// def mergesort(arr)
//   return [] if arr.length == 0
//   mid = arr.length / 2
//   left = arr.take(mid)
//   right = arr.drop(mid)
//   merge(mergesort(left), mergesort(right))
// end
//
// def merge(left, right)
//   new_sub_arr = []
//   until left.empty? && right.empty?
//     if left.first <= right.first
//       new_sub_arr << left.pop
//     else
//       new_sub_arr << right.pop
//     end
//   end
//   return new_sub_arr
// end

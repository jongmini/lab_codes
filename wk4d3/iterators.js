// create a namespace for our iterator functions
var Iterators = (function() {
  return {
    each: function (array, action) {
      for (var i=0; i < array.length; i++)
      {
        action(array[i]);
      }
      return array;
    
      // implment the each iterator
      // such that action is applied
      // to each element on the array
      // to which this function was applied
      // this function should also return the 
      // original array untouched
    },
    map: function(array, action) {
      // var new_array=[]
      // for (var i=0; i < array.length; i++){
      //   new_array[i] = action(array[i]);
      // }
      // return new_array;

      var new_array=[]
      var i=0
      Iterators.each(array,function(x) 
      {
        new_array[i] = action(x);
        i++;
      })
      return new_array;


    
      // implement map iterator
      // such that action is applied
      // to each element on the array
      // returning a new array containing
      // the results of the applications
    },
    reduce: function(array, base, action) {
      // for (var i=0; i < array.length; i++){
      //   base = action(base,array[i]);
      // }
      // return base;
      var i=0
      Iterators.each(array,function(x,y) 
      {
        base = action(base,array[i]);
        i++;
      })
      return base;

      // as a BONUS, implement reduce
      // btw, reduce is an alias for inject :)
      
      // this function should take an array, a 
      // base value, and a combination action
      // function -- for example add and perform
      // the action on each successive element
    }
  };
})();

// declare the array
var arr = [1,2,3];

// should output
// 1
// 2
// 3
console.log("results of applying Iterators.each to arr:");
Iterators.each(arr, function (number) {
  console.log(number);
});

// should output
// => [1,2,3]
console.log("applying Iterators.each to arr should return the array:");
console.log(
  Iterators.each(arr, function (number) {
})
);

// should output
// [2, 4, 6]
console.log("results of applying Iterators.map to arr:");
console.log(
  Iterators.map(arr, function (number) {
    return number * 2;
  })
);

// should output
// false to indicate that the array returned
// by map is a different object than the array
// that had been passed in
console.log("arr and the array returned by map are identical:");
console.log(
  arr === Iterators.map(arr, function (number) {
    return number * 2;
  })
);

// should output arr's contents to indicate that map did not 
// modify the original array's contents
console.log("arr's contents:");
console.log(arr);

// BONUS: should output the sum
console.log("result of applying Iterators.reduce to arr with a sum function:");
console.log(
  Iterators.reduce(arr, 0, function (a, b) {
    return a + b;
  })
);

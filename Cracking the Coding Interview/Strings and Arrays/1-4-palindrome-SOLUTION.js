function isPermutationOfPalindrome(phrase) {
  var bitVector = createBitVector(phrase);
  return bitVector == 0 || checkExactlyOneBitSet(bitVector);
}

function createBitVector(phrase) {
  var bitVector = 0;
  for (var i=0; i<phrase.length; i++) {
    var x = getCharNumber(phrase[i]);
    bitVector = toggle(bitVector, x);
  }

  return bitVector;
}

function toggle(bitVector, index) {
  if (index < 0) return bitVector;

  var mask = 1 << index; //mask = 2^index

  //console.log("------------ " + index + " ------------")
  //console.log(bitVector.toString(2) + " & " + mask.toString(2));

  if ((bitVector & mask) == 0) {
    //console.log(index + " does not exists.")
    bitVector = bitVector | mask;
  } else {
    //console.log(index + " already exists.")
    bitVector = bitVector & ~mask; 
  }
  //console.log("return: " + bitVector.toString(2));
  return bitVector;

}

function getCharNumber(c) {
  var z = "z".charCodeAt(0);
  var a = "a".charCodeAt(0);
  var val = c.charCodeAt(0);
  if (val >= a && val<=z) {
    return val - a; //need to "shift" the unicode values down to start at 0;
  }

  return -1;

}

function checkExactlyOneBitSet(bitVector) {

  var checker = bitVector -1;
  console.log(bitVector.toString(2) + " & " + checker.toString(2))
  return (bitVector & (bitVector -1)) == 0;
}


var istrue = isPermutationOfPalindrome("aabb");
console.log(istrue)

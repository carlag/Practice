function palindrome(str) {
  var charCount = new Object();
  str = str.replace(/\s+/g, '');

  //find turning point
  var charCount = new Object();
  for (var i =0; i<str.length; i++) {
    var count = charCount[str.charAt(i)];
    if (count == undefined) {
      charCount[str.charAt(i)] = 1;
    } else {
      charCount[str.charAt(i)] = count + 1;
    }
  }


  var turningPointCount = 0;
  Object.keys(charCount).forEach(function (key) {
    var value = charCount[key]
    if (value%2 > 0) {
      turningPointCount++;
    }
  })

  return turningPointCount <= 1;
}

console.log(palindrome("abca"))

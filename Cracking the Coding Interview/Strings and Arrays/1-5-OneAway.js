//DOES NOT WORK
//FAILS FOR "HELLO" and "HELO"

function oneAway(string1, string2) {
  var lengths = stringLengths(string1, string2);
  var shorter = lengths.shorter;
  var longer = lengths.longer;

  if (longer.length - shorter.length > 1) return false;

  //iterate through shorter checking that there are no more than 2 changes
  var letterDifferences = 0;
  for (var i = 0; i<shorter.length; i++) {
    console.log("----------------")
    console.log(shorter[i] + " and " + longer[i]);
    console.log(shorter[i] + " and " + longer[i+1]);
    if ((shorter[i] != longer[i]) && (shorter[i] != longer[i+1])) {
      console.log("no match");
      letterDifferences++;
    }
  }

  return (letterDifferences + (longer.length - shorter.length)) <= 1;
}

function stringLengths(string1, string2) {
  if (string1.length < string2.length) {
    return {shorter: string1, longer: string2};
  }
  else {
    return {shorter: string2, longer: string1};
  }
}

var result = oneAway("hello","helo");
console.log(result);

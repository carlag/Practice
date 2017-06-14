function oneAway(string1, string2) {
  var lengths = stringLengths(string1, string2);
  var shorter = lengths.shorter;
  var longer = lengths.longer;

  if (longer.length - shorter.length > 1) return false;

  if (longer.length == shorter.length) {
    return oneEditReplace(string1, string2);
  }

  return oneEditInsert(shorter, longer);

}

function oneEditReplace(string1, string2) {
  var countReplacements = 0;
  for(var i = 0; i< string1.length; i++) {
    if (string1[i] != string2[i]) {
      if (countReplacements >= 1) {
        return false;
      }
      countReplacements++;
    }
  }
  return true;
}

function oneEditInsert(string1, string2) {
  //string1 must be shorter
  var index1 = 0;
  var index2 = 0;

  while(index1 < string1.length && index2 < string2.length) {
        if (string2[index2] != string1[index1]) {
          if (index1 != index2) {
            return false; //this means we have already made at least one insert
          }
          index2++;
        } else {
          index1++;
          index2++;
        }
  }

  return true;
}

function stringLengths(string1, string2) {
  if (string1.length < string2.length) {
    return {shorter: string1, longer: string2};
  }
  else {
    return {shorter: string2, longer: string1};
  }
}

var result = oneAway("pale","ple");
console.log(result);

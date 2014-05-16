

var returnTitle = function(name) {
  var nameUpperCase = name.charAt(0).toUpperCase() + name.substring(1);
  var nameArrays = nameUpperCase.split(" ");
  var titleArray = [];
  var notCapitals = ["a","an","for","after","but","the", "is"];

  nameArrays.forEach(function(nameArray) {
      if (notCapitals.indexOf(nameArray) >= 0) {
      titleArray.push(nameArray);
    } else {
      titleArray.push(nameArray.charAt(0).toUpperCase() + nameArray.substring(1));
    };
  });
  var words = titleArray.join(" ");
  return words;
};


$(function() {
  $("form#title-case").submit(function(event) {
    var title = $("input#title").val();
    var result = returnTitle(title);

    $(".title").text(result);

    $("#result").show();
    event.preventDefault();
  });
});

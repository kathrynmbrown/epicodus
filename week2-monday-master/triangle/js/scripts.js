var Triangle = {
  testIfValid: function() {
    if ((this.side1 > (this.side2 + this.side3))) {
      return false;
    } else if (this.side2 > (this.side1 + this.side3)){
      return false;
    } else if(this.side3 > (this.side2 + this.side1)) {
      return false;
    } else {
      return true;
    }
  },
  returnType: function() {
   if (this.side1 === this.side2 && this.side2 === this.side3) {
      return "equilateral";
    } else if (this.side1 === this.side2 || this.side2 === this.side3 || this.side1 === this.side3) {
      return "isosceles";
    } else {
      return "scalene";
    }
    return false;
  }

};


$(function() {
  $("form#triangle-lengths").submit(function(event){
    event.preventDefault();

    var side1 = parseInt($("input#new-side1").val());
    var side2 = parseInt($("input#new-side2").val());
    var side3 = parseInt($("input#new-side3").val());
    var newTriangle = Object.create(Triangle);
    newTriangle.side1 = side1;
    newTriangle.side2 = side2;
    newTriangle.side3 = side3;


    if (!newTriangle.testIfValid()) {
      alert("This is not a triangle. Try again please.");
    } else if (newTriangle.returnType() === "equilateral") {
      $("ul#equilateral").append("<li><span class='triangle'>" + newTriangle.side1 +", "+ newTriangle.side2+", "+newTriangle.side3+ "</span></li>");    
    } else if (newTriangle.returnType() === "isosceles") {
      $("ul#isosceles").append("<li><span class='triangle'>" + newTriangle.side1 +", "+ newTriangle.side2+", "+newTriangle.side3+ "</span></li>"); 
    } else if (newTriangle.returnType() === "scalene") {
      $("ul#scalene").append("<li><span class='triangle'>" + newTriangle.side1 +", "+ newTriangle.side2+", "+newTriangle.side3+ "</span></li>");
    };

    this.reset();
    
  });
});

describe('Triangle', function() {
  describe('type', function() {
    it('tells user what type of triangle corresponds with the measurements entered', function() {
      var testTriangle = Object.create(Triangle);
      testTriangle.sideOne = 4;
      testTriangle.sideTwo = 4;
      testTriangle.sideThree = 4;
      testTriangle.type().should.equal("equilateral");
    });
    it('tells user what type of triangle corresponds with the measurements entered', function() {
      var testTriangle = Object.create(Triangle);
      testTriangle.sideOne = 4;
      testTriangle.sideTwo = 3;
      testTriangle.sideThree = 3;
      testTriangle.type().should.equal("isosceles");
    });
    it('tells user what type of triangle corresponds with the measurements entered', function() {
      var testTriangle = Object.create(Triangle);
      testTriangle.sideOne = 4;
      testTriangle.sideTwo = 5;
      testTriangle.sideThree = 6;
      testTriangle.type().should.equal("scalene");
    });
  });
  describe('invalid', function() {
    it('returns invalid if the user enters invalid measurments for a triangle', function() {
      var testTriangle = Object.create(Triangle);
      testTriangle.sideOne = 9;
      testTriangle.sideTwo = 4;
      testTriangle.sideThree = 4;
      testTriangle.invalid().should.equal(false);
    });
  });  
});

describe('Triangle', function() {
  describe('returnType', function() {
    it("returns equilateral type when given three equal sides", function() {
      var equilateral = Object.create(Triangle);
      equilateral.side1 = 7;
      equilateral.side2 = 7;
      equilateral.side3 = 7;
      equilateral.returnType().should.equal("equilateral");
    });
    it("returns isosceles type when given two equal sides", function() {
      var isosceles = Object.create(Triangle);
      isosceles.side1 = 7;
      isosceles.side2 = 7;
      isosceles.side3 = 5;
      isosceles.returnType().should.equal("isosceles");
    });
    it("returns scalene type when given three diffrent sides", function() {
      var scalene = Object.create(Triangle);
      scalene.side1 = 7;
      scalene.side2 = 3;
      scalene.side3 = 5;
      scalene.returnType().should.equal("scalene"); 
    });
  });
  describe('testIfValid', function() {
     it("returns false when given one side that is larger than the other two combined", function() {
      var invalid = Object.create(Triangle);
      invalid.side1 = 4;
      invalid.side2 = 5; 
      invalid.side3 = 6;
      invalid.testIfValid().should.equal(true);
    });
  });   
});

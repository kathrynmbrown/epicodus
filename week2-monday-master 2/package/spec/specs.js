describe('Package', function() {
  describe('returnCost', function() {
    it("returns the cost of shipping a package", function() {
      var miscPackage = Object.create(Package);
      miscPackage.weight = 10;
      miscPackage.distance = 10;
      miscPackage.isInternational = true;
      miscPackage.returnCost().should.equal(120);
    });
    it("returns the cost of shipping a package", function() {
      var miscPackage = Object.create(Package);
      miscPackage.weight = 100;
      miscPackage.distance = -110;
      miscPackage.isInternational = false;
      miscPackage.returnCost().should.equal(120);
    });
  });   
});

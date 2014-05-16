describe('Contact', function() {
  describe('fullName', function() {
    it("returns the first and last name of the contact", function() {
      var jamesBrown = Object.create(Contact);
      jamesBrown.firstName = "James";
      jamesBrown.lastName = "Brown";
      jamesBrown.fullName().should.equal("James Brown");
    });
  });
});




describe('returnTitle', function() {
  it("the first letter of every word but is the will be capitilized", function(){
    returnTitle("is lauren a awesome").should.eql("Is Lauren a Awesome");
  });
});

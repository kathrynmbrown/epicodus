var Package = { 
  returnCost : function() {
    var cost = (10+(.10*(this.weight*this.distance)));
    if (this.isInternational === true) {
      return cost += 100;
    }
    return cost;
  }
};


$(function() {
  $("form#package-details").submit(function(event){
    event.preventDefault();

    var weight = parseInt($("input#weight").val());
    var distance = parseInt($("input#distance").val());
    var isInternational = $('#international').prop('checked');
    var newShipping = Object.create(Package);
    newShipping.weight = weight;
    newShipping.distance = distance;
    newShipping.isInternational = international;
    var finalPrice = newShipping.returnCost();

    $("h2#finalPrice").append(finalPrice);

    this.reset();
    
  });
});

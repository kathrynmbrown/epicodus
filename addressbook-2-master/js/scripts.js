var Contact = {
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
};

var Address = {
  fullAddress: function() {
    return this.street + ", " + this.city + ", " + this.state;
  }
};




$(document).ready(function() {

  $('#add-address').click(function() {
    $('#new-addresses').append('<div class="new-address">' +

                              '<div class="form-group">' +
                              '<label for="new-street">Street</label>' +
                              '<input type="text" class="form-control new-street">' +
                              '</div>' + 

                              '<div class = "form-group">' +
                                '<label for = "new-city">City</label>' +
                                '<input type = "text" class= "form-control new-city">' +
                              '</div>' + 

                              '<div class ="form-group">' +
                              '<label for = "new-state">State</label>' +
                              '<input type ="text" class="form-control new-state">' +
                              '</div>' +
                              '</div>')
  });







  $("form#new-contact").submit(function(event) {
    event.preventDefault();

    var inputtedFirstName = $("input#new-first-name").val();
    var inputtedLastName = $("input#new-last-name").val();




    var newContact = Object.create(Contact);
    newContact.firstName =  inputtedFirstName;
    newContact.lastName =  inputtedLastName;
    newContact.addresses = [];



    $(".new-address").each(function() {
      var inputtedStreet = $(this).find("input.new-street").val();
      var inputtedCity = $(this).find("input.new-city").val();
      var inputtedState = $(this).find("input.new-state").val();


      var newAddress = Object.create(Address);
      newAddress.street = inputtedStreet;
      newAddress.city = inputtedCity;
      newAddress.state = inputtedState;

      newContact.addresses.push(newAddress);
    });  



 $("#show-contact").click(function(event) {
    $("#edit-contact").show();
    event.preventDefault();
  });



     $("ul#contacts").append("<li><span class='contact'>" + newContact.fullName() + "</span></li>");

    $(".contact").last().click(function() {
      $("#show-contact").show(); 

      $("#show-contact h2").text(newContact.fullName());
      $(".first-name").text(newContact.firstName);
      $(".last-name").text(newContact.lastName);


  

    $("ul#addresses").text("");
    newContact.addresses.forEach(function(address) {
      $("ul#addresses").append("<li>" + address.fullAddress() + "</li>");
    });

  // $("#edit-contact").click(function(event) {
  //   var inputtedFirstName = $("input#new-first-name").val();
  //   alert(inputtedFirstName);
  //   var inputtedLastName = $("input#new-last-name").val();
  //   var inputtedStreet = $("input#form-control new-street").val();
  //   var inputtedCity = $("input#form-control new-city").val();
  //   var inputtedState = $("input#form-control new-state").val();

  //   $("#show-contact h2").text(inputtedFirstName + inputtedLastName);
  //     $(".first-name").text(inputtedFirstName);
  //     $(".last-name").text(inputtedLastName);

  //   event.preventDefault();

  // });

    // });


    this.reset();

  });
});



var Contact = {
  all: [],
  create: function(firstName, lastName) {
    var contact = Object.create(Contact);
    contact.initialize(firstName, lastName);
    Contact.all.push(contact);
    return contact;
  },

  initialize: function(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.addresses = [];
    this.phones = [];
  },

  createAddress: function(street, city, state) {
    var address = Object.create(Address);
    address.initialize(street, city, state);
    this.addresses.push(address);
    console.log(address);
    return address;
  },

  createPhoneNumber: function(number) {
    var phonenumber = Object.create(PhoneNumber);
    phonenumber.initialize(number);
    this.phones.push(phonenumber);
    console.log(phonenumber);
    return phonenumber;
  },

	fullName: function() {
		return this.firstName + " " + this.lastName;
	}
};

var Address = {
  all: [],
  create: function(street, city, state) {
    var address = Object.create(Address);
    address.initialize(street, city, state);
    Address.all.push(address);
    return address;
  },

  initialize: function(street, city, state) {
    this.street = street;
    this.city = city;
    this.state = state;
  },

	fullAddress: function() {
		return this.street + ", " + this.city + ", " + this.state;
	},
  validAddress: function() {
    if(this.street === "" || this.city === "" || this.state === "") {
      return false;
    } else {
      return true;
    }
  }
};

var PhoneNumber = {
  all: [],
  create: function(number) {
    var phonenumber = Object.create(PhoneNumber);
    phonenumber.initialize(number);
    PhoneNumber.all.push(phonenumber);
    return phonenumber;
  },

  initialize: function(number) {
    this.number = number;
  },

  showPhoneNumber: function() {
    return this.number.substr(0,3) + "-" + this.number.substr(3,3) + "-" + this.number.substr(6);
  },
  validPhone: function() {
    if(isNaN(this.number)) {
      return false;
    } else if(this.number.length === 10) {
      return true;
    } else {
      return false;
    }
  }
};


$(document).ready(function() {

var errorCounter = 0;

	$("#add-address").click(function() {
		$("#new-addresses").append('<div class="new-address">' +
            						          '<div class="form-group">' +
              							         '<label for="new-street">Street</label>' +
              							         '<input type="text" class="form-control new-street">' +
            						          '</div>' +
            					           	'<div class="form-group">' +
            						              '<label for="new-city">City</label>' +
            							            '<input type="text" class="form-control new-city">' +
            						          '</div>' +
            					           	'<div class="form-group">' +
            						            	'<label for="new-state">State</label>' +
            						            	'<input type="text" class="form-control new-state">' +
            						          '</div>' +
            					         '</div>');
	});

  $("#add-phoneNumber").click(function() {
    $("#new-phoneNumbers").append('<div class="new-phone">' +
                                    '<div class="form-group">' +
                                      '<label for="new-phone">Phone Number</label>' +
                                      '<input type="text" class="form-control new-number">' +
                                    '</div>' +
                                  '</div>');
  });
	
	$("form#new-contact").submit(function(event) {
		event.preventDefault();

		var inputtedFirstName = $("input#new-first-name").val();
		var inputtedLastName = $("input#new-last-name").val();


		var newContact = Contact.create(inputtedFirstName, inputtedLastName);
    
		  newContact.addresses = [];
      newContact.phones = [];


		$(".new-address").each(function() {
			var inputtedStreet = $(this).find("input.new-street").val();
			var inputtedCity = $(this).find("input.new-city").val();
			var inputtedState = $(this).find("input.new-state").val();
		
			var newAddress = newContact.createAddress(inputtedStreet, inputtedCity, inputtedState);
			
      if (newAddress.validAddress()) {
        newContact.addresses.push(newAddress);
      } else {
        alert("Please enter a valid address with street, city, and state");
        errorCounter += 1;
      }			
		});

    $(".new-phone").each(function() {
      var inputtedPhone = $(this).find("input.new-number").val();

      var newPhone = newContact.createPhoneNumber(inputtedPhone);

      if (newPhone.validPhone()) {
        newContact.phones.push(newPhone);
      } else {
        alert("Please enter a valid 10-digit phone number");
        errorCounter += 1;
      }
    });
		
    if(errorCounter === 0) {
		  $("ul#contacts").append("<li><span class='contact'>" + newContact.fullName() + "</span></li>");
    }

		$(".contact").last().click(function() {
			$("#show-contact").show();

			$("#show-contact h2").text(newContact.fullName());
			$(".first-name").text(newContact.firstName);
			$(".last-name").text(newContact.lastName);
			
			$("ul#addresses").text("");
			newContact.addresses.forEach(function(address) {
				$("ul#addresses").append("<li>" + address.fullAddress() + "</li>");
			});

      $("ul#phoneNumbers").text("");
      newContact.phones.forEach(function(phone) {
        $("ul#phoneNumbers").append("<li>" + phone.showPhoneNumber() + "</li>");
      });
		});
		
		$(this).find("input").val("");
    errorCounter = 0;
	});
});

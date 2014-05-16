beforeEach(function() {
	Contact.all = [];
	Address.all = [];
	PhoneNumber.all = [];
});


describe("Contact", function() {
	describe("createPhoneNumber", function() {
		it("creates a phone number object", function() {
			var testContact = Contact.create();
			var testPhone = testContact.createPhoneNumber();
			PhoneNumber.isPrototypeOf(testPhone).should.equal(true);
		});
		it("adds the phone number to the phones property of the contact", function() {
			var testContact = Contact.create();
			var testPhone = testContact.createPhoneNumber();
			testContact.phones.should.eql([testPhone]);
		});
	});

	describe("createAddress", function() {
	 	it("creates an address object", function() {
	 		var testContact = Contact.create();
	 		var testAddress = testContact.createAddress();
	 		Address.isPrototypeOf(testAddress).should.equal(true);
	 	});

	 	it("adds the address to the addresses property of the contact", function() {
	 		var testContact = Contact.create();
	 		var testAddress = testContact.createAddress();
	 		testContact.addresses.should.eql([testAddress]);
	 	});
	 });


	describe("create", function() {
		it("creates a new instance of a Contact", function() {
			var testContact = Contact.create();
			Contact.isPrototypeOf(testContact).should.equal(true);
		});

		it("initializes the contact and checks that contacts include an empty addresses array and phones array", function() {
			var testContact = Contact.create("Mary", "Jane");
			testContact.addresses.should.eql([]);
			testContact.phones.should.eql([]);
		});

		it("adds the contact to the .all property", function() {
			var testContact = Contact.create();
		 	Contact.all.should.eql([testContact]);
		 });
	});

	describe("initialize", function() {
		it("sets the first and last name", function() {
			var testContact = Object.create(Contact);
			testContact.initialize("Mary", "Jane");
			testContact.firstName.should.equal("Mary");
			testContact.lastName.should.equal("Jane");
		});

		it("sets up an empty array for the addresses and phones property", function () {
			var testContact = Object.create(Contact);
			testContact.initialize("Mary", "Jane");
			testContact.addresses.should.eql([]);
			testContact.phones.should.eql([]);
		});
	});

	describe("fullName", function() {
		it("combines the first and last name, separated by a space", function() {
			var testContact = Object.create(Contact);
			testContact.firstName = "Dolly";
			testContact.lastName = "Parton";
			testContact.fullName().should.equal("Dolly Parton");
		});
	});
});

describe("Address", function() {
	describe("create", function() {
		it("creates a new instance of a Address", function() {
			var testAddress = Address.create();
			Address.isPrototypeOf(testAddress).should.equal(true);
		});
		it("adds the address to the .all property", function() {
			var testAddress = Address.create();
			Address.all.should.eql([testAddress]);
		});
	});

	describe("initialize", function () {
		it("sets the street, city and state in the Address object prototype", function () {
			var testAddress = Object.create(Address);
			testAddress.initialize("123 Main St", "Portland", "Oregon");
			testAddress.street.should.equal("123 Main St");
			testAddress.city.should.equal("Portland");
			testAddress.state.should.equal("Oregon");
		});
	}); 

	describe("fullAddress", function() {
		it("returns the full address with nice formatting", function() {
			var testAddress = Object.create(Address);
			testAddress.street = "123 4th Ave";
			testAddress.city = "Portland";
			testAddress.state = "Oregon";
			testAddress.fullAddress().should.equal("123 4th Ave, Portland, Oregon");
		});
	});

	describe("validAddress", function() {
		it("returns true if user inputs a street, city, and state", function() {
			var testAddress = Object.create(Address);
			testAddress.street = "123 4th Ave";
			testAddress.city = "Portland";
			testAddress.state = "Oregon";
			testAddress.validAddress().should.equal(true);
		});

		it("returns false if the user does not input a street, city, or state", function() {
			var testAddress = Object.create(Address);
			testAddress.street = "123 4th Ave";
			testAddress.city = "";
			testAddress.state = "Oregon";
			testAddress.validAddress().should.equal(false);
		});
	});
});

describe("PhoneNumber", function() {
	describe("create", function() {
		it("creates a new instance of a PhoneNumber", function() {
			var testPhone = PhoneNumber.create();
			PhoneNumber.isPrototypeOf(testPhone).should.equal(true);
		});
	 it("adds the phonenumber to the .all property", function() {
	 		var testPhone = PhoneNumber.create();
	 		PhoneNumber.all.should.eql([testPhone]);
	 });
	});

	describe("initialize", function() {
		it("sets the phone number", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.initialize("9713331234");
			testPhone.number.should.equal("9713331234");
		});
	});

	describe("showPhoneNumber", function() {
		it("returns the phone number with nice formatting", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.number = "8881234567";
			testPhone.showPhoneNumber().should.equal("888-123-4567");
		});
	});

	describe("validPhone", function() {
		it("returns false if the string is not ten characters long", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.number = "888123456";
			testPhone.validPhone().should.equal(false);
		});

		it("returns true if the string IS ten characters long", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.number = "8881234567";
			testPhone.validPhone().should.equal(true);
		});

		it("returns false if the string includes characters that are not numbers", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.number = "888123456B";
			testPhone.validPhone().should.equal(false);
		});

		it("returns true if the string includes characters that are all numbers", function() {
			var testPhone = Object.create(PhoneNumber);
			testPhone.number = "8881234567";
			testPhone.validPhone().should.equal(true);
		});
	});
});

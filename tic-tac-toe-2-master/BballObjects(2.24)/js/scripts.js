var Team = {
  fullLocation: function() {
    return this.cityName + " " + this.teamName;
  }
};

$(document).ready(function() {
  $("form#baseball-team").submit(function(event) {
    event.preventDefault();

    var inputtedTeamName = $("input#new-team-name").val();
    var inputtedTeamCity = $("input#new-team-city").val();
    var inputtedTeamState = $("input#new-team-state").val();

    var newTeam = Object.create(Team);
    newTeam.teamName = inputtedTeamName;
    newTeam.cityName = inputtedTeamCity;
    newTeam.stateName = inputtedTeamState;

    $("ul#teams").append("<li><span class='teamList'>" + newTeam.fullLocation() + "</span></li>");

    $(".teamList").last().click(function () {
      $(".result-list").show();
      $(".result-list h2").text(newTeam.fullLocation());
      $(".teamName").text(newTeam.teamName);
      $(".teamCity").text(newTeam.cityName);
      $(".teamState").text(newTeam.stateName);
    });
  });
});












































// var Contact = {
//     fullName: function() {
//       return this.firstName + " " + this.lastName;
//     }
// };

// $(document).ready(function() {
//   $("form#new-contact").submit(function(event) {
//     event.preventDefault();

//     var inputtedFirstName = $("input#new-first-name").val();
//     var inputtedLastName = $("input#new-last-name").val();
//     var inputtedAddress = $("input#new-address").val();

//     var newContact = Object.create(Contact);
//     newContact.firstName = inputtedFirstName;
//     newContact.lastName = inputtedLastName;
//     newContact.address = inputtedAddress;

//     $("ul#contacts").append("<li><span class='contact'>" + newContact.fullName() + "</span></li>");

//     $(".contact").last().click(function() {
//       $("#show-contact").show();
//       $("#show-contact h2").text(newContact.fullName());
//       $(".first-name").text(newContact.firstName);
//       $(".last-name").text(newContact.lastName);
//       $(".address").text(newContact.address);
//     });

//     this.reset();
//   });
// });

var Game = {
 create: function() {
  return Object.create(Game);
 }, 

 initialize: function() {
  this.xPositions = [];
  this.oPositions = [];
 },

 victory: {
  winning1: [1,2,3],
  winning2: [4,5,6],
  winning3: [7,8,9],
  winning4: [1,4,7],
  winning5: [2,5,8],
  winning6: [3,6,9],
  winning7: [1,5,9],
  winning8: [3,5,7],
 }
}

var Space = {
  create: function() {
    return Object.create(Space);
  },

  initialize: function(position) {
    this.position = position;
  },

  setContents: function(contents) {
    this.contents = contents
  },
}

var Board = {
  create: function() {
    var board = Object.create(Board);
    board.initialize();
    return board;
  },

  initialize: function() {
    this.spaces = [];
    this.createBoard();
  },

  createSpace: function(position) {
    var space = Space.create();
    space.initialize(position);
    this.spaces.push(space);
    return space;
  },

  createBoard: function() {
    for(var i = 0; i <= 8; i++){
      this.createSpace(i+1);
    }
  },
}

var turnTaker = function(initialTurn) {
  var turnCounter = initialTurn;

  if(turnCounter === 1) {
    turnCounter += 1;
  } else {
    turnCounter -= 1;
  } 
  return turnCounter
}

// var canvas1 = document.getElementById("space1");

// canvas1.addEventListener("click", function(event) {
//   var ctx = document.getElementById("canvas1").getContext('2d');

//   ctx.beginPath();
//   ctx.arc(50, 50, 36, 0, Math.PI*2, true);
//   ctx.stroke();
// }

// if turnCounter = 1, work with X
// if turnCounter = 2, work with O
// if turncounter = 1, at end of turn, turnCounter +1
// if turncounter = 2, at end of turn, turncounter -1

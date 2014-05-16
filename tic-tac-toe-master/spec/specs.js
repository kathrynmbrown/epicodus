describe("Game", function() {
  describe("create", function() {
    it("creates a new instance of a Game", function() {
      var testGame = Game.create();
      Game.isPrototypeOf(testGame).should.equal(true);
    });
  });
    describe("initialize", function() {
      it("initializes the game with an array of winning combinations", function() {
        var testGame = Game.create();
        testGame.initialize();
        testGame.victory.winning8.should.eql([3,5,7]);
      });

      it("initializes the game with an empty array reserved for x", function() {
        var testGame = Game.create();
        testGame.initialize();
        testGame.xPositions.should.eql([]);
      });

        it("initializes the game with an empty array reserved for o", function() {
        var testGame = Game.create();
        testGame.initialize();
        testGame.oPositions.should.eql([]);
      });
    });    
    describe("victory", function() {
      it("stores key value pairs of the 9 winning combinations", function() {
        var testGame = Game.create();
        var testBoard = Board.create();
        testGame.victory.winning8.should.eql([3,5,7]);
      });
    });     
});


describe("Board", function() {
  describe("create", function() {
    it("creates a Board prototype", function() {
      var testBoard = Board.create();
      Board.isPrototypeOf(testBoard).should.equal(true);
    });
    it("initializes the Board", function() {
      var testBoard = Board.create();
      testBoard.spaces.length.should.equal(9);
    });
  });

  describe("initialize", function() {
    it("creates an empty array for spaces", function() {
      var testBoard = Board.create();
      testBoard.initialize();
      testBoard.spaces.length.should.equal(9);
    });
  });

  describe("createBoard", function() {
    it("creates 9 Space objects and adds them to the spaces property of the board", function() {
      var testBoard = Board.create();
      testBoard.spaces.length.should.equal(9);
    });
  });

  describe("createSpace", function() {
    it("creates a Space object", function() {
      var testBoard = Board.create();
      var testSpace = testBoard.createSpace();
      Space.isPrototypeOf(testSpace).should.equal(true);
    });
    it("adds the space to the spaces property of the board", function() {
      var testBoard = Board.create();
      var testSpace = testBoard.createSpace(1);
      testBoard.spaces.length.should.equal(10); // results of createBoard + 1 
    });
  });
});

describe("Space", function() {
  describe("create", function() {
    it("creates a new instance of a Space", function() {
      var testSpace = Space.create();
      Space.isPrototypeOf(testSpace).should.equal(true);
    });
  });
  
  describe("initialize", function() {
    it("initializes an empty space at a given position on the board", function() {
      var testSpace = Space.create();
      testSpace.initialize(1);
      testSpace.position.should.equal(1);
    });
  });

  describe("setContents", function() {
    it("sets x as a property of Space", function() {
      var testSpace = Space.create();
      testSpace.setContents("x");
      testSpace.contents.should.equal("x");
    });
    it("sets o as a property of Space", function() {
      var testSpace = Space.create();
      testSpace.setContents("o");
      testSpace.contents.should.equal("o");
    });
  });  
});

describe("turnTaker", function() {
  it("increments the turn counter by 1 if the turn counter equals 1", function() {
    turnTaker(1).should.equal(2);
  });
  it("decrements the turn counter by 1 if the turn counter equals 2", function() {
    turnTaker(2).should.equal(1);
  });
});

var Vote = artifacts.require("./Vote.sol");

contract("Vote", function(accounts) {
  var VoteInstance;

  // This checks if the election is initialized with the correct number of candidates.
  it("There are 13 candidates in the race", function() {
    return Vote.deployed().then(function(instance) {
      return instance.candidatesCount();
    }).then(function(count) {
      assert.equal(count, 13);
    });
  });

  // Checks id, name and vote count for candidates.
  it("Candidates have the correct id, name and vote count", function() {
    return Vote.deployed().then(function(instance) {
      VoteInstance = instance;
      return VoteInstance.candidates(1);
    }).then(function(candidate) {
      assert.equal(candidate[0], 1, "Correct id");
      assert.equal(candidate[1], "Alvaro Dias", "Correct name");
      assert.equal(candidate[2], 0, "Correct vote count");
      return VoteInstance.candidates(2);
    }).then(function(candidate) {
      assert.equal(candidate[0], 2, "Correct id");
      assert.equal(candidate[1], "Cabo Daciolo", "Correct name");
      assert.equal(candidate[2], 0, "Correct vote count");
    });
  });

  // Makes sure an allowed address is able to vote in the chosen candidate.
  it("Address is able to vote", function() {
    return Vote.deployed().then(function(instance) {
      VoteInstance = instance;
      candidateId = 1;
      return VoteInstance.vote(candidateId, { from: accounts[0] });
    }).then(function(receipt) {
      assert.equal(receipt.logs.length, 1, "an event was triggered");
      assert.equal(receipt.logs[0].event, "votedEvent", "the event type is correct");
      assert.equal(receipt.logs[0].args._candidateId.toNumber(), candidateId, "the candidate id is correct");
      return VoteInstance.voters(accounts[0]);
    }).then(function(voted) {
      assert(voted, "the voter was marked as voted");
      return VoteInstance.candidates(candidateId);
    }).then(function(candidate) {
      var voteCount = candidate[2];
      assert.equal(voteCount, 1, "increments the candidate's vote count");
    })
  });

  // Exception for invalid candidates.
  it("Exception for invalid candidates", function() {
    return Vote.deployed().then(function(instance) {
      VoteInstance = instance;
      return VoteInstance.vote(99, { from: accounts[1] })
    }).then(assert.fail).catch(function(error) {
      assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
      return VoteInstance.candidates(1);
    }).then(function(candidate1) {
      var voteCount = candidate1[2];
      assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
      return VoteInstance.candidates(2);
    }).then(function(candidate2) {
      var voteCount = candidate2[2];
      assert.equal(voteCount, 0, "candidate 2 did not receive any votes");
    });
  });

  // Makes sure voter can only vote once by trying to vote two times.
  it("Voter is not able to vote more than one time", function() {
    return Vote.deployed().then(function(instance) {
      VoteInstance = instance;
      candidateId = 2;
      VoteInstance.vote(candidateId, { from: accounts[1] });
      return VoteInstance.candidates(candidateId);
    }).then(function(candidate) {
      var voteCount = candidate[2];
      assert.equal(voteCount, 1, "accepts first vote");
      return VoteInstance.vote(candidateId, { from: accounts[1] });
    }).then(assert.fail).catch(function(error) {
      assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
      return VoteInstance.candidates(1);
    }).then(function(candidate1) {
      var voteCount = candidate1[2];
      assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
      return VoteInstance.candidates(2);
    }).then(function(candidate2) {
      var voteCount = candidate2[2];
      assert.equal(voteCount, 1, "candidate 2 did not receive any votes");
    });
  });
});

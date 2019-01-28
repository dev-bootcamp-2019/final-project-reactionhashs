pragma solidity ^0.5.0;

import "./Stop.sol";

contract Vote is Stop {
    // Creates a structure for a 'candidate' in our election.
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
        string party;

    }

    // Creates a structure of a 'party' in our election (for further implementation).
    struct Party {
        string acronym;
        string partyName;
        uint number;
    }

    // Owner's adress.
    address public owner;
    // Mapping to store 'voter' accounts, so we can later avoid that they vote more than one time.
    mapping(address => bool) public voters;
    // Mapping to store 'candidates'.
    mapping(uint => Candidate) public candidates;
    // Mapping to store 'parties'.
    mapping(uint => Party) public parties;
    // Candidates count.
    uint public candidatesCount;
    // Event to be triggered by vote() function.
    event votedEvent (
        uint indexed _candidateId
    );

    /*
    Constructor function initialized with the owner's address.
    Calls addCandidate() for each one of the 13 candidates running for presidency.
    Each candidate has a 'name' and a 'party'.
    */
    constructor() public {
        owner = msg.sender;

        addCandidate("Alvaro Dias", "PODE");
        addCandidate("Cabo Daciolo", "PATRI");
        addCandidate("Ciro Gomes", "PDT");
        addCandidate("Eymael", "DC");
        addCandidate("Fernando Haddad", "PT");
        addCandidate("Geraldo Alckmin", "PSDB");
        addCandidate("Guilherme Boulos", "PSOL");
        addCandidate("Henrique Meirelles", "MDB");
        addCandidate("Jair Bolsonaro", "PSL");
        addCandidate("João Amoêdo", "NOVO");
        addCandidate("João Goulart Filho", "PPL");
        addCandidate("Marina Silva", "REDE");
        addCandidate("Vera", "PSTU");
    }

    // Adds a candidate to the race, asking for a 'name' and a 'party' for each one. Increments candidatesCount.
    function addCandidate (string memory _name, string memory _party) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _party);
    }

    /*
    Vote function, asking for a candidateId. 
    It has an emergencySwitch, imported from Stop.sol.
    Stores new voters and makes sure the address has not voted before.
    Requires vote in a valid candidate (candidateId > 0 and <= candidatesCount).
    Increments voteCount once candidate has been voted and trigger 'voted' event.
    */
    function vote (uint _candidateId) public emergencySwitch {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }
}

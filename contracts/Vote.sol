pragma solidity ^0.5.0;

import "./Stop.sol";

contract Vote is Stop {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
        string party;

    }

    struct Party {
        string acronym;
        string partyName;
        uint number;
    }

    address public owner;
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    mapping(uint => Party) public parties;
    
    uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );

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

    function addCandidate (string memory _name, string memory _party) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _party);
    }

    function vote (uint _candidateId) public emergencySwitch {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }
}

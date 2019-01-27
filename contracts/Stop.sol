pragma solidity ^0.5.0;

import "./Ownable.sol";

contract Stop is Ownable {

    bool stopped = false;

    modifier emergencySwitch {
        require(!stopped);
        _;
    }

    modifier onlyWhenStopped {
        require(stopped);
        _;
    }

    modifier onlyAuthorized {
        _;
    }

    function stopContract() public onlyAuthorized {
        stopped = true;
    }

    function resumeContract() public onlyAuthorized {
        stopped = false;
    }

    function deposit() public payable emergencySwitch {
    }

    function emergencyWithdraw() public view onlyWhenStopped {
    }
    
    function kill() public {
        if (msg.sender == owner) selfdestruct(owner);
    }
}
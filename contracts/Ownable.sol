pragma solidity ^0.5.0;

contract Ownable {
  address payable owner;

  constructor() Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}
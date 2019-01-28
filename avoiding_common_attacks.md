# Avoiding common attacks

  - [Main contract](#main-contract)
  - [Ownership](#ownership)
  - [Freeze](#freeze)
  - [Kill function](#kill-function)

## Main contract 

Constructor of **Vote.sol** initializes 'owner' with her/his address. **Stop.sol** is imported into the main contract. 

## Ownership 

**Ownable.sol** makes sure there is only one account that is the owner and can do administrative tasks on contracts. This contract is imported into **Stop.sol**.

## Freeze

Owner can freeze the contract in case of errors. This is made through **Stop.sol**. 

## Kill function

Owner of the contract can terminate it by using kill function. Also on **Stop.sol**.
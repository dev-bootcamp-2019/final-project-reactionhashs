# Design pattern decisions

**Vote.sol** is a very simple contract to implement an election between thirteen candidates and allow a voter to choose one of them. It makes sure only the owner can initialize the contract and that a voter account can only vote once. 

**Ownable.sol** is applied to **Stop.sol** in order to ensure that only the owner of the contract is able to freeze it and kill it. 

**Stop.sol** is applied to **Vote.sol** to create a circuit breaker.
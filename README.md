# Vote

**Vote** is a simple voting dApp built with Solidity, Truffle, React and Webpack. 
  
  - [Vote](#Vote)
  - [What does it do?](#what-does-it-do?)
  - [Setting up](#setting-up)
  - [Deploying to local development network](#deploying-to-local-development-network)
  - [Deploying to Rinkeby testnet](#deploying-to-rinkeby-testnet)
  - [Running tests](#running-tests)

## What does it do?

**Vote.sol** implements an election between thirteen candidates that ran for the presidency of Brazil in 2018. You can choose one of them and deposit your vote by sending a transaction through Metamask. It has a very simple web interface you can interact with.

The dApp is written in [Solidity](https://solidity.readthedocs.io/en/v0.5.0/index.html), with tests written in JavaScript. [Webpack](https://webpack.js.org/) bundle the modules, [webpack-dev-server](https://github.com/webpack/webpack-dev-server) serves the app, and [React](https://reactjs.org/) creates an interactive front end for the application.

Preferably, you can try it out by deploying it to a local development blockchain with [Ganache-cli](https://github.com/trufflesuite/ganache-cli). It can also be deployed to the [Rinkeby testnet](https://rinkeby.etherscan.io) with the help of [Infura](https://infura.io/).

## Setting up

Ganache-cli is a command line interface that uses ethereumjs to simulate full client behavior. To install, make sure you have [Node.js(>= v6.11.5)](https://nodejs.org/en/) and [npm](https://www.npmjs.com/). Then run:

```
npm install -g ganache-cli
```

When finished, start it out in your terminal by typing `ganache-cli`, and it will run on port 8545 by default. Ganache-cli prints out a list of ten accounts, each one pre-funded with 100 ether, along with a twelve-word mnemonic for re-generating those accounts. 

Go on and, if you haven't yet, install [Metamask](https://metamask.io/). Use the seed phrase provided by Ganache-cli to initialize your MetaMask client with the same pre-funded accounts. Click 'Custom RPC' and add a new private network with the address http://127.0.0.1:8545.

You will also have to install [Truffle](https://www.truffleframework.com/), a development/testing suite for Ethereum:

```
npm install -g truffle
```

And, to bundle our modules, we will need [webpack](https://webpack.js.org/) and [webpack-cli](https://www.npmjs.com/package/webpack-cli) globally installed:

```
npm install -g webpack webpack-cli
```

## Deploying to local development network

With all those packages globally installed, you can proceed to clone this repository:

```
$ git clone https://github.com/dev-bootcamp-2019/final-project-reactionhashs/
```

While on the root directory:

```
npm install
```

Compile the contracts:

```
truffle compile
```

With ganache-cli running, migrate them:

```
truffle migrate 
```

And start the application by running:

```
npm run start
```

A tab in your browser should open with http://localhost:8080/ and serve the application. You should now be able to choose one of the thirteen candidates and deposit your vote by submitting a transaction with Metamask. Each account can only vote once.

## Deploying to Rinkeby testnet

If you wish so, you can deploy this to Rinkeby testnet. Change to your Rinkeby account (upper right corner of Metamask extension), copy the address and post it to social media. Copy the social media link with the Rinkeby address and fund your account by posting it [here](https://faucet.rinkeby.io/). 

Enter [Infura](https://infura.io/), sign up and create a new project. Take note of the project ID.

Create a .env file in the root directory of this project and add environment-specific variables to it, following this example:

```
MNEMONIC = "Add your Metamask 12 word mnemonic"
INFURA_API_KEY = "Add project ID provided by Infura"
```

Inside the root directory of the project, run: 

```
truffle compile 
```

And:

```
truffle migrate --network rinkeby
```

## Running tests

Inside the root dir, simply run:

```
truffle test
```

This is going to start five JavaScript tests written for Vote.sol. All five should pass:

```
✓ There are 13 candidates in the race
✓ Candidates have the correct id, name and vote count
✓ Address is able to vote
✓ Exception for invalid candidates
✓ Voter is not able to vote more than one time
```
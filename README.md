### Deploying to Rinkeby testnet

If you don't have it yet, download the Metamask extension. Change to your Rinkeby account (upper right corner), copy the address and post it to social media. Copy the social media link with the Rinkeby address and fund your account by posting it here: https://faucet.rinkeby.io/. 

Enter https://infura.io/, sign up and create a new project. Take note of the project ID.

Create a .env file in the root directory of this project and add environment-specific variables to it, following this example:
```
MNEMONIC = "Add your Metamask 12 word mnemonic"
INFURA_API_KEY = "Add project ID provided by Infura"
```
Inside the root directory of the project, run truffle compile and truffle migrate --network rinkeby 

### Setting up

```
$ git clone https://github.com/dev-bootcamp-2019/final-project-reactionhashs/
$ cd final-project-reactionhashs/
$ npm install
$ npm install -g webpack webpack-cli
$ truffle compile --all
$ truffle migrate 
$ npm run start

```

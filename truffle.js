require("dotenv").config();

const HDWallet = require("truffle-hdwallet-provider");
const mnemonic = process.env.MNEMONIC;
const infuraProjectId = process.env.INFURA_API_KEY;

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },

    rinkeby: {
      provider: () => new HDWallet(mnemonic, "https://rinkeby.infura.io/v3/" + infuraProjectId),
      network_id: 4,
      skipDryRun: true
  	}
  }

};



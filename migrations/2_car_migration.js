var Cars = artifacts.require("./Cars.sol");

module.exports = function(deployer) {
  deployer.deploy(Cars);
};

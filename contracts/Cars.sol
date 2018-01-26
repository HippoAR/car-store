pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';

contract Cars is ERC721Token {
  string public constant symbol = "CAR";
  string public constant name = "Cars";
  uint8 public constant decimals = 0;

  // how many token units a buyer gets per wei
  uint256 public rate;

  // amount of raised money in wei
  uint256 public weiRaised;

  /* uint256 public constant INITIAL_SUPPLY = 20; */

  function Cars() public {
    rate = 1;
  }

  function buyCar(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());

    uint256 weiAmount = msg.value;

    // calculate token amount to be created
    uint256 tokens = weiAmount.mul(rate);

    // update state
    weiRaised = weiRaised.add(weiAmount);

    _mint(beneficiary, totalSupply());
  }

  function getWeiRaised() public view returns (uint256) {
    return weiRaised;
  }

  // @return true if the transaction can buy tokens
  function validPurchase() internal view returns (bool) {
    bool nonZeroPurchase = msg.value != 0;
    return nonZeroPurchase;
  }
}

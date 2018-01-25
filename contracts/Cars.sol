pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';

contract Cars is Ownable, ERC721Token {
  string public constant symbol = "CAR";
  string public constant name = "Cars";
  uint8 public constant decimals = 0;

  /* uint256 public constant INITIAL_SUPPLY = 20; */

  function Cars() public {
    _mint(msg.sender, 0);
    _mint(msg.sender, 1);
    _mint(msg.sender, 2);
    _mint(msg.sender, 3);
    _mint(msg.sender, 4);
  }

  function getOwners() public view returns (address[5]) {
    return [ownerOf(0), ownerOf(1), ownerOf(2), ownerOf(3), ownerOf(4)];
  }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract Token is ERC20{

constructor() ERC20("testToken", 'TT'){
 
}

function mintToken() public {
    _mint(msg.sender, 5000);
}
}
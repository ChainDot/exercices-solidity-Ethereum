//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TheOne {
    uint256 private _theOne = 1;
    
    function One() public view returns(uint256) {
        return _theOne;
    }
}

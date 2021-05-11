// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {

    function check(uint256 number_) public pure returns (bool){
        
       return  (number_ % 2 != 0) ? true : false;
        
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";


contract PayableCalculator {
    using Address for address payable;

    
    address private _owner;
    uint256 private _fees;
    uint256 private _count;
    
    event Added(address indexed account, int256 a, int256 b, int256 total);
    event Substracted(address indexed account, int256 a, int256 b, int256 total);
    event Multiplicated(address indexed account, int256 a, int256 b, int256 total);
    event Divided(address indexed account, int256 a, int256 b, int256 total);
    event Modulo(address indexed account, int256 a, int256 b, int256 total);
    event withdrewAll(address indexed recipient, uint256 amount);
    
    
    constructor (address owner_) {
        _owner = owner_;
    }
    
    modifier onlyOwner() {
        require(_owner == msg.sender, "Only owner can call this function");
        _;
    }
    
    
     function withdrawAll() public onlyOwner {
            require(_fees > 0, "PayableCalculator: no ether in the contract");
            uint256 amount = _fees;
            _fees = 0;
            payable(_owner).sendValue(amount);
            emit withdrewAll(_owner, amount);
    }
    
    function add(int256 a, int256 b) public payable returns (int256) {
        require(msg.value >= 1**15, "PayableCalculator: Not enough ether sent");
         _fees += msg.value;
         _count++;
        emit Added(msg.sender, a, b, a + b);
        return a + b;
    }
    
    function sub(int256 a, int256 b) public payable returns (int256) {
        require(msg.value >= 1**15, "PayableCalculator: Not enough ether sent");
         _fees += msg.value;
         _count++;
        emit Substracted(msg.sender, a, b, a - b);
        return a - b;
    }
    
    function mul(int256 a, int256 b) public payable returns (int256) {
        require(msg.value >= 1**15, "PayableCalculator: Not enough ether sent");
         _fees += msg.value;
         _count++;
        emit Multiplicated(msg.sender, a, b, a * b);
        return a * b;
    }
    
    function div(int256 a, int256 b) public payable returns (int256) {
        require(msg.value >= 1**15, "PayableCalculator: Not enough ether sent");
        _fees += msg.value;
        _count++;
        emit Divided(msg.sender, a, b, a / b);
        return a / b;
    }
    
    function mod(int256 a, int256 b) public payable returns (int256) {
        require(msg.value >= 1**15, "PayableCalculator: Not enough ether sent");
         _fees += msg.value;
         _count++;
        emit Modulo(msg.sender, a, b, a % b);
        return a % b;
    }

    function owner() public view returns(address) {
        return _owner;
    }
    
    function count() public view returns(uint256) {
        return _count;
    }
    
    function fees() public view returns(uint256) {
        return _fees;
    }
}
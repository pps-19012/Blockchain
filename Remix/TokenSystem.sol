// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Owned {
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier OnlyOwner() {
        require(msg.sender == owner, "You do not have permissions to add tokens!");
        _;
    }
}

// can also use the code below:
// import "./Owned.sol";

contract TokenSystem is Owned {

    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() public {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public OnlyOwner {
        tokenBalance[owner] ++;
    }

    function burnToken() public OnlyOwner {
        tokenBalance[owner] --;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner]*tokenPrice)/msg.value > 0, "Not enough tokens to purchase");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens in account to complete transaction!");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }

    
}

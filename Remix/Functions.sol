// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Functions {

    mapping(address => uint) public balanceReceived;

    address payable public owner;
    address payable owner2;

    constructor() public {
        owner = payable(msg.sender);
    }

    function destoryThisContract() public {
        require(msg.sender == owner, "You cannot destroy this contract!");
        selfdestruct(owner);
    }

    function getOwner() public view returns(address) {
        return owner2;
    }

    function convertWeiToEth(uint _amount) public pure returns(uint) {
        return _amount / 1 ether;
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] +msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "Not enough funds to withdraw");
        assert(balanceReceived[msg.sender] + _amount >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    receive() external payable {
        receiveMoney();
    }
}

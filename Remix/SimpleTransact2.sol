// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleTransact2 {

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "Not enough fund to transfer");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    // This withdrawal function follows Check Effects Interactions 
    // In brief, while making a function involving transactions follow these steps in order:
    // 1. Check if you can do something
    // 2. Make sure that the effect on the state of this smart contract is doe correctly
    // 3. Interact with any external address or anything externally outside of this smart contract
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleTransact3 {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // function sendMoney() public payable {
    //     balanceReceived[msg.sender] += msg.value;
    // }
    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;  //add in total balance
        Payment memory payment = Payment(msg.value, block.timestamp);   //record time
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;    //record transaction serially
        balanceReceived[msg.sender].numPayments++;  //update transaction serial number
    }

    // function withdrawAllMoney(address payable _to) public {
    //     uint balanceToSend = balanceReceived[msg.sender];
    //     balanceReceived[msg.sender] = 0;
    //     _to.transfer(balanceToSend);
    // }
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }

    // function withdrawMoney(address payable _to, uint _amount) public {
    //     require(balanceReceived[msg.sender] >= _amount, "Not enough funds to transfer");
    //     balanceReceived[msg.sender] -= _amount;
    //     _to.transfer(_amount);
    // }
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totalBalance >= _amount, "Not enough funds to transfer");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}

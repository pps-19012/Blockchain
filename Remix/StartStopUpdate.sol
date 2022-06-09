// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract StartStopUpdate {

    address public owner;
    bool public paused;

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You cannot pause!");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You cannot withdraw!");//Similar to conditional statements; helps in tracking error or throws exceptions
        require(paused == true, "Contract Paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You cannot destroy!");
        selfdestruct(_to);
    }

// Without CREATE2, a contract gets deployed to an address that is computed based on your address + your nonce. 
// That way it was guaranteed that a Smart Contract cannot be re-deployed to the same address.

// With the CREATE2 op-code you can instruct the EVM to place your Smart Contract on a specific address. 
// Then you could call selfdestruct(), thus remove the source code. Then re-deploy a different Smart Contract to the same address.

// This comes with several implications: when you see that a Smart Contract includes a selfdestruct() then simply be careful. 
// Those implications will become more and more apparent as you progress through the course, especially when we talk about the ERC20 Token allowance.

}

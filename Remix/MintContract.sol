//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract MintContract is ERC721, Ownable {
    uint public mintPrice = 0.05 ether;
    uint public totalSupply;
    uint public maxSupply;
    bool public isMintEnabled;
    mapping(address => uint) public mintedWallets;

    constructor() payable ERC721('Simple Mint', 'SIMPLEMINT') {
        maxSupply = 2;
    }

    function mintIsEnabled() external view onlyOwner {
        isMintEnabled != isMintEnabled;
    }

    function setMaxSupply(uint _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function mint() external payable {
        require(isMintEnabled, "Minting is not enabled!");
        require(mintedWallets[msg.sender] < 1, "Exceeds max per wallet");   //Imp
        require(msg.value == mintPrice, "Wrong Value");
        require(maxSupply > totalSupply, "Sold out!");

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);

    }
}

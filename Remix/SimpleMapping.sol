// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    // Since both of these mappings are public it acts as setter and getter function in one.
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setAddress() public {
        myAddressMapping[msg.sender] = true;
    }

    // Mapping inside mapping
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

    // Since the mapping is not public we must define two functions: setter and getter
    function setuintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getuintUintBoolMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }
}

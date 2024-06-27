// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
   
    address public manager;

    address payable[] public candidates;

     address payable public winner;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Only manager can call this function");
        _;
    }

    function receiveEther() external payable {
        require(msg.value == 1 ether, "You must send exactly 1 Ether");
        candidates.push(payable(msg.sender));
    }

     function getBalance() external view onlyManager returns (uint) {
        return address(this).balance;
    }
}

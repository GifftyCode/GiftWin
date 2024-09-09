// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Lottery {
    // setting up the state variables
    address  manager;
    address payable winner;
    address payable [] players;

    // The constructor function to be called once on deploymemt
    constructor() {
        manager =  msg.sender;
    }

    // function to participate in the lottery
    function participate() payable public{
        require(msg.value == 0.05 ether, 'Please pay 0.05 ether only to participate');
        players.push(payable (msg.sender));
    }
    // function to confirm the balance obtained
    function checkBalance() public view returns (uint) {
        require(manager == msg.sender, 'You are not the manager');
        return address(this).balance;
    }
    //function to generate randomness
     function randomness() internal view returns(uint) {
        return uint (keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }
    //function to check the winner
       function lotteryWinner() public {
        require(manager == msg.sender, 'You are not the manager');
        require(players.length >=3, 'players cannot be less than 3');

        uint r = randomness();
        uint index = r%players.length;

        winner = players[index];
        winner.transfer(checkBalance());

        players = new address payable [] (0);

    }

    

}
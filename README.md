# Lottery Smart Contract

Welcome to the Lottery Smart Contract! This Solidity contract allows users to participate in a simple lottery where they can win a prize based on random selection. Below is a brief overview of how it works and how to use it.

## Overview

This smart contract is designed to handle a basic lottery system on the Ethereum blockchain. It includes functionalities for users to participate, for the manager to check the balance, and for selecting a winner.

## Features

- **Participation**: Users can enter the lottery by sending exactly 10 ETH.
- **Balance Check**: The manager can check the total balance of the contract.
- **Random Winner Selection**: A winner is chosen randomly from participants once at least 3 players have entered.
- **Prize Distribution**: The prize is distributed to the selected winner, and the list of players is reset.

## How It Works

1. **Deploying the Contract**: When the contract is deployed, the deployer becomes the manager.

2. **Participate**: 
   - **Function**: `participate()`
   - **Description**: Users can participate by sending 10 ETH to the contract. Only exact payments of 10 ETH are accepted.

3. **Check Balance**: 
   - **Function**: `checkBalance()`
   - **Description**: The manager can check the current balance of the contract. This is useful to see how much ETH is in the contract before selecting a winner.

4. **Select Winner**: 
   - **Function**: `lotteryWinner()`
   - **Description**: The manager can call this function to select a random winner from the participants, transfer the entire balance to the winner, and reset the list of players. Note: There must be at least 3 participants to select a winner.

## Code Explanation

- **State Variables**:
  - `manager`: The address of the contract manager (deployer).
  - `winner`: The address of the current winner.
  - `players`: An array of addresses representing participants.

- **Constructor**: Sets the deployer as the manager.

- **Participate Function**: Allows users to enter the lottery by paying exactly 10 ETH.

- **Check Balance Function**: Allows the manager to view the contract’s balance.

- **Randomness Function**: Generates a pseudo-random number used to select a winner.

- **Lottery Winner Function**: Selects a random winner from the participants and transfers the entire contract balance to them.

## Usage

1. **Deploy the Contract**: Use any Ethereum development environment to deploy the contract.
2. **Enter the Lottery**: Call the `participate()` function with 10 ETH.
3. **Check Balance**: Call the `checkBalance()` function (only accessible by the manager).
4. **Select Winner**: Call the `lotteryWinner()` function (only accessible by the manager and requires at least 3 participants).

## Notes

- Ensure you have sufficient ETH to participate and for testing purposes.
- The random number generation is not truly random and should be used with caution for high-stakes lotteries.

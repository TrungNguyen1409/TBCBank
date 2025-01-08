// Exercise: Deploy a Smart Contract on the Sepolia Testnet

// **Guidelines**: 
// This smart contract allows users to deposit and withdraw funds, 
// and it provides a bonus for students to implement a profit-sharing mechanism.
// Fill in the missing code sections marked with TODO comments.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Begin the Smart Contract
contract SimpleBank {
    // **State Variables**
    // This mapping tracks each user’s balance.
    mapping(address => uint256) private balances;

    // Owner of the contract, needed for potential bonus functionality.
    address public owner;

    // Profit percentage for bonus functionality (e.g., 10% profit on withdrawals).
    uint256 public profitPercentage = 10;

    // **Constructor**
    // TODO: Ensure the owner deposits at least 0.01 ETH and initialize `owner`.
    constructor() payable {
        // HINT: Use require to check the deposit and `msg.sender` for owner.
    }

    // **Deposit Function**
    // Users can deposit funds into the contract.
    function deposit() external payable {
        // TODO: Update the sender’s balance with the deposited Ether.
    }

    // **Withdraw Function**
    // Users can withdraw funds they deposited.
    function withdraw(uint256 _amount) external {
        // TODO: Check user balance, calculate profit if applicable, and transfer.
    }

    // **Withdraw All Function**
    // Users can withdraw their entire balance.
    function withdrawAll() external {
        // TODO: Retrieve user balance, reset it, and transfer with profit.
    }

    // **View Balance**
    // Allows users to view their balance.
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    // **Fallback Function**
    // Prevent accidental sending of Ether to the contract without a function call.
    fallback() external payable {
        revert("Direct transfer not allowed");
    }

    receive() external payable {
        // TODO: Update the sender’s balance with the received Ether.
    }
}

// **Steps to Complete the Task**
// 1. Open [Remix IDE](https://remix.ethereum.org/) in your browser.
// 2. Copy and paste the smart contract code into a new Solidity file (e.g., `SimpleBank.sol`).
// 3. Complete the constructor to initialize the `owner` variable and ensure a deposit.
// 4. Complete the `deposit`, `withdraw`, `withdrawAll`, and `receive` functions.
// 5. Compile the smart contract in Remix.
//    - Select the correct Solidity compiler version (e.g., 0.8.x).
// 6. Deploy the smart contract to the Sepolia testnet.
//    - Ensure the owner deposits at least 0.01 ETH during deployment.
//    - Configure your Metamask wallet with Sepolia testnet.
//    - Use the "Injected Web3" environment in Remix to deploy the contract.
// 7. Interact with the deployed contract using Remix.
//    - Test deposit, withdraw, and view balance functionalities.

// BONUS: Implement the profit-sharing mechanism in the withdraw function.

// **Solution**
// Test the contract by deploying it on Remix and interacting with the functions using the Sepolia testnet.

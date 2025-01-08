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
    // Owner must deposit at least 0.01 ETH during deployment.
    constructor() payable {
        // Ensure the owner deposits a minimum amount.
        require(msg.value >= 0.01 ether, "Owner must deposit at least 0.01 ETH");
        owner = msg.sender;
    }

    // **Deposit Function**
    // Users can deposit funds into the contract.
    function deposit() external payable {
        // Add the sent Ether (msg.value) to the sender’s balance.
        balances[msg.sender] += msg.value;
    }

    // **Withdraw Function**
    // Users can withdraw funds they deposited.
    function withdraw(uint256 _amount) external {
        // Ensure the user has enough funds to withdraw.
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // BONUS: Calculate profit if the owner wants to allow it.
        uint256 profit = 0;
        if (msg.sender != owner) {
            profit = (_amount * profitPercentage) / 100;
        }

        // Update the balance before transferring to prevent re-entrancy attacks.
        balances[msg.sender] -= _amount;

        // Send the requested amount plus profit to the user.
        payable(msg.sender).transfer(_amount + profit);
    }

    // **Withdraw All Function**
    // Users can withdraw their entire balance.
    function withdrawAll() external {
        uint256 userBalance = balances[msg.sender];
        require(userBalance > 0, "No balance to withdraw");

        // BONUS: Calculate profit if the owner wants to allow it.
        uint256 profit = 0;
        if (msg.sender != owner) {
            profit = (userBalance * profitPercentage) / 100;
        }

        // Reset the balance before transferring to prevent re-entrancy attacks.
        balances[msg.sender] = 0;

        // Send the entire balance plus profit to the user.
        payable(msg.sender).transfer(userBalance + profit);
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
        balances[msg.sender] += msg.value;
    }
}

// **Steps to Complete the Task**
// 1. Open [Remix IDE](https://remix.ethereum.org/) in your browser.
// 2. Copy and paste the smart contract code into a new Solidity file (e.g., `SimpleBank.sol`).
// 3. Complete the constructor to initialize the `owner` variable.
// 4. Compile the smart contract in Remix.
//    - Select the correct Solidity compiler version (e.g., 0.8.x).
// 5. Deploy the smart contract to the Sepolia testnet.
//    - Ensure the owner deposits at least 0.01 ETH during deployment.
//    - Configure your Metamask wallet with Sepolia testnet.
//    - Use the "Injected Web3" environment in Remix to deploy the contract.
// 6. Interact with the deployed contract using Remix.
//    - Test deposit, withdraw, and view balance functionalities.

// BONUS: Implement the profit-sharing mechanism in the withdraw function.

// **Solution**
// Test the contract by deploying it on Remix and interacting with the functions using the Sepolia testnet.

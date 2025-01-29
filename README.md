# 📜 Solidity Homework: Savings Account Smart Contract with Custom ERC20 Token

## 🔹 Introduction
Welcome to your **Solidity assignment!** 🎉  
In this exercise, you will build a **simple Savings Account Smart Contract** using Solidity and the **Remix IDE**. Before that, you will first create your own **ERC20 token**, which will be used as the deposit currency for your savings account.

By the end of this assignment, you will understand fundamental Solidity concepts, including:
- ✅ Writing and deploying an **ERC20 Token**
- ✅ Interacting with ERC20 tokens in a contract
- ✅ State variables and mappings
- ✅ Functions and visibility modifiers
- ✅ Events and logging
- ✅ Require statements for validation
- ✅ Contract deployment and interaction in Remix IDE
- ✅ Using modifiers for role-based access control

---

## 🛠 Prerequisites
Before starting, make sure you have:
- A computer with internet access 🌍
- Basic understanding of **Ethereum and Smart Contracts**
- A web browser (Chrome, Firefox, Edge, etc.)
- No installation required! We’ll use **Remix IDE** (online).

---

## 🚀 Step 1: Creating and Deploying an ERC20 Token
Before building the savings contract, you need to **deploy your own ERC20 token**. Follow these steps:

### 🔹 Open Remix IDE
1. Go to [Remix Ethereum IDE](https://remix.ethereum.org).
2. Click on **File Explorer** (📁 icon) in the left sidebar.
3. Click **New File** and name it **`MyToken.sol`**.

### 🔹 Copy and Paste the Following Code
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }
}
```

### 🔹 Steps to Deploy
1. Click on the **Solidity Compiler** tab (🛠 icon) in the left sidebar.
2. Select **Compiler version `0.8.20`**.
3. Click **Compile MyToken.sol** (🔨).
4. Go to the **Deploy & Run Transactions** tab (🚀 icon).
5. Select **JavaScript VM (London)** as the environment.
6. Enter an initial supply (e.g., `1000000`) in the constructor field.
7. Click **Deploy**.

**✅ Expected Output:** Your token contract will be deployed, and the address will be displayed.

---

## 🚀 Step 2: Writing the Savings Account Contract
Now that you have deployed your ERC20 token, use it in your **Savings Account Contract**.

### 🔹 Open Remix and Create a New File
1. Click **File Explorer** in Remix.
2. Create a new file called **`SavingsAccount.sol`**.
3. Copy and paste the following contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SavingsAccount {
    IERC20 public token;
    mapping(address => uint256) private balances;
    uint256 public interestRate = 5; // 5% annual interest
    address private owner;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = IERC20(_tokenAddress);
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Deposit must be greater than zero");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        
        balances[msg.sender] += amount;
        emit Deposited(msg.sender, amount);
    }

    function checkBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
        
        emit Withdrawn(msg.sender, amount);
    }

    function applyInterest() external onlyOwner {
        for (uint256 i = 0; i < 5; i++) {  // Placeholder, students need to fix this logic
            // TODO: Apply interest to all users
        }
    }
}
```

---

## 🛠 Step 3: Deploying the Savings Contract
1. Click on the **Solidity Compiler** tab and compile `SavingsAccount.sol`.
2. Go to **Deploy & Run Transactions**.
3. In the constructor field, enter the **address of the ERC20 token you deployed earlier**.
4. Click **Deploy**.

**✅ Expected Output:** The contract should deploy successfully.

---

## 🎯 Step 4: Interacting with the Contract

### 🔹 1. Approve and Deposit Tokens
- First, approve the contract to spend tokens on your behalf using `approve()` from your ERC20 contract.
- Expand the deployed **SavingsAccount** contract.
- Locate the **deposit()** function.
- Enter an amount (e.g., **100 tokens**).
- Click **transact**.

**✅ Expected Output:**  
- The balance should be updated.
- An event should be emitted (`Deposited`).

---

### 🔹 2. Check Balance
- Click on `checkBalance()`.

**✅ Expected Output:**  
- It should return **100 tokens** (or the amount deposited).

---

### 🔹 3. Withdraw Tokens
- Locate `withdraw(uint256 amount)`.
- Enter **50 tokens**.
- Click **transact**.

**✅ Expected Output:**  
- The withdrawal should succeed.
- The balance should decrease.
- A `Withdrawn` event should be emitted.

---

## 📩 Step 5: Submitting Your Assignment
To complete the assignment:
1. **Submit your modified Solidity code**.
2. **Include screenshots** of your Remix transactions.
3. Write a short explanation of:
   - How each function works.
   - What changes you made (if any).

---

## 📊 Grading Criteria
| Criteria | Points |
|----------|--------|
| ERC20 Token successfully deployed | 20 |
| `deposit()`, `checkBalance()`, and `withdraw()` work correctly | 40 |
| Events are emitted properly | 10 |
| `onlyOwner` and interest function implemented correctly | 20 |
| Code readability (comments, clean structure) | 10 |

**Total: 100 Points**

---

## 🎯 Summary
🎉 Congratulations! You’ve successfully deployed an ERC20 token and built a savings account contract that interacts with it. 🚀


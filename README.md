# 📜 Solidity Homework: Savings Account Smart Contract

## 🔹 Introduction
Welcome to your **first Solidity assignment!** 🎉  
In this exercise, you will build a **simple Savings Account Smart Contract** using Solidity and the **Remix IDE**. This contract will allow users to **deposit ETH**, **withdraw ETH**, and **check their balance**. Additionally, an **interest function** will be implemented for advanced students.

By the end of this assignment, you will understand fundamental Solidity concepts, including:
- ✅ State variables and mappings
- ✅ Functions and visibility modifiers
- ✅ Payable functions and transactions
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

## 🚀 Step 1: Setting Up the Environment
### 🔹 Open Remix IDE
1. Go to [Remix Ethereum IDE](https://remix.ethereum.org).
2. Click on **File Explorer** (📁 icon) in the left sidebar.
3. Click **New File** and name it **`SavingsAccount.sol`**.

---

## 📝 Step 2: Writing the Smart Contract
Copy and paste the following **starter code** into your `SavingsAccount.sol` file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SavingsAccount {
    mapping(address => uint256) private balances;
    uint256 public interestRate = 5; // 5% annual interest
    address private owner;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function checkBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

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

## 🛠 Step 3: Compiling the Contract
1. Click on the **Solidity Compiler** tab (🛠 icon on the left sidebar).
2. Select the **compiler version `0.8.20`**.
3. Click **Compile SavingsAccount.sol** (🔨).

**✅ Expected Output:** You should see **"Compilation successful"** with no errors.

---

## 🚀 Step 4: Deploying the Contract
1. Click the **Deploy & Run Transactions** tab (🚀 icon on the left sidebar).
2. Under **Environment**, select **"JavaScript VM (London)"**.
3. Click **Deploy**.

**✅ Expected Output:** Your contract should appear under "Deployed Contracts" in Remix.

---

## 🎯 Step 5: Interacting with the Contract
Now, let's **test** each function:

### 🔹 1. Deposit ETH
- Expand the deployed **SavingsAccount** contract.
- Locate the **deposit()** function.
- Enter an amount (e.g., **1 ETH**) in the **Value** field (above the function list).
- Click **transact**.

**✅ Expected Output:**  
- The balance should be updated.
- An event should be emitted (`Deposited`).

---

### 🔹 2. Check Balance
- Click on `checkBalance()`.

**✅ Expected Output:**  
- It should return **1 ETH** (or the amount deposited).

---

### 🔹 3. Withdraw ETH
- Locate `withdraw(uint256 amount)`.
- Enter **0.5 ETH**.
- Click **transact**.

**✅ Expected Output:**  
- The withdrawal should succeed.
- The balance should decrease.
- A `Withdrawn` event should be emitted.

---

### 🔹 4. Apply Interest (Advanced)
- Only the **owner** can call `applyInterest()`.
- Once implemented, this should increase all user balances by 5%.

---

## 📩 Step 6: Submitting Your Assignment
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
| `deposit()`, `checkBalance()`, and `withdraw()` work correctly | 50 |
| Events are emitted properly | 10 |
| `onlyOwner` and interest function implemented correctly | 20 |
| Code readability (comments, clean structure) | 10 |
| Successfully tested and submitted results | 10 |

**Total: 100 Points**

---

## 🤔 FAQ
### 1️⃣ Can I test this with real ETH?
No, Remix uses a **simulated Ethereum environment**. No real ETH is involved.

### 2️⃣ What happens if I withdraw more than my balance?
The contract prevents this using a **require()** statement.

### 3️⃣ Why is the interest function not working?
You need to **implement logic** inside the loop. Hint: Iterate over users and apply interest.

---

## 🎯 Summary
🎉 Congratulations! You’ve successfully:
- **Written** and **deployed** a Solidity smart contract.
- **Interacted** with the Ethereum Virtual Machine (EVM).
- **Used require statements, mappings, and events**.
- **Learned security principles** like preventing overdraws.
- **Understood the fundamentals of Solidity**.

💡 **Next Steps:** Try modifying the contract to:
- Implement **penalties for early withdrawals**.
- Add **a minimum deposit requirement**.
- Enable **compound interest** calculations.

🚀 **Great job! Keep building!** 💪🔥


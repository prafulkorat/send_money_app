# Send Money App

A Flutter application for sending money with offline support, using GetX for state management and `https://jsonplaceholder.typicode.com` as the API.

---

## Features

1. Login Screen with username and password authentication.
2. Dashboard:
    - Show/Hide Wallet Balance.
    - Navigate to Send Money or Transaction History screens.
3. Send Money Screen:
    - Input amount to send.
    - Displays a success or error message.
4. Transaction History Screen:
    - Displays a list of transactions from the API.
    - Cached offline support.
5. Offline Mode:
    - Shows cached data when offline.
    - Updates when back online.

---

## How to Run the Project

### Prerequisites

1. Install [Flutter](https://docs.flutter.dev/get-started/install) on your system.
2. Install a code editor (e.g., [VS Code](https://code.visualstudio.com/)).
3. Install an Android/iOS emulator or connect a real device.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/prafulkorat/send_money_app
   cd send_money_app


classDiagram

    class AuthController {
    -TextEditingController usernameController
    -TextEditingController passwordController
    +void login()
    +void logout()
    }

    class DashboardController {
        -UserModel user
        -RxBool isBalanceHidden
        -TextEditingController amountController
        +void toggleBalance()
        +void sendMoney()
        +void logout()
    }

    class TransactionsController {
        -RxList<TransactionModel> transactions
        -RxBool isLoading
        +void fetchTransactions()
    }

    class TransactionModel {
        -int id
        -double amount
        -String date
        +TransactionModel.fromJson(Map<String, dynamic>)
    }

    AuthController --> DashboardController
    DashboardController --> TransactionModel
    TransactionsController --> TransactionModel


sequenceDiagram - Login Flow

    participant User
    participant LoginScreen
    participant AuthController
    participant DashboardScreen

    User ->> LoginScreen: Enter username & password
    LoginScreen ->> AuthController: Call login()
    AuthController ->> AuthController: Validate credentials
    AuthController ->> DashboardScreen: Navigate to dashboard



sequenceDiagram - Send Money Flow

    participant User
    participant SendMoneyScreen
    participant DashboardController
    participant ApiService

    User ->> SendMoneyScreen: Enter amount
    SendMoneyScreen ->> DashboardController: Call sendMoney()
    DashboardController ->> ApiService: POST transaction
    ApiService -->> DashboardController: Success/Failure response
    DashboardController ->> SendMoneyScreen: Show success/failure message


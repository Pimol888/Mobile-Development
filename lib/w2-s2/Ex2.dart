class BankAccount {
  final int accNum;
  double balance;
  final String owner;

  BankAccount(this.accNum, this.owner, {this.balance = 0.0});

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    } else {
      print("The withdrawalof Insufficient balance:(");
      return false;
    }
  }

  double getBalance() {
    return balance;
  }
}

class Bank {
  final List<BankAccount> accs;

  Bank() : accs = [];

  BankAccount createAccount(int accNum, String owner, {double initialDeposit = 0.0}) {
    if (accs.any((account) => account.accNum == accNum)) {
      throw Exception("Account with ID $accNum already exists!");
    }
    final newAccount = BankAccount(accNum, owner, balance: initialDeposit);
    accs.add(newAccount);
    return newAccount;
  }

  BankAccount? getAccount(int accNum) {
    return accs.firstWhere((account) => account.accNum == accNum, 
    orElse: null);
  }

  void printAllaccs() {
    for (final account in accs) {
      print("Account Number: ${account.accNum}");
      print("Owner: ${account.owner}");
      print("Balance: \$${account.getBalance()}");
      print("----------------------");
    }
  }
}

void main() {
  final myBank = Bank();

  final pimolacc = myBank.createAccount(30000, 'Pimol', initialDeposit: 30000);
  final dyacc = myBank.createAccount(200, 'Dy', initialDeposit: 50);

  myBank.printAllaccs();

  pimolacc.deposit(50);
  dyacc.withdraw(25);

  myBank.printAllaccs();
  try {
    myBank.createAccount(30000, 'Honglay'); 
  } catch (e) {
    print(e);
  }
}
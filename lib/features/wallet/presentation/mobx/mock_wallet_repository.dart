import '../../domain/entities/transaction.dart';
import '../../domain/entities/earnings.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/wallet_overview_response.dart';
import '../../domain/repositories/wallet_repository.dart';
import 'package:dartz/dartz.dart';

class MockWalletRepository implements WalletRepository {
  @override
  Future<Either<Failure, WalletOverviewResponse>> getWalletOverview() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(getMockWalletOverview());
  }

  @override
  Future<Either<Failure, Earnings>> getEarnings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(getMockEarnings());
  }

  @override
  Future<Either<Failure, double>> getAvailableBalance() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Right(15420.50);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions({
    int? limit,
    int? offset,
    String? type,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Right(getMockTransactions());
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final transactions = getMockTransactions();
    final transaction = transactions.firstWhere((t) => t.id == id);
    return Right(transaction);
  }

  @override
  Future<Either<Failure, List<BankAccount>>> getBankAccounts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Right(getMockBankAccounts());
  }

  @override
  Future<Either<Failure, List<Bank>>> getBanks() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Right(getMockBanks());
  }

  @override
  Future<Either<Failure, String>> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock verification - return a sample account name
    if (accountNumber.length == 10) {
      return const Right('JOHN DOE');
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccount>> linkBankAccount({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String type,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Right(BankAccount(
      id: '3',
      bankName: bankName,
      bankCode: bankCode,
      accountNumber: accountNumber,
      accountName: accountName,
      type: type,
      isDefault: false,
      isActive: true,
      createdAt: DateTime.now(),
    ));
  }

  @override
  Future<Either<Failure, void>> unlinkBankAccount(String accountId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Right(null);
  }

  @override
  Future<Either<Failure, BankAccount>> setDefaultBankAccount(
      String accountId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final accounts = getMockBankAccounts();
    final account = accounts.firstWhere((a) => a.id == accountId);
    return Right(account);
  }

  @override
  Future<Either<Failure, String>> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return const Right('withdrawal_12345');
  }

  @override
  Future<Either<Failure, void>> confirmWithdrawal(
      String withdrawalId, String otp) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getWithdrawalHistory() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final transactions =
        getMockTransactions().where((t) => t.isWithdrawal).toList();
    return Right(transactions);
  }

  @override
  Future<Either<Failure, Transaction>> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return Right(Transaction.purchase(
      id: 'airtime_${DateTime.now().millisecondsSinceEpoch}',
      category: 'airtime',
      amount: amount,
      createdAt: DateTime.now(),
      status: TransactionStatus.completed,
      description: 'Airtime purchase for $phoneNumber',
      metadata: {'phone': phoneNumber, 'network': network},
    ));
  }

  @override
  Future<Either<Failure, Transaction>> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return Right(Transaction.purchase(
      id: 'data_${DateTime.now().millisecondsSinceEpoch}',
      category: 'data',
      amount: amount,
      createdAt: DateTime.now(),
      status: TransactionStatus.completed,
      description: 'Data purchase for $phoneNumber',
      metadata: {'phone': phoneNumber, 'network': network, 'plan': dataPlan},
    ));
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getRewards() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return Right(getMockRewards());
  }

  @override
  Future<Either<Failure, void>> claimReward(String rewardId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right(null);
  }

  // Mock data methods
  static Earnings getMockEarnings() {
    final now = DateTime.now();
    return Earnings(
      availableBalance: 15420.50,
      totalEarnings: 45680.75,
      todayEarnings: 850.25,
      weeklyEarnings: 3200.00,
      monthlyEarnings: 12500.50,
      dailyBreakdown: List.generate(7, (index) {
        final date = now.subtract(Duration(days: 6 - index));
        return DailyEarning(
          date: date,
          amount: 100.0 + (index * 50),
          transactionsCount: 2 + index,
        );
      }),
      materialBreakdown: [
        MaterialEarning(
          material: 'PET',
          totalAmount: 125.5,
          weight: 5.2,
          transactionsCount: 12,
        ),
        MaterialEarning(
          material: 'Glass',
          totalAmount: 85.0,
          weight: 3.8,
          transactionsCount: 8,
        ),
        MaterialEarning(
          material: 'Paper',
          totalAmount: 45.0,
          weight: 2.1,
          transactionsCount: 5,
        ),
        MaterialEarning(
          material: 'Metal',
          totalAmount: 25.0,
          weight: 1.2,
          transactionsCount: 3,
        ),
      ],
    );
  }

  static List<Transaction> getMockTransactions() {
    final now = DateTime.now();
    return [
      Transaction.earning(
        id: '1',
        amount: 125.50,
        createdAt: now.subtract(const Duration(hours: 2)),
        description: 'Plastic bottles recycling',
        metadata: {'material': 'plastic', 'weight': '5.2kg'},
      ),
      Transaction.earning(
        id: '2',
        amount: 85.00,
        createdAt: now.subtract(const Duration(days: 1)),
        description: 'Glass bottles recycling',
        metadata: {'material': 'glass', 'weight': '3.8kg'},
      ),
      Transaction.withdrawal(
        id: '3',
        amount: 2000.00,
        createdAt: now.subtract(const Duration(days: 2)),
        status: TransactionStatus.completed,
        description: 'Bank transfer to ****1234',
        metadata: {'bank': 'GTBank', 'account': '****1234'},
      ),
      Transaction.earning(
        id: '4',
        amount: 50.00,
        createdAt: now.subtract(const Duration(days: 3)),
        description: 'Weekly recycling bonus',
        metadata: {'bonus_type': 'weekly'},
      ),
      Transaction.earning(
        id: '5',
        amount: 200.00,
        createdAt: now.subtract(const Duration(hours: 6)),
        description: 'Paper recycling - pending verification',
        metadata: {'material': 'paper', 'weight': '8.5kg'},
      ),
    ];
  }

  static List<BankAccount> getMockBankAccounts() {
    return [
      BankAccount(
        id: '1',
        bankName: 'Guaranty Trust Bank',
        bankCode: '058',
        accountNumber: '0123456789',
        accountName: 'John Doe',
        type: 'SAVINGS',
        isDefault: true,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      BankAccount(
        id: '2',
        bankName: 'Access Bank',
        bankCode: '044',
        accountNumber: '9876543210',
        accountName: 'John Doe',
        type: 'CURRENT',
        isDefault: false,
        createdAt: DateTime.now().subtract(const Duration(days: 60)),
      ),
    ];
  }

  static List<Bank> getMockBanks() {
    return [
      const Bank(
        id: 1,
        name: 'Access Bank',
        slug: 'access-bank',
        code: '044',
        longcode: '044',
        country: 'Nigeria',
        currency: 'NGN',
        type: 'nuban',
      ),
      const Bank(
        id: 2,
        name: 'First Bank',
        slug: 'first-bank',
        code: '011',
        longcode: '011',
        country: 'Nigeria',
        currency: 'NGN',
        type: 'nuban',
      ),
      const Bank(
        id: 3,
        name: 'Guaranty Trust Bank',
        slug: 'gtbank',
        code: '058',
        longcode: '058',
        country: 'Nigeria',
        currency: 'NGN',
        type: 'nuban',
      ),
      const Bank(
        id: 4,
        name: 'United Bank for Africa',
        slug: 'uba',
        code: '033',
        longcode: '033',
        country: 'Nigeria',
        currency: 'NGN',
        type: 'nuban',
      ),
      const Bank(
        id: 5,
        name: 'Zenith Bank',
        slug: 'zenith-bank',
        code: '057',
        longcode: '057',
        country: 'Nigeria',
        currency: 'NGN',
        type: 'nuban',
      ),
    ];
  }

  static Map<String, dynamic> getMockRewards() {
    return {
      'points': 2450,
      'badges': ['Eco Warrior', 'Recycling Champion', 'Green Hero'],
      'streak': 12,
      'bonusCredits': 150.0,
      'level': 'Gold',
      'nextLevelPoints': 500,
    };
  }

  static WalletOverviewResponse getMockWalletOverview() {
    return const WalletOverviewResponse(
      availableBalance: 9000.0,
      todayEarnings: 7000.0,
      lastWithdrawnAmount: null,
      accountNumber: '841220214778',
      accountName: 'JOHN DANIELSS',
      totalEarnings: 7000.0,
      lastTransactionDate: null,
    );
  }
}

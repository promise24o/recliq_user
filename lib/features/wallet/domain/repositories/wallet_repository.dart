import 'package:dartz/dartz.dart';
import '../entities/transaction.dart';
import '../entities/bank_account.dart';
import '../entities/bank.dart';
import '../entities/earnings.dart';
import '../entities/wallet_overview_response.dart';

abstract class WalletRepository {
  // Wallet Overview
  Future<Either<Failure, WalletOverviewResponse>> getWalletOverview();

  // Balance and Earnings
  Future<Either<Failure, Earnings>> getEarnings();
  Future<Either<Failure, double>> getAvailableBalance();

  // Transactions
  Future<Either<Failure, List<Transaction>>> getTransactions({
    int? limit,
    int? offset,
    String? type,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<Either<Failure, Transaction>> getTransactionById(String id);

  // Banks
  Future<Either<Failure, List<Bank>>> getBanks();
  Future<Either<Failure, String>> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  });

  // Bank Accounts
  Future<Either<Failure, List<BankAccount>>> getBankAccounts();
  Future<Either<Failure, BankAccount>> linkBankAccount({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String type,
  });
  Future<Either<Failure, void>> unlinkBankAccount(String accountId);
  Future<Either<Failure, BankAccount>> setDefaultBankAccount(String accountId);

  // Withdrawals
  Future<Either<Failure, String>> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  });
  Future<Either<Failure, void>> confirmWithdrawal(
      String withdrawalId, String otp);
  Future<Either<Failure, List<Transaction>>> getWithdrawalHistory();

  // Airtime & Data Purchase
  Future<Either<Failure, Transaction>> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  });
  Future<Either<Failure, Transaction>> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  });

  // Rewards
  Future<Either<Failure, Map<String, dynamic>>> getRewards();
  Future<Either<Failure, void>> claimReward(String rewardId);
}

abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class InsufficientFundsFailure extends Failure {
  const InsufficientFundsFailure();
}

class InvalidBankAccountFailure extends Failure {
  const InvalidBankAccountFailure();
}

class OTPVerificationFailure extends Failure {
  const OTPVerificationFailure();
}

class WithdrawalLimitFailure extends Failure {
  const WithdrawalLimitFailure();
}

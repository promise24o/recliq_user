import 'package:dartz/dartz.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/earnings.dart';
import '../datasources/wallet_remote_data_source.dart';
import '../datasources/wallet_local_data_source.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource remoteDataSource;
  final WalletLocalDataSource localDataSource;

  WalletRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Bank>>> getBanks() async {
    try {
      final cachedBanks = await localDataSource.getCachedBanks();
      if (cachedBanks != null) {
        return Right(cachedBanks.map((model) => model.toDomain()).toList());
      }

      final response = await remoteDataSource.getBanks();
      final banks = response.banks.map((b) => b.toDomain()).toList();
      await localDataSource.cacheBanks(response.banks);

      return Right(banks);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  }) async {
    try {
      final accountName = await remoteDataSource.verifyBankAccount(
        bankCode: bankCode,
        accountNumber: accountNumber,
      );
      return Right(accountName);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Earnings>> getEarnings() async {
    try {
      final earningsModel = await remoteDataSource.getEarnings();
      return Right(earningsModel.toDomain());
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, double>> getAvailableBalance() async {
    try {
      final balance = await remoteDataSource.getAvailableBalance();
      return Right(balance);
    } catch (e) {
      return Left(const ServerFailure());
    }
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
    try {
      final response = await remoteDataSource.getTransactions(
        limit: limit,
        offset: offset,
        type: type,
        category: category,
        startDate: startDate,
        endDate: endDate,
      );
      final transactions =
          response.transactions.map((t) => t.toDomain()).toList();
      return Right(transactions);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(String id) async {
    try {
      final transactionModel = await remoteDataSource.getTransactionById(id);
      return Right(transactionModel.toDomain());
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BankAccount>>> getBankAccounts() async {
    try {
      final response = await remoteDataSource.getBankAccounts();
      final accounts = response.accounts.map((a) => a.toDomain()).toList();
      return Right(accounts);
    } catch (e) {
      return Left(const ServerFailure());
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
    try {
      final response = await remoteDataSource.linkBankAccount(
        bankName: bankName,
        accountNumber: accountNumber,
        accountName: accountName,
        bankCode: bankCode,
        type: type,
      );

      return Right(response.toBankAccountModel().toDomain());
    } catch (e) {
      return Left(const InvalidBankAccountFailure());
    }
  }

  @override
  Future<Either<Failure, void>> unlinkBankAccount(String accountId) async {
    try {
      await remoteDataSource.unlinkBankAccount(accountId);
      return const Right(null);
    } catch (e) {
      // Extract error message from the exception
      String errorMessage = 'Failed to remove account';

      // Try to extract message from DioException or other API error responses
      if (e.toString().contains('Cannot remove default bank account')) {
        errorMessage =
            'Cannot remove default bank account. Please set another account as default first.';
      } else if (e.toString().contains('message:')) {
        // Extract message from error response
        final messageMatch =
            RegExp(r'message[:\s]+([^,}]+)').firstMatch(e.toString());
        if (messageMatch != null) {
          errorMessage = messageMatch.group(1)?.trim() ?? errorMessage;
        }
      }

      // For now, return ServerFailure without message
      // The actual error message will be handled at a higher level
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccount>> setDefaultBankAccount(
      String accountId) async {
    try {
      final bankAccountModel =
          await remoteDataSource.setDefaultBankAccount(accountId);
      return Right(bankAccountModel.toDomain());
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  }) async {
    try {
      if (amount < 1000) {
        return Left(const WithdrawalLimitFailure());
      }

      final withdrawalId = await remoteDataSource.initiateWithdrawal(
        amount: amount,
        bankAccountId: bankAccountId,
        note: note,
      );

      return Right(withdrawalId);
    } catch (e) {
      return Left(const InsufficientFundsFailure());
    }
  }

  @override
  Future<Either<Failure, void>> confirmWithdrawal(
      String withdrawalId, String otp) async {
    try {
      await remoteDataSource.confirmWithdrawal(withdrawalId, otp);
      return const Right(null);
    } catch (e) {
      return Left(const OTPVerificationFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getWithdrawalHistory() async {
    try {
      final response = await remoteDataSource.getTransactions(
        type: 'withdrawal',
      );
      final transactions =
          response.transactions.map((t) => t.toDomain()).toList();
      return Right(transactions);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  }) async {
    try {
      final transactionModel = await remoteDataSource.purchaseAirtime(
        phoneNumber: phoneNumber,
        amount: amount,
        network: network,
      );
      return Right(transactionModel.toDomain());
    } catch (e) {
      return Left(const InsufficientFundsFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  }) async {
    try {
      final transactionModel = await remoteDataSource.purchaseData(
        phoneNumber: phoneNumber,
        amount: amount,
        network: network,
        dataPlan: dataPlan,
      );
      return Right(transactionModel.toDomain());
    } catch (e) {
      return Left(const InsufficientFundsFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getRewards() async {
    try {
      final rewards = await remoteDataSource.getRewards();
      return Right(rewards);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> claimReward(String rewardId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}

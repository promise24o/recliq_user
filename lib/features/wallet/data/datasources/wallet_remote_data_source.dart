import 'package:dio/dio.dart';
import '../models/transaction_model.dart';
import '../models/bank_account_model.dart';
import '../models/bank_model.dart';
import '../models/earnings_model.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../domain/entities/wallet_overview_response.dart';

abstract class WalletRemoteDataSource {
  Future<WalletOverviewResponse> getWalletOverview();
  Future<EarningsModel> getEarnings();
  Future<double> getAvailableBalance();
  Future<TransactionListResponse> getTransactions({
    int? limit,
    int? offset,
    String? type,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<TransactionModel> getTransactionById(String id);

  // Banks
  Future<BankListResponse> getBanks();
  Future<String> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  });

  // Bank Accounts
  Future<BankAccountListResponse> getBankAccounts();
  Future<LinkBankAccountResponse> linkBankAccount({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String type,
  });
  Future<void> unlinkBankAccount(String accountId);
  Future<BankAccountModel> setDefaultBankAccount(String accountId);
  Future<String> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  });
  Future<void> confirmWithdrawal(String withdrawalId, String otp);
  Future<TransactionModel> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  });
  Future<TransactionModel> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  });
  Future<Map<String, dynamic>> getRewards();
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final Dio _dio;

  WalletRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  bool _isSuccessStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  // Mock data for demonstration
  static final List<TransactionModel> _mockTransactions = [
    TransactionModel(
      id: '1',
      type: 'earning',
      category: 'recycling',
      amount: 1500.00,
      currency: 'NGN',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      description: 'PET pickup - 15kg',
      location: 'Lagos, Nigeria',
      status: 'completed',
    ),
    TransactionModel(
      id: '2',
      type: 'withdrawal',
      category: 'withdrawal',
      amount: 5000.00,
      currency: 'NGN',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      description: 'Withdrawal to bank account',
      status: 'completed',
      reference: 'WD123456',
    ),
    TransactionModel(
      id: '3',
      type: 'purchase',
      category: 'airtime',
      amount: 1000.00,
      currency: 'NGN',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      description: 'Airtime recharge',
      status: 'completed',
      reference: 'AIR789012',
    ),
    TransactionModel(
      id: '4',
      type: 'earning',
      category: 'recycling',
      amount: 2000.00,
      currency: 'NGN',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      description: 'Glass recycling - 20kg',
      location: 'Abuja, Nigeria',
      status: 'completed',
    ),
    TransactionModel(
      id: '5',
      type: 'earning',
      category: 'recycling',
      amount: 2500.00,
      currency: 'NGN',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      description: 'Paper recycling - 25kg',
      location: 'Port Harcourt, Nigeria',
      status: 'completed',
    ),
  ];

  @override
  Future<WalletOverviewResponse> getWalletOverview() async {
    try {
      final response = await _dio.get('/wallet/overview');

      if (_isSuccessStatusCode(response.statusCode)) {
        return WalletOverviewResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load wallet overview');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load wallet overview: $e');
    }
  }

  @override
  Future<EarningsModel> getEarnings() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    return EarningsModel(
      availableBalance: 12500.00,
      totalEarnings: 45000.00,
      todayEarnings: 1500.00,
      weeklyEarnings: 8500.00,
      monthlyEarnings: 22000.00,
      dailyBreakdown: _generateDailyEarnings(),
      materialBreakdown: _generateMaterialEarnings(),
      lastUpdated: DateTime.now(),
    );
  }

  @override
  Future<double> getAvailableBalance() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 12500.00;
  }

  @override
  Future<TransactionListResponse> getTransactions({
    int? limit,
    int? offset,
    String? type,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var transactions = _mockTransactions;

    // Apply filters
    if (type != null) {
      transactions = transactions.where((t) => t.type == type).toList();
    }
    if (category != null) {
      transactions = transactions.where((t) => t.category == category).toList();
    }

    // Apply pagination
    final startIndex = offset ?? 0;
    final endIndex = startIndex + (limit ?? transactions.length);

    return TransactionListResponse(
      transactions:
          transactions.skip(startIndex).take(endIndex - startIndex).toList(),
      hasMore: endIndex < transactions.length,
      total: transactions.length,
    );
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final transaction = _mockTransactions.firstWhere(
      (t) => t.id == id,
      orElse: () => throw Exception('Transaction not found'),
    );

    return transaction;
  }

  @override
  Future<BankAccountListResponse> getBankAccounts() async {
    print("WalletRemoteDataSource: getBankAccounts called");
    try {
      final response = await _dio.get('/wallet/bank/accounts');

      print(
          "WalletRemoteDataSource: Response status code: ${response.statusCode}");
      print("WalletRemoteDataSource: Response data: ${response.data}");

      if (_isSuccessStatusCode(response.statusCode)) {
        print(
            "WalletRemoteDataSource: Got successful response with data: ${response.data}");
        final data = response.data;
        final List<dynamic> accountsJson = data['bankAccounts'] ?? [];
        print(
            "WalletRemoteDataSource: Found ${accountsJson.length} accounts in JSON");

        List<BankAccountModel> accounts = [];
        for (int i = 0; i < accountsJson.length; i++) {
          try {
            print(
                "WalletRemoteDataSource: Parsing account $i: ${accountsJson[i]}");
            final account = BankAccountModel.fromJson(accountsJson[i]);
            print("WalletRemoteDataSource: Successfully parsed account $i");
            accounts.add(account);
          } catch (e) {
            print("WalletRemoteDataSource: Failed to parse account $i: $e");
            print("WalletRemoteDataSource: Account JSON: ${accountsJson[i]}");
            rethrow;
          }
        }

        print(
            "WalletRemoteDataSource: Successfully parsed ${accounts.length} accounts");
        final responseObj = BankAccountListResponse(
          accounts: accounts,
          total: data['total'] ?? accounts.length,
        );
        print(
            "WalletRemoteDataSource: Returning BankAccountListResponse with ${responseObj.accounts.length} accounts");
        return responseObj;
      } else {
        print(
            "WalletRemoteDataSource: Non-200 status code: ${response.statusCode}");
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      print("WalletRemoteDataSource: DioException caught: ${e.type}");
      print("WalletRemoteDataSource: DioException response: ${e.response}");
      print("WalletRemoteDataSource: DioException message: ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        print("WalletRemoteDataSource: Throwing NetworkFailure");
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        print("WalletRemoteDataSource: Throwing ServerFailure (401)");
        throw const ServerFailure();
      } else if (e.response?.statusCode == 404) {
        print("WalletRemoteDataSource: Throwing ServerFailure (404)");
        throw const ServerFailure();
      } else {
        print("WalletRemoteDataSource: Throwing ServerFailure (other)");
        throw const ServerFailure();
      }
    } catch (e) {
      print("WalletRemoteDataSource: Generic exception caught: $e");
      print("WalletRemoteDataSource: Exception type: ${e.runtimeType}");
      throw const ServerFailure();
    }
  }

  @override
  Future<BankListResponse> getBanks() async {
    print("WalletRemoteDataSource: Calling /wallet/banks endpoint");
    try {
      final response = await _dio.get('/wallet/banks');

      if (_isSuccessStatusCode(response.statusCode)) {
        print(
            "WalletRemoteDataSource: Got 200 response with data: ${response.data}");
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> banksJson = responseData['banks'];
        final banks =
            banksJson.map((json) => BankModel.fromJson(json)).toList();
        return BankListResponse(banks: banks);
      } else {
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        throw const ServerFailure();
      } else {
        throw const ServerFailure();
      }
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<String> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  }) async {
    try {
      final response = await _dio.post(
        '/wallet/bank/verify',
        data: {
          'bankCode': bankCode,
          'accountNumber': accountNumber,
        },
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          // Check if response has status field (new format)
          if (data.containsKey('status') && data['status'] == true) {
            final accountName = data['accountName'] as String;
            return accountName;
          } else {
            // Fallback to direct accountName field
            final accountName = data['accountName'] as String;
            return accountName;
          }
        } else {
          // Direct string response (legacy format)
          final accountName = data as String;
          return accountName;
        }
      } else {
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        throw const ServerFailure();
      } else if (e.response?.statusCode == 400) {
        throw const ServerFailure();
      } else {
        throw const ServerFailure();
      }
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<LinkBankAccountResponse> linkBankAccount({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String type,
  }) async {
    try {
      final response = await _dio.post(
        '/wallet/bank/link',
        data: {
          'bankCode': bankCode,
          'accountNumber': accountNumber,
          'type': type,
        },
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        final accountJson = response.data;
        return LinkBankAccountResponse(
          id: accountJson['id'],
          bankName: accountJson['bankName'],
          bankCode: accountJson['bankCode'],
          accountNumber: accountJson['accountNumber'],
          accountName: accountJson['accountName'],
          type: accountJson['type'],
          isDefault: accountJson['isDefault'],
          isActive: accountJson['isActive'],
          createdAt: accountJson['createdAt'] != null
              ? DateTime.parse(accountJson['createdAt'])
              : null,
        );
      } else {
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        throw const ServerFailure();
      } else if (e.response?.statusCode == 400) {
        throw const ServerFailure();
      } else {
        throw const ServerFailure();
      }
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<void> unlinkBankAccount(String accountId) async {
    try {
      final response = await _dio.post(
        '/wallet/bank/remove',
        data: {
          'bankAccountId': accountId,
        },
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        // Successfully removed
      } else {
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        throw const ServerFailure();
      } else if (e.response?.statusCode == 400) {
        throw const ServerFailure();
      } else if (e.response?.statusCode == 404) {
        throw const ServerFailure();
      } else {
        throw const ServerFailure();
      }
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<BankAccountModel> setDefaultBankAccount(String accountId) async {
    try {
      final response = await _dio.post(
        '/wallet/bank/set-default',
        data: {
          'bankAccountId': accountId,
        },
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        // After setting default, get the updated account
        final accountsResponse = await getBankAccounts();
        return accountsResponse.accounts.firstWhere(
          (account) => account.id == accountId,
          orElse: () => throw const ServerFailure(),
        );
      } else {
        throw const ServerFailure();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode == 401) {
        throw const ServerFailure();
      } else if (e.response?.statusCode == 404) {
        throw const ServerFailure();
      } else {
        throw const ServerFailure();
      }
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<String> initiateWithdrawal({
    required double amount,
    required String bankAccountId,
    String? note,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return 'WD${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<void> confirmWithdrawal(String withdrawalId, String otp) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Simulate OTP confirmation
  }

  @override
  Future<TransactionModel> purchaseAirtime({
    required String phoneNumber,
    required double amount,
    required String network,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: 'purchase',
      category: 'airtime',
      amount: amount,
      currency: 'NGN',
      createdAt: DateTime.now(),
      description: 'Airtime recharge for $phoneNumber',
      status: 'completed',
      reference: 'AIR${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  @override
  Future<TransactionModel> purchaseData({
    required String phoneNumber,
    required double amount,
    required String network,
    required String dataPlan,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: 'purchase',
      category: 'data',
      amount: amount,
      currency: 'NGN',
      createdAt: DateTime.now(),
      description: 'Data purchase for $phoneNumber',
      status: 'completed',
      reference: 'DATA${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  @override
  Future<Map<String, dynamic>> getRewards() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return {
      'points': 2500,
      'badges': ['Eco Warrior', 'Recycling Champion', 'Green Hero'],
      'streak': 7,
      'bonusCredits': 500.00,
    };
  }

  List<DailyEarningModel> _generateDailyEarnings() {
    final now = DateTime.now();
    return List.generate(30, (index) {
      final date = now.subtract(Duration(days: index));
      return DailyEarningModel(
        date: date,
        amount: 500.0 + (index * 100.0) + (index % 3 * 200.0),
        transactionsCount: 1 + (index % 4),
        materialBreakdown: {
          'PET': 200.0 + (index * 50.0),
          'Glass': 150.0 + (index * 30.0),
          'Paper': 100.0 + (index * 20.0),
        },
      );
    }).reversed.toList();
  }

  List<MaterialEarningModel> _generateMaterialEarnings() {
    return [
      MaterialEarningModel(
        material: 'PET',
        totalAmount: 15000.00,
        weight: 150.5,
        transactionsCount: 25,
      ),
      MaterialEarningModel(
        material: 'Glass',
        totalAmount: 12000.00,
        weight: 120.0,
        transactionsCount: 18,
      ),
      MaterialEarningModel(
        material: 'Paper',
        totalAmount: 8000.00,
        weight: 200.0,
        transactionsCount: 30,
      ),
      MaterialEarningModel(
        material: 'Metal',
        totalAmount: 10000.00,
        weight: 50.0,
        transactionsCount: 12,
      ),
    ];
  }
}

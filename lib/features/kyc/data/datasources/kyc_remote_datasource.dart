import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/entities/kyc_status.dart';
import '../../domain/entities/bank_info.dart';
import '../../domain/entities/bvn_verification.dart';
import '../../domain/entities/kyc_initialization.dart';

abstract class KycRemoteDataSource {
  Future<KycInitializationResponse> initializeKyc({
    required String userId,
    required String userType,
  });
  Future<KycStatus> getKycStatus(String userId);
  Future<List<BankInfo>> getBanks();
  Future<AccountResolution> resolveAccount({
    required String accountNumber,
    required String bankCode,
  });
  Future<BvnVerificationResponse> verifyBvn({
    required String userId,
    required String bvn,
    required String accountNumber,
    required String bankCode,
    required String userName,
  });
  Future<void> submitBusinessDetails(Map<String, dynamic> businessDetails);
  Future<Map<String, dynamic>> uploadDocument({
    required String userId,
    required String documentType,
    required File document,
  });
}

class KycRemoteDataSourceImpl implements KycRemoteDataSource {
  final Dio dio;

  KycRemoteDataSourceImpl(this.dio);

  @override
  Future<KycInitializationResponse> initializeKyc({
    required String userId,
    required String userType,
  }) async {
    final response = await dio.post('/kyc/initialize', data: {
      'userId': userId,
      'userType': userType,
    });
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return KycInitializationResponse.fromJson(response.data);
    } else {
      throw Exception(response.data['message'] ?? 'KYC initialization failed');
    }
  }

  @override
  Future<KycStatus> getKycStatus(String userId) async {
    print('DEBUG: Calling KYC status API for userId: $userId');
    final response = await dio.get('/kyc/status', queryParameters: {'userId': userId});
    print('DEBUG: KYC status response: ${response.data}');
    return KycStatus.fromJson(response.data);
  }

  @override
  Future<List<BankInfo>> getBanks() async {
    final response = await dio.get('/kyc/banks');
    return (response.data as List).map((bank) => BankInfo.fromJson(bank)).toList();
  }

  @override
  Future<AccountResolution> resolveAccount({
    required String accountNumber,
    required String bankCode,
  }) async {
    final response = await dio.post('/kyc/account/resolve', data: {
      'accountNumber': accountNumber,
      'bankCode': bankCode,
    });
    return AccountResolution.fromJson(response.data);
  }

  @override
  Future<BvnVerificationResponse> verifyBvn({
    required String userId,
    required String bvn,
    required String accountNumber,
    required String bankCode,
    required String userName,
  }) async {
    final response = await dio.post('/kyc/bvn/verify', data: {
      'userId': userId,
      'bvn': bvn,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
      'userName': userName,
    });
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return BvnVerificationResponse.fromJson(response.data);
    } else {
      throw Exception(response.data['message'] ?? 'BVN verification failed');
    }
  }

  Future<void> submitBusinessDetails(Map<String, dynamic> businessDetails) async {
    print('DEBUG: Submitting business details to API: $businessDetails');
    final response = await dio.post('/kyc/business-details', data: businessDetails);
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('DEBUG: Business details submitted successfully');
    } else {
      throw Exception(response.data['message'] ?? 'Business details submission failed');
    }
  }

  @override
  Future<Map<String, dynamic>> uploadDocument({
    required String userId,
    required String documentType,
    required File document,
  }) async {
    print('DEBUG: Uploading document: $documentType for user: $userId');
    
    final formData = FormData.fromMap({
      'userId': userId,
      'documentType': documentType,
      'document': await MultipartFile.fromFile(
        document.path,
        filename: document.path.split('/').last,
      ),
    });

    final response = await dio.post(
      '/kyc/documents/upload',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('DEBUG: Document uploaded successfully: ${response.data}');
      return response.data;
    } else {
      throw Exception(response.data['message'] ?? 'Document upload failed');
    }
  }
}

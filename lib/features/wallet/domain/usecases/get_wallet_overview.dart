import 'package:dartz/dartz.dart';
import '../entities/wallet_overview_response.dart';
import '../repositories/wallet_repository.dart';

class GetWalletOverview {
  final WalletRepository _repository;

  GetWalletOverview(this._repository);

  Future<Either<String, WalletOverviewResponse>> call() async {
    final result = await _repository.getWalletOverview();
    return result.fold(
      (failure) => Left(failure.toString()),
      (overview) => Right(overview),
    );
  }
}

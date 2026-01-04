import 'package:injectable/injectable.dart';
import '../repositories/onboarding_repository.dart';

@Injectable()
class GetOnboardingStatus {
  final OnboardingRepository repository;

  GetOnboardingStatus(this.repository);

  Future<bool> call() async {
    return await repository.isOnboardingCompleted();
  }
}

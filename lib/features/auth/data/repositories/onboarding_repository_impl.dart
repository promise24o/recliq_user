import 'package:injectable/injectable.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_secure_storage.dart';

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingSecureStorage secureStorage;
  static const String _onboardingKey = 'onboarding_completed';

  OnboardingRepositoryImpl(this.secureStorage);

  @override
  Future<bool> isOnboardingCompleted() async {
    try {
      final value = await secureStorage.read(_onboardingKey);
      return value == 'true';
    } catch (e) {
      // On error, assume onboarding not completed to be safe
      return false;
    }
  }

  @override
  Future<void> completeOnboarding() async {
    try {
      await secureStorage.write(_onboardingKey, 'true');
    } catch (e) {
      // Log error but don't throw - onboarding completion is not critical
      print('Failed to save onboarding status: $e');
    }
  }
}

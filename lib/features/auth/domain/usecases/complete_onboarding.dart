import 'package:injectable/injectable.dart';
import '../repositories/onboarding_repository.dart';

@Injectable()
class CompleteOnboarding {
  final OnboardingRepository repository;

  CompleteOnboarding(this.repository);

  Future<void> call() async {
    return await repository.completeOnboarding();
  }
}

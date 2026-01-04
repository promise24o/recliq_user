import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../domain/usecases/complete_onboarding.dart';
import '../../../../core/constants/image_paths.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late CompleteOnboarding _completeOnboarding;
  int _currentPage = 0;

  final List<WelcomeSlide> _slides = [
    WelcomeSlide(
      imagePath: ImagePaths.welcomeBackground,
      title: 'Turn Waste Into Wealth',
      description:
          'Transform everyday waste into real earnings. Sell your recyclables to trusted agents, get paid instantly, and watch your wallet grow. Every pickup is tracked, every transaction is transparent, and every action helps build a greener future.',
    ),
    WelcomeSlide(
      imagePath: ImagePaths.cleanCommunity,
      title: 'Cleaner Communities, Brighter Futures',
      description:
          'Join thousands of Nigerians who are improving their neighborhoods one pickup at a time. By recycling, you reduce pollution, support circular economies, and help create safer, healthier streets for families and businesses around you.',
    ),
    WelcomeSlide(
      imagePath: ImagePaths.earnRewards,
      title: 'Earn Instantly, Withdraw Anytime',
      description:
          'No delays, no haggling, no excuses. Get rewarded for every kilogram you recycle with verified pricing and secure payouts. Withdraw to your bank or mobile wallet whenever you want — your effort, your earnings, your control.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _completeOnboarding = GetIt.instance<CompleteOnboarding>();
    _progressController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _onTap() {
    // Remove any existing status listener to prevent multiple calls
    _progressController.removeStatusListener(_onProgressComplete);
    _progressController.addStatusListener(_onProgressComplete);
    _progressController.forward();
  }

  void _onProgressComplete(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      // Remove the listener to prevent memory leaks
      _progressController.removeStatusListener(_onProgressComplete);
      _nextPage();
    }
  }

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      setState(() {
        _currentPage++;
      });
      _progressController.reset();
    } else {
      _getStarted();
    }
  }

  void _getStarted() async {
    await _completeOnboarding();
    if (mounted) {
      context.go('/auth-gate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen background image
          Positioned.fill(
            child: Image.asset(
              _slides[_currentPage].imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Dark overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Skip button
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () async {
                          await _completeOnboarding();
                          if (mounted) {
                            context.go('/auth-gate');
                          }
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Title
                    Text(
                      _slides[_currentPage].title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Description
                    Text(
                      _slides[_currentPage].description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Circular progress button
                    Center(
                      child: GestureDetector(
                        onTap: _onTap,
                        child: AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, child) {
                            return SizedBox(
                              width: 80,
                              height: 80,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Progress ring
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CircularProgressIndicator(
                                      value: _progressAnimation.value,
                                      strokeWidth: 3,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Center icon or text
                                  _progressAnimation.value == 0.0
                                      ? const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 32,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeSlide {
  final String imagePath;
  final String title;
  final String description;

  WelcomeSlide({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

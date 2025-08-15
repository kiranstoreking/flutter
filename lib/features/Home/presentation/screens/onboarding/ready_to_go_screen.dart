import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/profile_screen.dart';
import 'package:lottie/lottie.dart';

// Star Widget
class Star extends StatelessWidget {
  final double size;
  final Color color;

  const Star({Key? key, required this.size, required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _StarPainter(color));
  }
}

class _StarPainter extends CustomPainter {
  final Color color;
  _StarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    final w = size.width;
    final h = size.height;
    final halfW = w / 2;
    final halfH = h / 2;
    final radius = min(halfW, halfH);

    for (int i = 0; i < 5; i++) {
      double angle = (i * 72 - 90) * pi / 180;
      double x = halfW + radius * cos(angle);
      double y = halfH + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      angle = ((i + 0.5) * 72 - 90) * pi / 180;
      x = halfW + radius / 2 * cos(angle);
      y = halfH + radius / 2 * sin(angle);
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawShadow(path, Colors.yellowAccent, 2.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelcomeScreen extends StatefulWidget {
  final String userName;
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const WelcomeScreen({
    Key? key,
    required this.userName,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textController;
  late AnimationController _sparkleController;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    print("WelcomeScreen initState - userName: '${widget.userName}'");

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    // Automatically navigate to ProfileScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProfilePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    _sparkleController.dispose();
    super.dispose();
  }

  List<Widget> _buildStars() {
    return List.generate(12, (index) {
      final left = _random.nextDouble() * MediaQuery.of(context).size.width;
      final top = _random.nextDouble() * 300.rh;
      final size = (_random.nextDouble() * 10 + 4).rw;

      return AnimatedBuilder(
        animation: _sparkleController,
        builder: (context, child) {
          return Positioned(
            left: left,
            top: top + 10.rh * sin(_sparkleController.value * 2 * pi),
            child: Star(size: size, color: Colors.red.withOpacity(0.9)),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "You're all set!",
        subtitle: "We're already searching for jobs that match\nyour profile.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: Stack(
        children: [
          // Floating stars
          ..._buildStars(),

          // Center content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: 24.symmetricPadding(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Layered Lottie Animations with halo
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        RotationTransition(
                          turns: Tween<double>(begin: 0, end: 0.05).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.elasticOut,
                              ),
                            ),
                            child: Lottie.asset(
                              AppAssets.celebrate,
                              repeat: true,
                              height: 200.rh,
                              width: 200.rw,
                            ),
                          ),
                        ),
                        RotationTransition(
                          turns: Tween<double>(begin: 0, end: -0.03).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.85, end: 0.95)
                                .animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.elasticOut,
                                  ),
                                ),
                            child: Lottie.asset(
                              AppAssets.celebrate1,
                              repeat: true,
                              height: 150.rh,
                              width: 150.rw,
                            ),
                          ),
                        ),
                      ],
                    ),
                    48.vSpace,

                    // Animated Text
                    ScaleTransition(
                      scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _textController,
                          curve: Curves.easeOutBack,
                        ),
                      ),
                      child: SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _textController,
                                curve: Curves.easeOut,
                              ),
                            ),
                        child: FadeTransition(
                          opacity: _textController,
                          child: Column(
                            children: [
                              Text(
                                "Full Name:",
                                style: AppTextStyles.displayMedium.copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.gray800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              12.vSpace,
                              Text(
                                widget.userName,
                                style: AppTextStyles.displaySmall.copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    64.vSpace,
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

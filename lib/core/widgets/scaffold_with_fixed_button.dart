import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';

class ScaffoldWithFixedButton extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool isLoading;
  final bool isButtonEnabled;
  final Color? backgroundColor;
  final EdgeInsets? buttonPadding;
  final Widget? customButton;

  const ScaffoldWithFixedButton({
    Key? key,
    this.appBar,
    required this.body,
    required this.buttonText,
    required this.onButtonPressed,
    this.isLoading = false,
    this.isButtonEnabled = true,
    this.backgroundColor,
    this.buttonPadding,
    this.customButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content area
            Expanded(child: body),
            // Fixed bottom button container
            Container(
              padding: buttonPadding ?? EdgeInsets.all(16.rw),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.rw,
                    offset: Offset(0, -2.rh),
                  ),
                ],
              ),
              child:
                  customButton ??
                  CustomButton(
                    text: buttonText,
                    onPressed: isButtonEnabled && !isLoading
                        ? onButtonPressed
                        : () {},
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative widget for screens that need the button to be part of the scrollable content
class ScaffoldWithScrollableButton extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget> children;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool isLoading;
  final bool isButtonEnabled;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;
  final Widget? customButton;

  const ScaffoldWithScrollableButton({
    Key? key,
    this.appBar,
    required this.children,
    required this.buttonText,
    required this.onButtonPressed,
    this.isLoading = false,
    this.isButtonEnabled = true,
    this.backgroundColor,
    this.contentPadding,
    this.customButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: contentPadding ?? EdgeInsets.all(16.rw),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ...children,
                const Spacer(),
                customButton ??
                    CustomButton(
                      text: buttonText,
                      onPressed: isButtonEnabled && !isLoading
                          ? onButtonPressed
                          : () {},
                    ),
                30.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

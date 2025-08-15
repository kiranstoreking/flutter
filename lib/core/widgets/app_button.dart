// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_text_styles.dart';

// enum AppButtonType {
//   primary,
//   secondary,
//   outline,
//   text,
//   danger,
// }

// enum AppButtonSize {
//   small,
//   medium,
//   large,
// }

// class AppButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final AppButtonType type;
//   final AppButtonSize size;
//   final bool isLoading;
//   final bool isDisabled;
//   final IconData? icon;
//   final Widget? trailingIcon;
//   final EdgeInsetsGeometry? padding;
//   final double? width;
//   final double? height;
//   final BorderRadius? borderRadius;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final Color? borderColor;

//   const AppButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//     this.type = AppButtonType.primary,
//     this.size = AppButtonSize.medium,
//     this.isLoading = false,
//     this.isDisabled = false,
//     this.icon,
//     this.trailingIcon,
//     this.padding,
//     this.width,
//     this.height,
//     this.borderRadius,
//     this.backgroundColor,
//     this.textColor,
//     this.borderColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isEnabled = onPressed != null && !isLoading && !isDisabled;
    
//     return SizedBox(
//       width: width,
//       height: height ?? _getHeight(),
//       child: _buildButton(isEnabled),
//     );
//   }

//   Widget _buildButton(bool isEnabled) {
//     switch (type) {
//       case AppButtonType.primary:
//         return ElevatedButton(
//           onPressed: isEnabled ? onPressed : null,
//           style: _getElevatedButtonStyle(),
//           child: _buildButtonContent(),
//         );
        
//       case AppButtonType.secondary:
//         return ElevatedButton(
//           onPressed: isEnabled ? onPressed : null,
//           style: _getSecondaryButtonStyle(),
//           child: _buildButtonContent(),
//         );
        
//       case AppButtonType.outline:
//         return OutlinedButton(
//           onPressed: isEnabled ? onPressed : null,
//           style: _getOutlinedButtonStyle(),
//           child: _buildButtonContent(),
//         );
        
//       case AppButtonType.text:
//         return TextButton(
//           onPressed: isEnabled ? onPressed : null,
//           style: _getTextButtonStyle(),
//           child: _buildButtonContent(),
//         );
        
//       case AppButtonType.danger:
//         return ElevatedButton(
//           onPressed: isEnabled ? onPressed : null,
//           style: _getDangerButtonStyle(),
//           child: _buildButtonContent(),
//         );
//     }
//   }

//   Widget _buildButtonContent() {
//     if (isLoading) {
//       return SizedBox(
//         width: _getIconSize(),
//         height: _getIconSize(),
//         child: CircularProgressIndicator(
//           strokeWidth: 2,
//           valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
//         ),
//       );
//     }

//     final children = <Widget>[];
    
//     if (icon != null) {
//       children.add(
//         Icon(
//           icon,
//           size: _getIconSize(),
//           color: _getTextColor(),
//         ),
//       );
      
//       if (text.isNotEmpty) {
//         children.add(SizedBox(width: _getSpacing()));
//       }
//     }
    
//     if (text.isNotEmpty) {
//       children.add(
//         Text(
//           text,
//           style: _getTextStyle(),
//           textAlign: TextAlign.center,
//         ),
//       );
//     }
    
//     if (trailingIcon != null) {
//       if (text.isNotEmpty) {
//         children.add(SizedBox(width: _getSpacing()));
//       }
//       children.add(trailingIcon!);
//     }
    
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: children,
//     );
//   }

//   // Button Styles
//   ButtonStyle _getElevatedButtonStyle() {
//     return ElevatedButton.styleFrom(
//       backgroundColor: backgroundColor ?? AppColors.primary,
//       foregroundColor: textColor ?? AppColors.white,
//       padding: padding ?? _getPadding(),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius ?? BorderRadius.circular(_getBorderRadius()),
//       ),
//       elevation: 2,
//       shadowColor: AppColors.shadow,
//     );
//   }

//   ButtonStyle _getSecondaryButtonStyle() {
//     return ElevatedButton.styleFrom(
//       backgroundColor: backgroundColor ?? AppColors.secondary,
//       foregroundColor: textColor ?? AppColors.white,
//       padding: padding ?? _getPadding(),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius ?? BorderRadius.circular(_getBorderRadius()),
//       ),
//       elevation: 2,
//       shadowColor: AppColors.shadow,
//     );
//   }

//   ButtonStyle _getOutlinedButtonStyle() {
//     return OutlinedButton.styleFrom(
//       foregroundColor: textColor ?? AppColors.primary,
//       padding: padding ?? _getPadding(),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius ?? BorderRadius.circular(_getBorderRadius()),
//       ),
//       side: BorderSide(
//         color: borderColor ?? AppColors.primary,
//         width: 1,
//       ),
//     );
//   }

//   ButtonStyle _getTextButtonStyle() {
//     return TextButton.styleFrom(
//       foregroundColor: textColor ?? AppColors.primary,
//       padding: padding ?? _getPadding(),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius ?? BorderRadius.circular(_getBorderRadius()),
//       ),
//     );
//   }

//   ButtonStyle _getDangerButtonStyle() {
//     return ElevatedButton.styleFrom(
//       backgroundColor: backgroundColor ?? AppColors.error,
//       foregroundColor: textColor ?? AppColors.white,
//       padding: padding ?? _getPadding(),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius ?? BorderRadius.circular(_getBorderRadius()),
//       ),
//       elevation: 2,
//       shadowColor: AppColors.shadow,
//     );
//   }

//   // Helper methods
//   double _getHeight() {
//     switch (size) {
//       case AppButtonSize.small:
//         return 36;
//       case AppButtonSize.medium:
//         return 48;
//       case AppButtonSize.large:
//         return 56;
//     }
//   }

//   EdgeInsetsGeometry _getPadding() {
//     switch (size) {
//       case AppButtonSize.small:
//         return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
//       case AppButtonSize.medium:
//         return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
//       case AppButtonSize.large:
//         return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
//     }
//   }

//   double _getBorderRadius() {
//     switch (size) {
//       case AppButtonSize.small:
//         return 6;
//       case AppButtonSize.medium:
//         return 8;
//       case AppButtonSize.large:
//         return 12;
//     }
//   }

//   double _getIconSize() {
//     switch (size) {
//       case AppButtonSize.small:
//         return 16;
//       case AppButtonSize.medium:
//         return 20;
//       case AppButtonSize.large:
//         return 24;
//     }
//   }

//   double _getSpacing() {
//     switch (size) {
//       case AppButtonSize.small:
//         return 8;
//       case AppButtonSize.medium:
//         return 12;
//       case AppButtonSize.large:
//         return 16;
//     }
//   }

//   TextStyle _getTextStyle() {
//     switch (size) {
//       case AppButtonSize.small:
//         return AppTextStyles.buttonSmall;
//       case AppButtonSize.medium:
//         return AppTextStyles.buttonMedium;
//       case AppButtonSize.large:
//         return AppTextStyles.buttonLarge;
//     }
//   }

//   Color _getTextColor() {
//     if (textColor != null) return textColor!;
    
//     switch (type) {
//       case AppButtonType.primary:
//       case AppButtonType.secondary:
//       case AppButtonType.danger:
//         return AppColors.white;
//       case AppButtonType.outline:
//       case AppButtonType.text:
//         return AppColors.primary;
//     }
//   }
// }

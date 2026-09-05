import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

///  default button on this project with primary color
///  change it as needed
class PrimaryButton extends StatelessWidget {
  /// first option to use widget inside the button
  final Widget? child;

  /// Display text in button.
  final String? text;

  /// action function when button is onClick
  final void Function() onPressed;

  /// the option to change button color
  final Gradient? gradient;

  /// the width of the button.
  final double width;

  /// the height of the button.
  final double? height;

  /// wether the button is can be clicked or not
  final bool enabled;

  /// for reversing only the color of the button including text if the code is using [title]
  final bool reverse;

  /// Background color of button. Default value is primary color.
  final Color? color;

  /// Border radius of the button
  final BorderRadiusGeometry? borderRadius;

  /// The radius of the button shape.
  final double radiusValue;

  /// Width of the border
  final double? borderWidth;

  /// Text color of button, default value is white.
  final Color? borderColor;

  /// Elevation value of button.
  final double elevation;

  /// Leading icon inside button.
  final IconData? icon;

  /// Text color of leading icon, default value is white.
  final Color? iconColor;

  /// Leading icon with Widget
  final Widget? leading;

  /// Text color of button, default value is white.
  final Color? textColor;

  /// The style of text button.
  final TextStyle? textStyle;

  /// The size of text button.
  final double? fontSize;

  /// Font weight text and icon inside button.
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  /// The button width will follow the content
  final bool wrapContent;

  /// The label box fit.
  final BoxFit? boxFit;

  static const EdgeInsets _defaultPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 6);

  static TextStyle _defaultTextStyle({
    required bool enabled,
    required bool reverse,
    Color? color,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
      height: 1.5,
      color: !enabled
          ? AppColors.neutral60
          : textColor ??
              (reverse ? color ?? AppColors.primaryDark : AppColors.neutral10),
    );
  }

  const PrimaryButton({
    super.key,
    this.child,
    required this.text,
    required this.onPressed,
    this.gradient,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius,
    this.radiusValue = 12,
    this.borderWidth,
    this.borderColor,
    this.elevation = 0,
    this.icon,
    this.iconColor,
    this.leading,
    this.enabled = true,
    this.reverse = false,
    this.color,
    this.textColor,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.wrapContent = false,
    this.boxFit,
  });

  const PrimaryButton.icon({
    super.key,
    required this.child,
    this.text,
    required this.onPressed,
    this.gradient,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius,
    this.radiusValue = 12,
    this.borderWidth,
    this.borderColor,
    this.elevation = 0,
    this.icon,
    this.iconColor,
    this.leading,
    this.enabled = true,
    this.reverse = false,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.wrapContent = false, 
    this.textStyle,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = leading != null || icon != null;
    final label = FittedBox(
      fit: boxFit ?? BoxFit.scaleDown,
      child: child ??
          Text(
            text ?? '',
            textAlign: TextAlign.center,
            style: textStyle ??
                _defaultTextStyle(
                  enabled: enabled,
                  reverse: reverse,
                  color: color,
                  textColor: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
          ),
    );
    final buttonStyle = ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: gradient != null
          ? Colors.transparent
          : (reverse)
              ? Colors.transparent
              : color ?? AppColors.primaryDark,
      disabledBackgroundColor: AppColors.neutral30,
      shadowColor: reverse ? Colors.transparent : null,
      padding: padding ?? _defaultPadding,
      minimumSize: Size(wrapContent ? 0 : width, height ?? 48),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
        side: BorderSide(
          color: enabled
              ? (reverse)
                  ? borderColor ?? color ?? AppColors.primaryDark
                  : borderColor ?? Colors.transparent
              : AppColors.neutral40,
          width: borderWidth ?? 1.5,
          style: BorderStyle.solid,
        ),
      ),
    );

    return Container(
      width: (wrapContent) ? null : width,
      height: (wrapContent) ? null : height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
      ),
      child: hasIcon
          ? ElevatedButton.icon(
              onPressed: enabled ? onPressed : null,
              style: buttonStyle,
              icon: leading ??
                  Icon(
                    icon,
                    color: iconColor ??
                        (reverse
                            ? color ?? AppColors.primaryDark
                            : AppColors.neutral10),
                  ),
              label: label,
            )
          : ElevatedButton(
              onPressed: enabled ? onPressed : null,
              style: buttonStyle,
              child: label,
            ),
    );
  }
}

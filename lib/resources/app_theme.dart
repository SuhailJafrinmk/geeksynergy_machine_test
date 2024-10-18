import 'package:flutter/material.dart';
import 'package:machine_test_geeksynergy/resources/app_colors.dart';
import 'package:machine_test_geeksynergy/resources/app_textstyles.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  textTheme: const TextTheme(
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    displayLarge: AppTextStyles.headlineLarge,
    displayMedium: AppTextStyles.displayMedium,
    displaySmall: AppTextStyles.displaySmall,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall, 
  )
);
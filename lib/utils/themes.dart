import 'package:flutter/material.dart';

class Themes {
  // Dark Theme
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    /// Main Colors
    primaryColor: Colors.lightBlue,
    primaryColorDark: Colors.lightBlue[800],
    primaryColorLight: Colors.lightBlue[300],
    focusColor: Colors.lightBlue[800]?.withValues(
      alpha: 0.5,
    ),
    scaffoldBackgroundColor: const Color(
      0xFF181818,
    ), // AppBar Color
    disabledColor: Colors.white10,
    brightness: Brightness.dark,
    secondaryHeaderColor: Color(0xFF1d1d1d),
    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF303030),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF1d1d1d),
      shape: StadiumBorder(
        side: BorderSide(color: Colors.transparent),
      ),
    ),

    splashColor: Colors.lightBlue.withValues(alpha: 0.2),
    hoverColor: Colors.lightBlue[800]?.withValues(
      alpha: 0.1,
    ),

    /// ColorScheme
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.lightBlue,
      onPrimary: Colors.white,
      secondary: Colors.lightBlue[800]!,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: const Color(0xFF1b1b1b),
      onSurface: Colors.white,
    ),

    /// ProgressIndicator
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(
          color: Colors.lightBlue,
        ),

    /// Dialog
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF1d1d1d),
      surfaceTintColor: Color(0xFF161616),
    ),

    dividerColor: Colors.grey,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 0.5,
      endIndent: 8.0,
      indent: 8.0,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF161616);
        } else if (states.contains(WidgetState.disabled)) {
          return Colors.grey.withValues(alpha: .33);
        } else {
          return Colors.grey;
        }
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.lightBlue;
        } else if (states.contains(WidgetState.disabled)) {
          return const Color(
            0xFF161616,
          ).withValues(alpha: .33);
        }
        return const Color(0xFF161616);
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((
        states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Colors.lightBlue;
        } else if (states.contains(WidgetState.disabled)) {
          return Colors.grey.withValues(alpha: .33);
        }
        return Colors.grey;
      }),
    ),

    /// IconTheme
    iconTheme: IconThemeData(
      color: Colors.white.withValues(alpha: .87),
      size: 28,
    ),

    /// SnackBar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(
        0xFF161616,
      ).withValues(alpha: .87),
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF161616),
      surfaceTintColor: Color(0xFF161616),
    ),

    /// Drawer - This is for the Footer
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF202020),
      surfaceTintColor: Color(0xFF202020),
    ),

    /// Text
    textTheme: TextTheme(
      headlineSmall: const TextStyle(color: Colors.white),
      headlineLarge: const TextStyle(color: Colors.white),
      headlineMedium: const TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      titleMedium: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      titleSmall: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      bodyLarge: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      bodyMedium: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      bodySmall: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      displayLarge: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      displayMedium: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      displaySmall: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      labelLarge: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      labelMedium: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
      labelSmall: TextStyle(
        color: Colors.white.withValues(alpha: .87),
      ),
    ),
  );

  // Light Theme
  final ThemeData lightTheme = ThemeData.light().copyWith(
    /// Main Colors
    primaryColor: Colors.lightBlue,
    primaryColorDark: Colors.lightBlue[700],
    primaryColorLight: Colors.lightBlue[300],
    focusColor: Colors.lightBlue.withValues(alpha: .38),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    disabledColor: Colors.black.withValues(alpha: .38),
    brightness: Brightness.light,

    /// ColorScheme
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.lightBlue,
      onPrimary: Colors.black.withValues(alpha: .87),
      secondary: Colors.lightBlue[700]!,
      onSecondary: Colors.black.withValues(alpha: .87),
      error: Colors.red,
      onError: Colors.black.withValues(alpha: .87),
      surface: const Color(0xFFE2E2E2),
      onSurface: Colors.black.withValues(alpha: .87),
    ),

    /// AppBar
    appBarTheme: AppBarTheme(
      backgroundColor:
          Colors.lightBlue[300], // Standard Dark Appbar
      titleTextStyle: TextStyle(
        color: Colors.black.withValues(alpha: .87),
        fontSize: 18,
      ),

      iconTheme: IconThemeData(
        color: Colors.black.withValues(alpha: .87),
        size: 24,
      ),
    ),

    /// TabBar
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),

    /// ProgressIndicator
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(
          color: Colors.lightBlue,
        ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFE2E2E2),
    ),

    /// IconTheme
    iconTheme: IconThemeData(
      color: Colors.black.withValues(alpha: .87),
      size: 28,
    ),

    /// SnackBar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.lightBlue[400]?.withValues(
        alpha: .87,
      ),
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    /// BottomSheet
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFFE2E2E2),
    ),

    /// Drawer
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFFFFFFFF),
    ),

    /// Text
    textTheme: TextTheme(
      headlineLarge: const TextStyle(color: Colors.black),
      headlineMedium: const TextStyle(color: Colors.black),
      headlineSmall: const TextStyle(color: Colors.black),
      titleLarge: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      titleMedium: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      titleSmall: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      bodyLarge: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      bodyMedium: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      bodySmall: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      displayLarge: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      displayMedium: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      displaySmall: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      labelLarge: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      labelMedium: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
      labelSmall: TextStyle(
        color: Colors.black.withValues(alpha: .87),
      ),
    ),
  );
}

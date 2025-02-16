import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278210712),
      surfaceTint: Color(4278214321),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278219993),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282736519),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290762495),
      onSecondaryContainer: Color(4280631398),
      tertiary: Color(4286196629),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288893885),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294572543),
      onBackground: Color(4279770146),
      surface: Color(4294572543),
      onSurface: Color(4279770146),
      surfaceVariant: Color(4292731633),
      onSurfaceVariant: Color(4282468179),
      outline: Color(4285626244),
      outlineVariant: Color(4290889429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151543),
      inverseOnSurface: Color(4293849337),
      inversePrimary: Color(4289186047),
      primaryFixed: Color(4292207615),
      onPrimaryFixed: Color(4278197307),
      primaryFixedDim: Color(4289186047),
      onPrimaryFixedVariant: Color(4278208392),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278197307),
      secondaryFixedDim: Color(4289579253),
      onSecondaryFixedVariant: Color(4281157486),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4281532484),
      tertiaryFixedDim: Color(4293964031),
      onTertiaryFixedVariant: Color(4285538186),
      surfaceDim: Color(4292401891),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293717495),
      surfaceContainerHigh: Color(4293322993),
      surfaceContainerHighest: Color(4292928235),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278207361),
      surfaceTint: Color(4278214321),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278219993),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280894314),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284249759),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285209222),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288893885),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294572543),
      onBackground: Color(4279770146),
      surface: Color(4294572543),
      onSurface: Color(4279770146),
      surfaceVariant: Color(4292731633),
      onSurfaceVariant: Color(4282205007),
      outline: Color(4284047212),
      outlineVariant: Color(4285889416),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151543),
      inverseOnSurface: Color(4293849337),
      inversePrimary: Color(4289186047),
      primaryFixed: Color(4278219993),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278213805),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284249759),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282604932),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288893885),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287117473),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401891),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293717495),
      surfaceContainerHigh: Color(4293322993),
      surfaceContainerHighest: Color(4292928235),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278198855),
      surfaceTint: Color(4278214321),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278207361),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278198855),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280894314),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282253393),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285209222),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294572543),
      onBackground: Color(4279770146),
      surface: Color(4294572543),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292731633),
      onSurfaceVariant: Color(4280165423),
      outline: Color(4282205007),
      outlineVariant: Color(4282205007),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151543),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293192959),
      primaryFixed: Color(4278207361),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278201690),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280894314),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279184722),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285209222),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283301990),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401891),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293717495),
      surfaceContainerHigh: Color(4293322993),
      surfaceContainerHighest: Color(4292928235),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289186047),
      surfaceTint: Color(4289186047),
      onPrimary: Color(4278202464),
      primaryContainer: Color(4278219993),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4289579253),
      onSecondary: Color(4279447894),
      secondaryContainer: Color(4280434019),
      onSecondaryContainer: Color(4290236927),
      tertiary: Color(4293964031),
      onTertiary: Color(4283695213),
      tertiaryContainer: Color(4288893885),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279243546),
      onBackground: Color(4292928235),
      surface: Color(4279243546),
      onSurface: Color(4292928235),
      surfaceVariant: Color(4282468179),
      onSurfaceVariant: Color(4290889429),
      outline: Color(4287336862),
      outlineVariant: Color(4282468179),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928235),
      inverseOnSurface: Color(4281151543),
      inversePrimary: Color(4278214321),
      primaryFixed: Color(4292207615),
      onPrimaryFixed: Color(4278197307),
      primaryFixedDim: Color(4289186047),
      onPrimaryFixedVariant: Color(4278208392),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278197307),
      secondaryFixedDim: Color(4289579253),
      onSecondaryFixedVariant: Color(4281157486),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4281532484),
      tertiaryFixedDim: Color(4293964031),
      onTertiaryFixedVariant: Color(4285538186),
      surfaceDim: Color(4279243546),
      surfaceBright: Color(4281743680),
      surfaceContainerLowest: Color(4278914580),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280756785),
      surfaceContainerHighest: Color(4281414972),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289645823),
      surfaceTint: Color(4289186047),
      onPrimary: Color(4278195762),
      primaryContainer: Color(4282028537),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289842426),
      onSecondary: Color(4278195762),
      secondaryContainer: Color(4286091965),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294031103),
      onTertiary: Color(4281008186),
      tertiaryContainer: Color(4290932699),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279243546),
      onBackground: Color(4292928235),
      surface: Color(4279243546),
      onSurface: Color(4294703871),
      surfaceVariant: Color(4282468179),
      onSurfaceVariant: Color(4291152857),
      outline: Color(4288521137),
      outlineVariant: Color(4286415760),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928235),
      inverseOnSurface: Color(4280756785),
      inversePrimary: Color(4278208650),
      primaryFixed: Color(4292207615),
      onPrimaryFixed: Color(4278194473),
      primaryFixedDim: Color(4289186047),
      onPrimaryFixedVariant: Color(4278204010),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278194473),
      secondaryFixedDim: Color(4289579253),
      onSecondaryFixedVariant: Color(4279908188),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4280483887),
      tertiaryFixedDim: Color(4293964031),
      onTertiaryFixedVariant: Color(4284220024),
      surfaceDim: Color(4279243546),
      surfaceBright: Color(4281743680),
      surfaceContainerLowest: Color(4278914580),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280756785),
      surfaceContainerHighest: Color(4281414972),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4289186047),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289645823),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294703871),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289842426),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294031103),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279243546),
      onBackground: Color(4292928235),
      surface: Color(4279243546),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468179),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291152857),
      outlineVariant: Color(4291152857),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928235),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278200917),
      primaryFixed: Color(4292667391),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289645823),
      onPrimaryFixedVariant: Color(4278195762),
      secondaryFixed: Color(4292667391),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289842426),
      onSecondaryFixedVariant: Color(4278195762),
      tertiaryFixed: Color(4294761983),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294031103),
      onTertiaryFixedVariant: Color(4281008186),
      surfaceDim: Color(4279243546),
      surfaceBright: Color(4281743680),
      surfaceContainerLowest: Color(4278914580),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280756785),
      surfaceContainerHighest: Color(4281414972),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(4292491743),
    value: Color(4292491743),
    light: ColorFamily(
      color: Color(4287561877),
      onColor: Color(4294967295),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4287561877),
      onColor: Color(4294967295),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4287561877),
      onColor: Color(4294967295),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
    dark: ColorFamily(
      color: Color(4294945528),
      onColor: Color(4284088414),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294945528),
      onColor: Color(4284088414),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294945528),
      onColor: Color(4284088414),
      colorContainer: Color(4291240397),
      onColorContainer: Color(4294967295),
    ),
  );

  /// Custom Color 2
  static const customColor2 = ExtendedColor(
    seed: Color(4279038175),
    value: Color(4279038175),
    light: ColorFamily(
      color: Color(4278217314),
      onColor: Color(4294967295),
      colorContainer: Color(4280612581),
      onColorContainer: Color(4278210119),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4278217314),
      onColor: Color(4294967295),
      colorContainer: Color(4280612581),
      onColorContainer: Color(4278210119),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4278217314),
      onColor: Color(4294967295),
      colorContainer: Color(4280612581),
      onColorContainer: Color(4278210119),
    ),
    dark: ColorFamily(
      color: Color(4294311932),
      onColor: Color(4278204211),
      colorContainer: Color(4278250458),
      onColorContainer: Color(4278208065),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294311932),
      onColor: Color(4278204211),
      colorContainer: Color(4278250458),
      onColorContainer: Color(4278208065),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294311932),
      onColor: Color(4278204211),
      colorContainer: Color(4278250458),
      onColorContainer: Color(4278208065),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
    customColor2,
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

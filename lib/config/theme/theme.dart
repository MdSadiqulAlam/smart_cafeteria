import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283916632),
      surfaceTint: Color(4283916632),
      onPrimary: Color(4294967295),
      primaryContainer: Color(0xffbec9be),
      onPrimaryContainer: Color(4281219120),
      secondary: Color(4284243803),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293060063),
      onSecondaryContainer: Color(4282796614),
      tertiary: Color(4283981671),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290824144),
      onTertiaryContainer: Color(4281349950),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(0xfffcf9f7),
      onSurface: Color(0xff1b1c1b),
      onSurfaceVariant: Color(4282599491),
      outline: Color(4285823091),
      outlineVariant: Color(4291086530),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348143),
      inversePrimary: Color(4290693566),
      primaryFixed: Color(4292535770),
      onPrimaryFixed: Color(4279508503),
      primaryFixedDim: Color(4290693566),
      onPrimaryFixedVariant: Color(4282337601),
      secondaryFixed: Color(4292928478),
      onSecondaryFixed: Color(4279835929),
      secondaryFixedDim: Color(4291086274),
      onSecondaryFixedVariant: Color(4282665028),
      tertiaryFixed: Color(4292666348),
      onTertiaryFixed: Color(4279573539),
      tertiaryFixedDim: Color(4290824144),
      onTertiaryFixedVariant: Color(4282402639),
      surfaceDim: Color(4292663768),
      surfaceBright: Color(4294769143),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374385),
      surfaceContainer: Color(4293979627),
      surfaceContainerHigh: Color(4293585126),
      surfaceContainerHighest: Color(4293190368),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282074429),
      surfaceTint: Color(4283916632),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285364078),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282401856),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285691505),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282139723),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285429117),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294769143),
      onSurface: Color(4279966747),
      onSurfaceVariant: Color(4282401856),
      outline: Color(4284244059),
      outlineVariant: Color(4286086263),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348143),
      inversePrimary: Color(4290693566),
      primaryFixed: Color(4285364078),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283719510),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285691505),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284046681),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285429117),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283850085),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663768),
      surfaceBright: Color(4294769143),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374385),
      surfaceContainer: Color(4293979627),
      surfaceContainerHigh: Color(4293585126),
      surfaceContainerHighest: Color(4293190368),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279968797),
      surfaceTint: Color(4283916632),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282074429),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280230688),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282401856),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280034090),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282139723),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294769143),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362273),
      outline: Color(4282401856),
      outlineVariant: Color(4282401856),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348143),
      inversePrimary: Color(4293193699),
      primaryFixed: Color(4282074429),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280626983),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282401856),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280954410),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282139723),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280692020),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663768),
      surfaceBright: Color(4294769143),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374385),
      surfaceContainer: Color(4293979627),
      surfaceContainerHigh: Color(4293585126),
      surfaceContainerHighest: Color(4293190368),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292535769),
      surfaceTint: Color(4290693566),
      onPrimary: Color(4280890155),
      primaryContainer: Color(4289772464),
      onPrimaryContainer: Color(4280561191),
      secondary: Color(4291086274),
      onSecondary: Color(4281151790),
      secondaryContainer: Color(4282007098),
      onSecondaryContainer: Color(4291809996),
      tertiary: Color(4292666348),
      onTertiary: Color(4280955192),
      tertiaryContainer: Color(4289903042),
      onTertiaryContainer: Color(4280692020),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440147),
      onSurface: Color(4293190368),
      onSurfaceVariant: Color(4291086530),
      outline: Color(4287533708),
      outlineVariant: Color(4282599491),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190368),
      inversePrimary: Color(4283916632),
      primaryFixed: Color(4292535770),
      onPrimaryFixed: Color(4279508503),
      primaryFixedDim: Color(4290693566),
      onPrimaryFixedVariant: Color(4282337601),
      secondaryFixed: Color(4292928478),
      onSecondaryFixed: Color(4279835929),
      secondaryFixedDim: Color(4291086274),
      onSecondaryFixedVariant: Color(4282665028),
      tertiaryFixed: Color(4292666348),
      onTertiaryFixed: Color(4279573539),
      tertiaryFixedDim: Color(4290824144),
      onTertiaryFixedVariant: Color(4282402639),
      surfaceDim: Color(4279440147),
      surfaceBright: Color(4281940280),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4279966747),
      surfaceContainer: Color(4280229919),
      surfaceContainerHigh: Color(4280953385),
      surfaceContainerHighest: Color(4281677108),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292535769),
      surfaceTint: Color(4290693566),
      onPrimary: Color(4280429605),
      primaryContainer: Color(4289772464),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291349702),
      onSecondary: Color(4279441172),
      secondaryContainer: Color(4287533709),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292666348),
      onTertiary: Color(4280494641),
      tertiaryContainer: Color(4289903042),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440147),
      onSurface: Color(4294834936),
      onSurfaceVariant: Color(4291349702),
      outline: Color(4288717982),
      outlineVariant: Color(4286612607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190368),
      inversePrimary: Color(4282403394),
      primaryFixed: Color(4292535770),
      onPrimaryFixed: Color(4278850317),
      primaryFixedDim: Color(4290693566),
      onPrimaryFixedVariant: Color(4281284913),
      secondaryFixed: Color(4292928478),
      onSecondaryFixed: Color(4279112207),
      secondaryFixedDim: Color(4291086274),
      onSecondaryFixedVariant: Color(4281546547),
      tertiaryFixed: Color(4292666348),
      onTertiaryFixed: Color(4278915608),
      tertiaryFixedDim: Color(4290824144),
      onTertiaryFixedVariant: Color(4281349950),
      surfaceDim: Color(4279440147),
      surfaceBright: Color(4281940280),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4279966747),
      surfaceContainer: Color(4280229919),
      surfaceContainerHigh: Color(4280953385),
      surfaceContainerHighest: Color(4281677108),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294180594),
      surfaceTint: Color(4290693566),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291022530),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294573302),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291349702),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294573055),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291087316),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440147),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507765),
      outline: Color(4291349702),
      outlineVariant: Color(4291349702),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190368),
      inversePrimary: Color(4280495141),
      primaryFixed: Color(4292864734),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291022530),
      onPrimaryFixedVariant: Color(4279179282),
      secondaryFixed: Color(4293257442),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291349702),
      onSecondaryFixedVariant: Color(4279441172),
      tertiaryFixed: Color(4292995057),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291087316),
      onTertiaryFixedVariant: Color(4279244573),
      surfaceDim: Color(4279440147),
      surfaceBright: Color(4281940280),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4279966747),
      surfaceContainer: Color(4280229919),
      surfaceContainerHigh: Color(4280953385),
      surfaceContainerHighest: Color(4281677108),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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


  List<ExtendedColor> get extendedColors => [
  ];
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

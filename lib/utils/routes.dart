import '../ui/home/fixed_asset_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/splash/splash_screen.dart';

class RoutePaths {
  RoutePaths._();

  static const splash = '/';
  static const home = '/home';
  static const fixedAsset = '/fixedAsset';
}

final routes = {
  RoutePaths.splash: (_) => const SplashScreen(),
  RoutePaths.home: (_) => const HomeScreen(),
  RoutePaths.fixedAsset: (_) => const FixedAssetScreen(),
};

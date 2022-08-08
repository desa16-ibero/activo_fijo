import 'package:activo_fijo/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'services/fixed_asset_service.dart';
import 'utils/custom_colors.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeService()),
        ChangeNotifierProvider(create: (_) => FixedAssetService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Activo fijo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: CustomColors.colorCustom,
          primaryColor: CustomColors.mainColor,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              color: CustomColors.mainColor),
        ),
        builder: EasyLoading.init(),
        initialRoute: '/',
        routes: routes,
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('es'), Locale('en')],
      ),
    );
  }
}

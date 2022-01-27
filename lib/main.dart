import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/providers/imagesProvider/images_provider.dart';
import 'package:meeps/providers/meeps_tv_provider.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:meeps/providers/profile_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'components/responsiveBloc/size_config.dart';
import 'screens/splashScreen/splash_screen.dart';

Future<void> main() async {
  // runApp(DevicePreview(
  //     builder: (context) => const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<MeepsTvProvider>(
            create: (_) => MeepsTvProvider()),
        ChangeNotifierProvider<imagesProvider>(create: (_) => imagesProvider()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return ChangeNotifierProvider(
            create: (context) => StateSettingProvider(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(backgroundColor: Colors.white),
                home: SplashScreen()),
          );
        });
      }),
    );
  }
}

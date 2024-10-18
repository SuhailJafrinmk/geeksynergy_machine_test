import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_geeksynergy/blocs/authentication/authentication_bloc.dart';
import 'package:machine_test_geeksynergy/blocs/movies/movies_bloc.dart';
import 'package:machine_test_geeksynergy/data/hive/hive_helper.dart';
import 'package:machine_test_geeksynergy/data/network/dio_configure.dart';
import 'package:machine_test_geeksynergy/resources/app_theme.dart';
import 'package:machine_test_geeksynergy/ui/screens/home_screen.dart';
import 'package:machine_test_geeksynergy/ui/screens/login_screen.dart';

Future<void> main()async{
WidgetsFlutterBinding.ensureInitialized();
await HiveHelper().initHive();
DioClient.instance.initialize();
runApp(MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => AuthenticationBloc(),
    ),
    BlocProvider(
      create: (context) => MoviesBloc(),
 
    )
  ],
  child: const MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: HiveHelper().isUserSignedIn() ? const HomeScreen() : const LoginScreen(),
    );
  }
}

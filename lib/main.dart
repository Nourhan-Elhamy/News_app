import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/core/utils/app_fonts.dart';
import 'package:userapp/features/Home/data/repos/home_repo_implemetation.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:userapp/features/Home/presentation/views/home_bottom.dart';
import 'package:userapp/features/Home/presentation/views/profile_screen.dart';
import 'package:userapp/features/Home/presentation/views/widgets/home/home_screen.dart';
import 'package:userapp/features/auth/login/presentation/views/login_screen.dart';
import 'package:userapp/features/auth/profile/presentation/views/profile_screen.dart';
import 'package:userapp/features/splash/views/splash_screen.dart';

import 'features/Home/presentation/controller/categories/categories_cubit.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("profileBox");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (c)=> TopHeadlineCubit(homeRepo: HomeRepoImplementationFromApi()),
          ),
          BlocProvider(
            create: (c)=>BookMarksCubit(),
          ),
          BlocProvider(create: (c) => CategoriesCubit()),
          ],
      child: const MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:AppFonts.poppinsfont
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


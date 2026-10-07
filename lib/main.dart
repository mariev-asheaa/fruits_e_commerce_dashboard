import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/dashboard/dashboard_view.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'core/services/supabase_stoarge.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupaBaseStorgeService.initSupabase();
  await SupaBaseStorgeService.createBuckets('fruits_images');
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
     onGenerateRoute: onGenerateRoute,
    );
  }
}

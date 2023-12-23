import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_estados/bloc/user/user_bloc.dart';
import 'package:project_estados/pages/pagina1_page.dart';
import 'package:project_estados/pages/pagina2_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page(),
        },
      ),
    );
  }
}

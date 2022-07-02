import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/app/bloc/bank/bank_bloc.dart';
import 'package:test/app/bloc/mock/mock_bloc.dart';
import 'package:test/app/pages/home/home.dart';
import 'package:test/app/repositories/bank/bank_repository.dart';
import 'package:test/app/repositories/mock/mock_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget(
      {Key? key, required this.bankRepository, required this.mockRepository})
      : super(key: key);
  final BankRepository bankRepository;
  final MockRepository mockRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashView(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BankBloc>(
            create: (_) => BankBloc(bankRepository: bankRepository),
          ),
          BlocProvider<MockBloc>(
            create: (BuildContext context) =>
                MockBloc(mockRepository: mockRepository),
          ),
        ],
        child: HomePage(),
        // child: const SplashPage(),
      ),
    );
  }
}

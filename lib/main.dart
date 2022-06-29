import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:freshbucket/bloc/shop/shop_bloc.dart';
import 'package:freshbucket/bloc/user/user_bloc.dart';
import 'package:freshbucket/services/user/userservice.dart';
import 'package:freshbucket/view/home/homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) {
            return UserBloc(
              userService: UserService(),
            )..add(LoadUserEvent());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        home: BlocProvider(
          create: (context) => ShopBloc()..add(ShopPageInitializedEvent()),
          child: HomeView(),
        ),
      ),
    );
  }
}

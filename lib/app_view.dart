import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicey/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:slicey/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:slicey/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:slicey/screens/auth/views/welcome_screen.dart';
import 'package:slicey/screens/home/views/home_screen.dart';
import 'package:user_repository/user_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Pizza App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white
        )
      ),
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder:(context,state){
          if(state.status==AuthenticationStatus.authenticated){
            return HomeScreen();
          }
          else{
            return WelcomeScreen();
          }
        }
      ),
    );
  }
}

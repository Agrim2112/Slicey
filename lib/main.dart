import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bloc/bloc.dart';
import 'app.dart';
import 'simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCRXMRn9A7q8MGVvYNg3v5peOcRdVG9itQ',
        appId: '1:709020047999:android:bab172d11509294acabd4a',
        messagingSenderId: '709020047999',
        projectId: 'slicey-b4b12',
        storageBucket: '1:709020047999:android:bab172d11509294acabd4a', ));
  Bloc.observer= SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typeracer_tutorial/providers/client_state_provider.dart';
import 'package:typeracer_tutorial/providers/game_state_provider.dart';
import 'package:typeracer_tutorial/screens/create_room_screen.dart';
import 'package:typeracer_tutorial/screens/game_screen.dart';
import 'package:typeracer_tutorial/screens/home_screen.dart';
import 'package:typeracer_tutorial/screens/join_room_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClientStateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Typeracer Tutorial',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create-room': (context) => const CreateRoomScreen(),
          '/join-room': (context) => const JoinRoomScreen(),
          '/game-screen': (context) => const GameScreen(),
        },
      ),
    );
  }
}

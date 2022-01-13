import "package:flutter/material.dart";
import "package:todo_app/home_view.dart";

void main() {
  runApp(const MyApp()); // Wrap your app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My ToDo App",
      theme: ThemeData(
          // primaryColor: const Colors.,
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amberAccent,
      )),
      home: HomeView(),
    );
  }
}

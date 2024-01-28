import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => home(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
      },
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/palestine.png"),
            fit: BoxFit.cover,
          )
        ),
  child: Center(
    child: Text("skander palestine"),
  )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> {},
        tooltip: 'Get Random Image',
        child: Icon(Icons.refresh),
      ),


    );
  }
}
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]); // mengeset orientasi
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Responsive'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              color: Colors.redAccent,
            ),
            Container(
              width: 400,
              height: MediaQueryHeigh * 0.4,
              color: Colors.blue,
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text('Coba'),
                      subtitle: Text('data'),
                      trailing: Text('data'),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

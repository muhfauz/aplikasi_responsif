import 'package:faker/faker.dart';
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
  Faker faker = Faker();
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeigh = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final myApbar = AppBar(
      centerTitle: true,
      title: Text('Aplikasi Responsive'),
    );
    final bool isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final myBody = MediaQueryHeigh -
        myApbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myApbar,
      body: (isLanscape)
          ? Column(
              children: [
                Container(
                  width: MediaQueryWidth,
                  height: myBody * 0.5,
                  color: Colors.redAccent,
                  child: Image.network('https://picsum.photos/id/10/200/300'),
                ),
                Container(
                  width: 400,
                  height: myBody * 0.5,
                  color: Colors.blue,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(index.toString()),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/${index}/200/300'),
                            ),
                            title: Text(faker.person.name()),
                            subtitle: Text(faker.lorem.sentence()),
                            trailing: Text(faker.internet.userName()),
                          ),
                        );
                      }),
                )
              ],
            )
          : Column(
              children: [
                Container(
                  width: MediaQueryWidth,
                  height: myBody * 0.4,
                  color: Colors.redAccent,
                  child: Image.network('https://picsum.photos/id/10/200/300'),
                ),
                Container(
                  width: 400,
                  height: myBody * 0.6,
                  color: Colors.blue,
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(index.toString()),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/${index}/200/300'),
                            ),
                            title: Text(faker.person.name()),
                            subtitle: Text(faker.lorem.sentence()),
                            trailing: Text(faker.internet.userName()),
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}

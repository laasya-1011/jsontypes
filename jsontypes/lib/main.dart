import 'package:flutter/material.dart';
import 'package:jsontypes/PostPage.dart';
import 'package:provider/provider.dart';
import 'StateManager.dart';
import 'package:flutter/services.dart';
import 'package:jsontypes/DetailedView/DetailedAlbum.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
    //  statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StateManager>(create: (_) => StateManager()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statemanager = Provider.of<StateManager>(context);

    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text('Json API Parsing'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: statemanager.fetchJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.error == true) {
              return Container(
                child: Center(
                  child: Text("Some Problem"),
                ),
              );
            } else if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("No Data"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailedView(album: snapshot.data[index])));
                    },
                    child: Card(
                      color: Colors.amber,
                      margin: EdgeInsets.only(
                          bottom: 30, right: 20, left: 20, top: 10),
                      elevation: 5,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                snapshot.data[index].thumbnailUrl,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data[index].title),
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data[index].url),
                            ],
                          )),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PostPage()));
        },
        child: Icon(Icons.post_add_sharp),
        splashColor: Colors.greenAccent,
        backgroundColor: Colors.red,
      ),
    );
  }
}

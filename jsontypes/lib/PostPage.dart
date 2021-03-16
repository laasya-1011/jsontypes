import 'package:flutter/material.dart';
import 'package:jsontypes/StateManager.dart';
import 'package:provider/provider.dart';
import 'package:jsontypes/DetailedView/DetailedPosts.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final statemanage = Provider.of<StateManager>(context);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text('Post Json API Parsing'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: statemanage.fetchPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot1) {
            if (snapshot1.error == true) {
              return Container(
                child: Center(
                  child: Text("Some Problem"),
                ),
              );
            } else if (snapshot1.data == null) {
              return Container(
                child: Center(
                  child: Text("No Data"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot1.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailedPosts(posts: snapshot1.data[index])));
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
                              Text(snapshot1.data[index].name),
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot1.data[index].email),
                              SizedBox(
                                height: 6,
                              ),
                              Text(snapshot1.data[index].body)
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
          print('next');
        },
        child: Icon(Icons.post_add_sharp),
        splashColor: Colors.greenAccent,
        backgroundColor: Colors.red,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page/acceuil.dart';
import 'page/chat.dart';
import 'page/formextrait.dart';
import 'page/profile.dart';
import 'page/homepagemairie.dart';
class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePageMairie(),
    Acceuil(),
    Chat(),
    Profile()

  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =  HomePageMairie();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text("HomePage")),
    //   body: Center(
    //     child: Text('Mairie', style: TextStyle(fontSize: 40)),
    //   ),
    // );
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FormExtrait()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 100,
                      onPressed: (){
                        setState(() {
                          currentScreen = Acceuil();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,

                          ),
                          Text(
                            'Acceuil',
                            style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey
                            ),
                          )
                        ],
                      ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: (){
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,

                        ),
                        Text(
                          'Demande',
                          style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: (){
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,

                        ),
                        Text(
                          'Profile',
                          style: TextStyle(color: currentTab == 2 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

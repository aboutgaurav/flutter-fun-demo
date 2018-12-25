import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: true,
      home: MyHomePage(title: 'BottomNavigationBar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///Flag to maintain currently selected bottomNavigation item index.
  ///Default first item is selected i.e index=0
  int selectedItemIndex = 0;

  ///Flag to maintain bottomNavigation type i.e fixed nad shifting
  ///0 for fixed type nad 1 for shifting type
  int bottomNavigationType = 0;

  ///Function to return text for currently selected item.l
  Text selectedItemText() {
    switch (selectedItemIndex) {
      case 0:
        return Text('Home Selcted',
            style: TextStyle(fontSize: 18, color: Colors.pink));
      case 1:
        return Text('Explore Selcted',
            style: TextStyle(fontSize: 18, color: Colors.pink));
      case 2:
        return Text('Add Selcted',
            style: TextStyle(fontSize: 18, color: Colors.pink));
      case 3:
        return Text('Profile Selcted',
            style: TextStyle(fontSize: 18, color: Colors.pink));
      default:
        return Text('Home Selcted',
            style: TextStyle(fontSize: 18, color: Colors.pink));
    }
  }

  ///Function to handle bottomNavigation item selection.
  void _onItemSelected(int index) {
    setState(() {
      //Update flag here
      selectedItemIndex = index;
    });
  }

  ///Function to toggle bottomNavigation b/w fixed nad shifting
  void _toggleBottomNavigationType() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.
      if (bottomNavigationType == 0) {
        bottomNavigationType = 1;
      } else {
        bottomNavigationType = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: selectedItemText(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //Note backgroundColor will be used only when bottomNavigationType == shifting
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('Explore'),backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), title: Text('Add'),backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'),backgroundColor: Colors.pink),
        ],
        type: bottomNavigationType == 0
            ? BottomNavigationBarType.fixed
            : BottomNavigationBarType.shifting,
        currentIndex: selectedItemIndex,
        onTap: _onItemSelected,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleBottomNavigationType,
        tooltip: 'Toggle b/w  fixed and shifting type',
        child: Icon(Icons.swap_horiz),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

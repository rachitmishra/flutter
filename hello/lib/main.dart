import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevicePreview(builder: (ctx) => MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp();
  MyApp.forDesignTime();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: Center(child: Parent())),
      ),
    );
  }
}

// ui = f(state)
// lift up state
// state propogation
// callback down
// setState()

//class Parent extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return SharedModel();
//  }
//}
//
//class SharedModel extends State {
//  String _name;
//
//  @override
//  Widget build(BuildContext context) {
//    setState(() {
//      _name = "2";
//    });
//    return Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[Child1(_updateName), Child2(_name)]);
//  }
//
//  void _updateName(String newName) {
//    setState(() {
//      _name = newName;
//    });
//  }
//}
//
//class Child1 extends StatelessWidget {
//  final Function _updateName;
//
//  final players = ["Sachin", "Saurav", "Virat", "Rahul"];
//
//  Child1(this._updateName);
//
//  String _randomPlayer() {
//    players.shuffle();
//    return players.first;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: GestureDetector(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child:Text("Random player"),
//      ),
//      onTap: () => _updateName(_randomPlayer()),
//    ));
//  }
//}
//
//class Child2 extends StatelessWidget {
//  final String _name;
//
//  Child2(this._name);
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: GestureDetector(
//        child: Text("$_name"),
//      ),
//    );
//  }
//}

// InheritedWidget, InheritedModel

//class Parent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SharedInheritedWidget(NameModel(),
//        child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[Child1(), Child2()]));
//  }
//}
//
//class NameModel {
//  String name;
//
//  NameModel({this.name = ""});
//
//  void updateName(String newName) {
//    name = newName;
//  }
//
//  static NameModel of(BuildContext context) {
//    SharedInheritedWidget sharedModel =
//        context.inheritFromWidgetOfExactType(SharedInheritedWidget);
//    return sharedModel.name;
//  }
//}
//
//class SharedInheritedWidget extends InheritedWidget {
//  final NameModel _state;
//
//  NameModel get name => _state;
//
//  SharedInheritedWidget(this._state, {Widget child}) : super(child: child);
//
//  @override
//  bool updateShouldNotify(InheritedWidget oldWidget) => true;
//}
//
//class Child1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: GestureDetector(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child:
//            InkWell(child: Text("Random player"), highlightColor: Colors.red),
//      ),
//      onTap: () => NameModel.of(context).updateName("Hey"),
//    ));
//  }
//}
//
//class Child2 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: GestureDetector(
//        child: Text("${NameModel.of(context).name}"),
//      ),
//    );
//  }
//}

/**
 * class Parent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return SharedWidgetBinding(
    NameModel(),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[Child1(), Child2()]));
    }
    }

    class NameModel {
    String name;

    NameModel({this.name = ""});

    void updateName(String newName) {
    name = newName;
    }

    static NameModel of(BuildContext context) {
    SharedInheritedWidget sharedModel =
    context.inheritFromWidgetOfExactType(SharedInheritedWidget);
    return sharedModel.name.currentModel;
    }

    static void update(BuildContext context, NameModel newModel) {
    SharedInheritedWidget scope =
    context.inheritFromWidgetOfExactType(SharedInheritedWidget);
    scope.name.updateModel(newModel);
    }
    }

    class SharedInheritedWidget extends InheritedWidget {
    final SharedModelState _state;

    SharedModelState get name => _state;

    SharedInheritedWidget(this._state, {Widget child}) : super(child: child);

    @override
    bool updateShouldNotify(InheritedWidget oldWidget) => true;
    }

    class SharedWidgetBinding extends StatefulWidget {
    final NameModel initialModel;
    final Widget child;

    SharedWidgetBinding(this.initialModel, this.child);

    @override
    SharedModelState createState() => SharedModelState();
    }

    class SharedModelState extends State<SharedWidgetBinding> {
    NameModel currentModel;

    @override
    void initState() {
    super.initState();
    currentModel = widget.initialModel;
    }

    void updateModel(NameModel newModel) {
    if (newModel != currentModel) {
    setState(() {
    currentModel = newModel;
    });
    }
    }

    @override
    Widget build(BuildContext context) {
    return SharedInheritedWidget(
    this,
    child: widget.child,
    );
    }
    }

    class Child1 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Center(
    child: GestureDetector(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child:
    InkWell(child: Text("Random player"), highlightColor: Colors.red),
    ),
    onTap: () => NameModel.of(context).updateName("Hey"),
    ));
    }
    }

    class Child2 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Center(
    child: GestureDetector(
    child: Text("${NameModel.of(context).name}"),
    ),
    );
    }
    }
 */

// dart.provider
//
// with ChangeNotifier
// notifyListeners();
// ChangeNotifierProvider(
// create: (context) => VideoPartModel()
// child
// Consumer<VideoPartModel>(builder: (context, model, child)
// Provider.of<>(
// MultiProvider
// ChangeNotifierProvider<T>.value

// Bloc (Rx)
// Mvvm

///
/// Inherited widgets are confusing, you need to ensure they don't rebuild for
/// your app state, but inherited widgets are stateless. So this is some
/// boilerplate I copy and paste into each project.
///
/// There are some comments below, to add as a live template in Android Studio
/// (highly recommended) see the AppStateLiveTemplate.txt file.
///

import 'package:flutter/widgets.dart';

import 'example.dart';

///
/// This class is just boilerplate
/// - You could copy / paste it and will never change it.
///
/// This handles the AppState.of(context) to return the right widget.
///
class AppState extends StatefulWidget {
  final Widget child;

  const AppState({Key key, @required this.child}) : super(key: key);

  static _InheritedAppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedAppState)
        as _InheritedAppState);
  }

  @override
  _AppStateState createState() => _AppStateState();
}

///
/// This is where you keep your singleton references to your viewmodels.
///
/// I have initalised the ExampleViewModel below.
///
/// This is setup using initState, because I often have another class that
/// handles network configurations that I pass into the stores.
///
class _AppStateState extends State<AppState> {
  ExampleViewModel exampleViewModel;

  @override
  void initState() {
    super.initState();
    exampleViewModel = ExampleViewModel(); //Init the example view model.
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(
        child: widget.child,
        exampleViewModel: exampleViewModel //Pass it to the inherited widget.
        );
  }

  @override
  void dispose() {
    super.dispose();
    exampleViewModel.dispose();
  }
}

class _InheritedAppState extends InheritedWidget {
  final ExampleViewModel exampleViewModel; //Set it as a final here

  const _InheritedAppState(
      {Key key,
        @required this.exampleViewModel, // Pass it in like any other widget.
        @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

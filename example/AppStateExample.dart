///
/// Inherited widgets are confusing, you need to ensure they don't rebuild for
/// your app state, but inherited widgets are stateless. So this is some
/// boilerplate I copy and paste into each project.
///
/// There are some comments below, to add as a live template in Android Studio
/// (highly recommended) see the AppStateLiveTemplate.txt file.
///

import 'package:flutter/widgets.dart';

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(child: widget.child, state: this);
  }
}

///
/// This class is just boilerplate
/// - You could copy / paste it and will never change it.
///
/// This handles the AppState.of(context) to return the right widget.
///
class AppState extends StatefulWidget {
  final Widget child;

  const AppState({Key key, @required this.child}) : super(key: key);

  static _AppStateState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedAppState>()
        ?.state;
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
class _InheritedAppState extends InheritedWidget {
  final _AppStateState state;

  const _InheritedAppState(
      {Key key, @required this.state, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

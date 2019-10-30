import 'package:flutter/widgets.dart';
import 'package:vmiso/vmiso.dart';

///
/// Basic usage, make a change, call `notify()`
///
class ExampleViewModel extends ViewModel {
  String name;
  DateTime dateOfBirth;

  updateDateOfBirth(DateTime value) {
    dateOfBirth = value;
    notify();
  }
}

///
/// You can also enable the view model to update all observers using a getter and setter.
///
/// Be careful doing this as it will trigger a redraw every time the variable is set.
///
class AutomaticNotification extends ViewModel {
  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
    notify();
  }
}


///
/// Observer Example usage
///
class ObserverExample extends StatelessWidget {
  final ExampleViewModel exampleViewModel;

  const ObserverExample({Key key, this.exampleViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      viewModel: exampleViewModel,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Text(exampleViewModel.name); //You can just call the instance of the viewmodel or the snapshot.
      },
    );
  }
}

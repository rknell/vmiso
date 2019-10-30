# vmiso

VMISO State Management (View Model, ~~Inherited Store,~~ Observer)

## Getting Started

VMISO provides super simple state management at the potential expense of some performance.

Currently being used in a number of small to mid scale production apps with no issues.

It works on the principle of maintaining a ViewModel class. Each time that should trigger an update call `notify()` and all `Observers` will update.

Under the hood it keeps to sound flutter principles - Observer is just a wrapper around StreamBuilder. Calling `notify()` passes the current class into a stream to an `Observer`. It probably sounds more complex than it is, check out the example below:

#### Simple ViewModel usage
```dart
///
/// make a change, call `notify()`
///
class ExampleViewModel extends ViewModel {
  String name;
  DateTime dateOfBirth;

  updateDateOfBirth(DateTime value) {
    dateOfBirth = value;
    notify();
  }
}
```

#### Using a getter and setter
```dart
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
```


#### Observer Example usage
```dart
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
```

#### What about inherited store?

The initial goal was to create a wrapper around an inherited widget that streamlined the store, but because of Dart's lack of reflection I haven't been able to product the results I was hoping for.

Instead I have created and use a live template in Android Studio to quickly generate my "`AppState`" widget


import 'package:flutter/widgets.dart';
import 'view_model.dart';

class Observer extends StatelessWidget {
  final Widget Function() builder;
  final ViewModel viewModel;

  const Observer({Key key, @required this.builder, @required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.stream,
        builder: (context, snapshot) {
          return builder();
        });
  }
}

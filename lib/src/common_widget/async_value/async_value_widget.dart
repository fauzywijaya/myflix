import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {Key? key,
      required this.value,
      required this.data,
      this.loading,
      this.error})
      : super(key: key);

  final AsyncValue<T> value;

  /// [INFO]
  /// function for success then return the data
  final Widget Function(T data) data;

  /// [INFO]
  /// function for loading then return the loading widget
  final Widget Function(Widget loadingWidget)? loading;

  /// [INFO]
  /// function for error then return the error widget
  final Widget Function(Widget errorWidget)? error;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

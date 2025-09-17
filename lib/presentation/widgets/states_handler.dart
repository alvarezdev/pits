import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class StatesHandler<B extends StateStreamable<S>, S> extends StatelessWidget {
  final List<SingleChildWidget> providers;

  /// Builder para la data ya cargada
  final Widget Function(BuildContext context, S state) onData;

  /// Builder opcional para loading
  final Widget Function(BuildContext context)? onLoading;

  /// Builder opcional para error
  final Widget Function(BuildContext context, S state)? onError;

  /// Permite al handler saber si el estado representa "loading"
  final bool Function(S state) isLoading;

  /// Permite al handler saber si el estado representa "error"
  final bool Function(S state) isError;

  const StatesHandler({
    super.key,
    required this.providers,
    required this.onData,
    required this.isLoading,
    required this.isError,
    this.onLoading,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: BlocConsumer<B, S>(
        listener: (context, state) {},
        builder: (context, state) {
          if (isLoading(state)) {
            return onLoading?.call(context) ??
                const Center(child: CircularProgressIndicator());
          }
          if (isError(state)) {
            return onError?.call(context, state) ??
                const Center(child: Text("An error occurred"));
          }
          return onData(context, state);
        },
      ),
    );
  }
}

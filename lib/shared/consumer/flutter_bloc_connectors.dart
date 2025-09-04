// core/presentation/flutter_bloc_connectors.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state_connectors.dart';

/// BlocBuilder equivalente
class BlocAppBuilder<B extends StateStreamable<S>, S, VM>
    extends IAppBuilder<VM> {
  final StateAdapter<S, VM> adapter;

  const BlocAppBuilder({
    super.key,
    required super.builder,
    required this.adapter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) => builder(context, adapter(state)),
    );
  }
}

/// BlocConsumer equivalente
class BlocAppConsumer<B extends StateStreamable<S>, S, VM>
    extends IAppConsumer<VM> {
  final StateAdapter<S, VM> adapter;
  final BlocWidgetListener<S>? listener;

  const BlocAppConsumer({
    super.key,
    required super.builder,
    required this.adapter,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: listener ?? (_, __) {},
      builder: (context, state) => builder(context, adapter(state)),
    );
  }
}

/// BlocListener equivalente
class BlocAppListener<B extends StateStreamable<S>, S>
    extends IAppListener {
  final BlocWidgetListener<S> listener;
  final Widget child;

  const BlocAppListener({
    super.key,
    required this.listener,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: listener,
      child: child,
    );
  }
}

/// MultiBlocListener equivalente
class BlocAppMultiListener extends IAppMultiListener {
  final List<IAppListener> listeners;
  final Widget child;

  const BlocAppMultiListener({
    super.key,
    required this.listeners,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: listeners.map((l) {
        if (l is BlocAppListener) {
          return BlocListener(
            listener: l.listener,
            child: l.child,
          );
        }
        throw UnsupportedError("Unsupported listener type");
      }).toList(),
      child: child,
    );
  }
}

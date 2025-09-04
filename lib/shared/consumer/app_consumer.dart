// core/presentation/app_consumer.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ViewModelBuilder<VM> = Widget Function(BuildContext, VM);
typedef StateAdapter<S, VM> = VM Function(S state);

abstract class IAppConsumer<B, S, VM> extends StatelessWidget {
  final StateAdapter<S, VM> adapter;
  final ViewModelBuilder<VM> builder;

  const IAppConsumer({super.key, required this.adapter, required this.builder});
}

// Implementación concreta con flutter_bloc
class BlocAppConsumer<B extends StateStreamable<S>, S, VM>
    extends IAppConsumer<B, S, VM> {
  const BlocAppConsumer({
    super.key,
    required super.adapter,
    required super.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        final vm = adapter(state);
        return builder(context, vm);
      },
    );
  }
}

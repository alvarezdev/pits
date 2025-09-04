
import 'package:flutter/widgets.dart';

typedef ViewModelBuilder<VM> = Widget Function(BuildContext context, VM vm);
typedef StateAdapter<S, VM> = VM Function(S state);

abstract class IAppBuilder<VM> extends StatelessWidget {
  final ViewModelBuilder<VM> builder;

  const IAppBuilder({super.key, required this.builder});
}

abstract class IAppConsumer<VM> extends StatelessWidget {
  final ViewModelBuilder<VM> builder;

  const IAppConsumer({super.key, required this.builder});
}

abstract class IAppListener extends StatelessWidget {
  const IAppListener({super.key});
}

abstract class IAppMultiListener extends StatelessWidget {
  const IAppMultiListener({super.key});
}

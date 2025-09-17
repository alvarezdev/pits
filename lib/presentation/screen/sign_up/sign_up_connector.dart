import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pits/application/sign_up/cubit/sign_up_cubit.dart';
import 'package:pits/di/dependency_injection.dart';
import 'package:pits/presentation/screen/screen.dart';
import 'package:pits/presentation/screen/sign_up/sign_up_view_model.dart';
import 'package:pits/presentation/widgets/states_handler.dart';

class SignUpConnector extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SingUpViewModel viewModel,
  ) builder;

  const SignUpConnector({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StatesHandler<SignUpCubit, SignUpState>(
      providers: [
        BlocProvider(
          create: (_) => getIt<SignUpCubit>()..loadDepartments(),
        ),
      ],
      isLoading: (state) => state is SignUpLoading,
      isError: (state) => state is SignUpError,
      onData: (context, state) => builder(context, state.toViewModel(context)),
    );
  }
}

import 'package:domain/entities/department.dart';
import 'package:pits/presentation/screen/screen.dart';

class SignUpWidget extends StatelessWidget {
  final List<Department> departments;

  const SignUpWidget({
    super.key,
    required this.departments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: departments.length,
      itemBuilder: (context, index) {
        final department = departments[index];
        return ListTile(
          title: Text(department.department),
          subtitle: Text(department.cities.join(', ')),
        );
      },
    );
  }
}

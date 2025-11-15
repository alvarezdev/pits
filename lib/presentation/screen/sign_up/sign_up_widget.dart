
import 'package:domain/entities/department.dart';
import 'package:pits/l10n-generated/l10n.dart';
import 'package:pits/presentation/screen/screen.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback? onRegisterUser;
  final List<Department> departments;

  const SignUpWidget({
    super.key,
    required this.departments,
    required this.onRegisterUser,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: departments.length,
  //     itemBuilder: (context, index) {
  //       final department = departments[index];
  //       return ListTile(
  //         title: Text(department.department),
  //         subtitle: Text(department.cities.join(', ')),
  //       );
  //     },
  //   );
  // }

  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _departamento;
  String? _ciudad;
  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  l10n!.singUpScreenTitle,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 40),

                // Nombre completo
                _buildTextField(
                  label: 'Nombre completo*',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    if (value.trim().length < 3) {
                      return 'Debe tener al menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Cédula
                _buildTextField(
                  label: 'Cédula*',
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu cédula';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Solo números permitidos';
                    }
                    if (value.length < 6) {
                      return 'Cédula inválida';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email
                _buildTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return null; // opcional
                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value)) {
                      return 'Correo no válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Teléfono
                _buildTextField(
                  label: 'Teléfono*',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu número';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Solo números permitidos';
                    }
                    if (value.length < 7) {
                      return 'Número inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Departamento
                _buildDropdown(
                  label: 'Departamento',
                  value: _departamento,
                  items: widget.departments.map((d) => d.department).toList(),
                  onChanged: (value) => setState(() => _departamento = value),
                  validator: (value) =>
                      value == null ? 'Selecciona un departamento' : null,
                ),
                const SizedBox(height: 16),

                // Ciudad
                _buildDropdown(
                  label: 'Ciudad',
                  value: _ciudad,
                  items: _departamento == null
                      ? []
                      : widget.departments
                          .firstWhere((d) => d.department == _departamento)
                          .cities,
                  onChanged: (value) => setState(() => _ciudad = value),
                  validator: (value) =>
                      value == null ? 'Selecciona una ciudad' : null,
                ),
                const SizedBox(height: 16),

                // Contraseñas (simplificadas)
                _buildPasswordFields('Contraseña'),
                const SizedBox(height: 16),
                _buildPasswordFields('Verificar contraseña'),
                const SizedBox(height: 24),

                // Aceptar términos
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (v) => setState(() => _termsAccepted = v!),
                    ),
                    const Text(
                      'Acepto ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'términos y condiciones',
                      style: TextStyle(color: Colors.yellow[700]),
                    ),
                  ],
                ),
                if (!_termsAccepted)
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Debes aceptar los términos',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 24),

                // Botón Enviar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    child: const Text(
                      'ENVIAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Métodos auxiliares ---

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF23272A),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0x33FFFFFF), width: 1), // 20% opacidad blanca
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFC107), width: 1.1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      validator: validator,
      items:
          items.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
      onChanged: onChanged,
      dropdownColor: const Color(0xFF23272A),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF23272A),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildPasswordFields(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.only(right: 8),
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF23272A),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !_termsAccepted) {
      setState(() {}); // Para refrescar el mensaje de términos
      return;
    }

    // ✅ Todos los campos son válidos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Formulario enviado correctamente')),
    );
  }
}

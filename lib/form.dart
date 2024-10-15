import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Controladores para obtener los datos ingresados en el formulario
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Función para mostrar el diálogo con los datos ingresados
  void _showComplaintDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles de la Queja'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nombre: ${nameController.text}'),
                Text('Correo: ${emailController.text}'),
                Text('Teléfono: ${phoneController.text}'),
                Text('Asunto: ${subjectController.text}'),
                Text('Descripción: ${descriptionController.text}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar la ventana emergente
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Quejas'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre Completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Asunto de la Queja',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showComplaintDialog();
              },
              child: const Text('Enviar Queja'),
            ),
          ],
        ),
      ),
    );
  }
}

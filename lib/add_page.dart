import 'package:basice_provider/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  final ctrl = TextEditingController();
  AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildAddTextField(context),
          const SizedBox(height: 12),
            buildAddButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildAddButton(BuildContext context) {
    return ElevatedButton(onPressed: () {
            context.read<Todo>().add(ctrl.text);
            Navigator.pop(context);
          }, child: const Text('Add'),);
  }

  TextField _buildAddTextField(BuildContext context) {
    return TextField(
            controller: ctrl,
            decoration: const InputDecoration(
              labelText: 'Enter a task',
            ),
            onSubmitted: (text) {
              Provider.of<Todo>(context, listen: false).add(text);
              Navigator.pop(context);
            },
          );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Add Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<Todo>().add(ctrl.text);
            Navigator.pop(context);
          },
        )
    );
  }
}

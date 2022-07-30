import 'package:basice_provider/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final ctrl = TextEditingController();
    ctrl.text = Provider.of<Todo>(context).tasks[index];

    return Scaffold(
      appBar: _buildAppBar(context, ctrl),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildEditTextField(ctrl, context),
            const SizedBox(height: 12),
            _buildSaveButton(context, ctrl),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildSaveButton(
      BuildContext context, TextEditingController ctrl) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Todo>(context, listen: false).edit(index, ctrl.text);
        Navigator.pop(context);
      },
      child: const Text('Save'),
    );
  }

  TextField _buildEditTextField(
      TextEditingController ctrl, BuildContext context) {
    return TextField(
      controller: ctrl,
      decoration: const InputDecoration(),
      onSubmitted: (text) {
        Provider.of<Todo>(context, listen: false).edit(index, text);
        Navigator.pop(context);
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, TextEditingController ctrl) {
    return AppBar(
      title: const Text('Edit Page'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Provider.of<Todo>(context, listen: false).edit(index, ctrl.text);
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<Todo>(context, listen: false).delete(index);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

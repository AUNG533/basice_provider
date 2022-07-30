import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:basice_provider/home_page.dart';
import 'package:basice_provider/state.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<Todo>(
      create: (_) => Todo(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}



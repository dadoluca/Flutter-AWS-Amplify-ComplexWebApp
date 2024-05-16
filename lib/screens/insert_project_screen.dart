import 'package:flutter/material.dart';
import 'package:reply_project_management/widgets/forms/insert_project_form.dart';
import '../variables/my_colors.dart';

class InsertProjectScreen extends StatelessWidget {
  const InsertProjectScreen({Key? key}) : super(key: key);
  static const routeName = '/insert-project-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi Progetto'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.white,
              myColors.primary,
              myColors.primary.withOpacity(0.8),
              myColors.primary.withOpacity(0.4),
            ],
            stops: [
              0.0,
              0.6,
              1.0,
            ],
          ),
        ),
        child: const Center(
          child: InsertProjectForm(),
        ),
      ),
    );
  }
}

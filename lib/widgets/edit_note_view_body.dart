import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomAppBar(
              title: "Edit Note",
              icon: Icons.check,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: 'title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: "content",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

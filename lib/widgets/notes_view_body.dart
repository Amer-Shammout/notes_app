import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomAppBar(),
            SizedBox(
              height: 10,
            ),
            CustomNoteItem(title: "a", subTitle: "desc"),
            SizedBox(
              height: 10,
            ),
            
          ],
        ),
      ),
    );
  }
}

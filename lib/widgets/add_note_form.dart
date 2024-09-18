import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/intl.dart";
import "package:notes_app/cubits/add_note_cubit/add_note_cubit.dart";
import "package:notes_app/models/note_model.dart";
import "package:notes_app/widgets/colors_list_view.dart";
import "package:notes_app/widgets/custom_button.dart";
import "package:notes_app/widgets/custom_text_field.dart";

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'subtitle',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          //!To Do
          const SizedBox(
            height: 32,
          ),
          ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading,
                title: "Add",
                onTap: () async {
                  await buttonAction(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> buttonAction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      DateTime currentDate = DateTime.now();
      String formattedDate =
          "${DateFormat.MMMM().format(currentDate)} ${currentDate.day},${currentDate.year}";
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: formattedDate,
        color: Colors.blue.value,
      );
      await BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

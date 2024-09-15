import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/utilities/validators.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import 'package:smart_cafeteria/model/note_model.dart';
import 'edit_note_controller.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditNoteController(note));

    return Form(
      key: controller.editNoteFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          TextFormField(
            controller: controller.title,
            validator: (value) => MyValidator.validateEmptyText('Title', value),
            style: const TextStyle(fontSize: 28),
            decoration: const InputDecoration(border: InputBorder.none, hintText: 'Title'),
          ),

          /// note body
          TextFormField(
            controller: controller.noteBody,
            validator: (value) => MyValidator.validateEmptyText('Description', value),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(border: InputBorder.none, hintText: 'Description'),
          ),

          /// update note button
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: () => controller.updateNote(),
              style: FilledButton.styleFrom(
                backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              ),
              child: const Text('Update Note', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

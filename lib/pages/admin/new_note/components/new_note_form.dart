import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/admin/new_note/components/new_note_controller.dart';
import 'package:smart_cafeteria/utilities/validators.dart';
import 'package:smart_cafeteria/config/get_config.dart';

class NewNoteForm extends StatelessWidget {
  const NewNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewNoteController());

    return Form(
      key: controller.newNoteFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          TextFormField(
            controller: controller.title,
            // validator: (value) => MyValidator.validateEmptyText('Title', value),
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

          ///add note button
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: () => controller.createNote(context),
              style: FilledButton.styleFrom(
                backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              ),
              child: const Text('Add Note', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

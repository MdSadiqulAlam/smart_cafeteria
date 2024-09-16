import 'package:get/get.dart';
import 'package:smart_cafeteria/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/admin/notes_admin/components/notes_listview_controller.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';

class EditNoteController extends GetxController {
  final NoteModel note;

  EditNoteController(this.note);

  final editNoteFormKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController noteBody;

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController(text: note.title);
    noteBody = TextEditingController(text: note.note);
  }

  Future<void> updateNote() async {
    try {
      MyLoadingWidgets.loadingDialogue();

      /// Form Validation
      if (!editNoteFormKey.currentState!.validate()) {
        Get.back();
        return;
      }
      final updatedNote = NoteModel(
        id: note.id,
        title: title.text,
        note: noteBody.text,
        createDate: note.createDate,
      );

      /// update in firebase
      final noteData = NoteData();
      await noteData.updateInFirestore(updatedNote);

      /// update the notes list in front end
      NotesListviewController.instance.fetchNotes();

      ///  go back to previous screen
      Get.back();
      Get.back();
      MyLoadingWidgets.successSnackBar(title: 'Success!', message: 'Note updated successfully.');
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

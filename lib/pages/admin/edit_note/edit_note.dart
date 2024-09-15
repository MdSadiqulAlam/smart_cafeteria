import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import '../../../model/note_model.dart';
import 'components/edit_note_form.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppbar(showTitle: true, pageTitle: 'Edit Note', titlePadding: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: const ClampingScrollPhysics(),
        child: EditNoteForm(note: note),
      ),
    );
  }
}

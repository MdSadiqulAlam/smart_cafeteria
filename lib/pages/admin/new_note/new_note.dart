import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import 'package:smart_cafeteria/pages/admin/new_note/components/new_note_form.dart';

class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppbar(showTitle: true, pageTitle: 'New Note', titlePadding: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: ClampingScrollPhysics(),
        child: NewNoteForm(),
      ),
    );
  }
}

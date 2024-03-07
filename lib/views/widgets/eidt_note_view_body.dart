import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets//custom_text_field.dart';

import 'custom_app_bar.dart';

class EidtNoteViewBody extends StatefulWidget {
  const EidtNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EidtNoteViewBody> createState() => _EidtNoteViewBodyState();
}

class _EidtNoteViewBodyState extends State<EidtNoteViewBody> {
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:[
          const SizedBox(height: 50,),
           CustomAppBar(
             onPressed: () {
               widget.note.title =title ?? widget.note.title;
               widget.note.subTitle =content ?? widget.note.subTitle;
               widget.note.save();
               BlocProvider.of<NotesCubit>(context).fetchAllNotes();
               Navigator.pop(context);
             },
             icon: Icons.check,
           title:'Edit Note',),
          const SizedBox(height: 50,),
       CustomTextField(
         onChanged: (value) {
           title = value;
         },
           hint: widget.note.title),
          const SizedBox(height: 16,),
          CustomTextField(
            onChanged: (value){
              content = value;
            },
            hint: widget.note.subTitle
            ,maxLines: 5,),
        ],
      ),
    );
  }
}

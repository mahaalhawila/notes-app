import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
part 'notes_state.dart';
class NotesCubit extends Cubit<NotesState> {
  NotesCubit() :super(NotesInitial());
List <NoteModel>? notes;
  fetchAllNotes(){

      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();

  }
}
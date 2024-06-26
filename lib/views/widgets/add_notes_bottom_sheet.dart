import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import '../../cubits/add_notes_cubit/add_notes_cubit.dart';
import 'add_note_form.dart';
class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit,AddNotesState>(
        listener:(context,state){
          if(state is AddNotesFailure){
            // print('failied ${state.errMessage}');
          }
          if(state is AddNotesSuccess){
            //refresh after add note
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            ////////
            Navigator.pop(context);
          }
        },
        builder:(context,state){
          return  AbsorbPointer(
          absorbing:state is AddNotesLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(left: 16,right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
                child: AddNoteForm()),
          ));
      }
      ),
    );
  }
}





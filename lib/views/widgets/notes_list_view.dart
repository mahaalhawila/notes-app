import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_note_item.dart';

class NotsListView extends StatelessWidget {
  const NotsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: ( context, state) {
        // List <NoteModel> notes =BlocProvider.of<NotesCubit>(context).notes??[];
         List <NoteModel> notes =BlocProvider.of<NotesCubit>(context).notes!;
     return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder:(context,index)=>const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(),
              )),
        );
      },
    );
  }
}
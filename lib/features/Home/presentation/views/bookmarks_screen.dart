import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_states.dart';
import 'package:userapp/features/Home/presentation/views/widgets/home/list_view_for_news.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarksCubit,BookMarkStates>(
      builder: (context, snapshot) {
        return ListViewForNewsWidget(
            newsw:BlocProvider.of<BookMarksCubit>(context).bookMarksModel .toSet().toList());
      }
    );
  }
}

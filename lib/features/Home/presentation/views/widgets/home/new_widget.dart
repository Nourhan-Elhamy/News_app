import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_cubit.dart';
import 'package:userapp/features/Home/presentation/controller/bookmark/bookmark_states.dart';

import '../../../../data/models/new_model.dart';
class NewsWidget extends StatelessWidget {
   NewsWidget({super.key, required this.newModel});
final NewModel newModel;

converDate(dateString){
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat(" kk:mm").format(dateTime);
  return formattedDate;

}

  @override
  Widget build(BuildContext context) {
  var bookMarkCubit=BlocProvider.of<BookMarksCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<BookMarksCubit,BookMarkStates>(
        builder: (context, snapshot) {
          return Column(
            children: [
              CachedNetworkImage(
                imageUrl: newModel.urlToImage??"",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 5,),
              Text(newModel.title??"",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5,),
              Text(newModel.desc??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(newModel.sourceModel.name??"",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 5,),
                  Icon(Icons.access_time_rounded),
                  Text(converDate(newModel.publishedAt??"")),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        bookMarkCubit.changeBookMark(newModel);

                      },
                      icon: Icon(Icons.bookmark,color: newModel.bookMark?AppColors.blue:AppColors.grey,))
                ],
              )
            ],
          );
        }
      ),
    );
  }
}

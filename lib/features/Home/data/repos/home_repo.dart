import 'package:dartz/dartz.dart';
import 'package:userapp/core/errors/failure.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';

abstract class HomeRepo{

  Future<Either<Failure,List<NewModel>>>TopHeadlineForNews(
  {
    required String category
}
      );
  Future<Either<Failure,List<NewModel>>>searchForNews(
  {
    required String q
}
      );

  Future<Either<Failure,List<NewModel>>>getNewsDetail(

       String id

      );
}
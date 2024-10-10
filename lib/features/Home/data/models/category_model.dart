import 'package:userapp/core/utils/app_images.dart';

class CategoryModel{
  final String name;
  final String photo;


  CategoryModel({
    required this.name,
    required this.photo
});


}

List<CategoryModel> categories = [
  CategoryModel(name: "sports", photo: AppImages.sportsimage, ),
  CategoryModel(name: "technology", photo: AppImages.technologyimage,),
  CategoryModel(name: "science", photo: AppImages.scienceimage, ),
  CategoryModel(name: "business", photo: AppImages.businessimage, ),
  CategoryModel(name: "general", photo: AppImages.generalimage, ),

];
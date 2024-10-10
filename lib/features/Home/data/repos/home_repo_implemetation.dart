import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:userapp/core/errors/failure.dart';
import 'package:userapp/core/utils/endpoints.dart';
import 'package:userapp/features/Home/data/models/new_model.dart';
import 'package:userapp/features/Home/data/repos/home_repo.dart';
import 'package:http/http.dart'as http;
class HomeRepoImplementationFromApi implements HomeRepo{
  @override
  
  
  Future<Either<Failure, List<NewModel>>> TopHeadlineForNews({required String category}) async{
    List <NewModel> news = [];

    // TODO: implement getTopHeadline
    try{
      var response = await http.get(Uri.parse("${EndPoints.baseUrl}${EndPoints.getTopHeadlinesEndpoint}?category=$category&apiKey=${EndPoints.apiKey}"));

      if(response.statusCode == 200) {

        for(var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
              title: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel:
              SourceModel(id: article["source"]["id"],
                  name:  article["source"]["name"]));
          news.add(newModel);
        }
        return right(news);
      }else{

        return left( ApiFailure(message: jsonDecode(response.body)["message"]));

      }
    } catch (e) {

      debugPrint(e.toString());
      return left(ApiFailure(message: "Oops error occurred!"));

    }
   
  }

  @override
  Future<Either<Failure, List<NewModel>>> searchForNews({required String q}) async{
    List <NewModel> news = [];

   try{

     var response = await http.get(Uri.parse("${EndPoints.baseUrl}${EndPoints.searchAboutNews}?q=$q&apiKey=${EndPoints.apiKey}"));
     if(response.statusCode==200){
       for(var article in jsonDecode(response.body)["articles"] ){
         NewModel newModel = NewModel(
             title: article["title"],
             desc: article["description"],
             content: article["content"],
             urlToImage: article["urlToImage"],
             url: article["url"],
             publishedAt: article["publishedAt"],
             sourceModel:
             SourceModel(id: article["source"]["id"],
                 name:  article["source"]["name"]));
         news.add(newModel);
       }
       return (right(news));
     }
     else{
       return left(ApiFailure(message: jsonDecode(response.body)["message"]));
     }

   }
       catch(e){
         return left(ApiFailure(message: "Oops error occurred!"));
       }
  }

  @override
  Future<Either<Failure, List<NewModel>>> getNewsDetail(String id) async{
    List <NewModel> news = [];

    try{

      var response = await http.get(Uri.parse("${EndPoints.baseUrl}${EndPoints.searchAboutNews}?q=$id&apiKey=${EndPoints.apiKey}"));
      if(response.statusCode==200){
        for(var article in jsonDecode(response.body)["articles"] ){
          NewModel newModel = NewModel(
              title: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel:
              SourceModel(id: article["source"]["id"],
                  name:  article["source"]["name"]));
          news.add(newModel);
        }
        return (right(news));
      }
      else{
        return left(ApiFailure(message: jsonDecode(response.body)["message"]));
      }

    }
    catch(e){
      return left(ApiFailure(message: "Oops error occurred!"));
    }
  }

}
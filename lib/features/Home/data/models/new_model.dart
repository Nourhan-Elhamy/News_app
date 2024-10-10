import 'package:equatable/equatable.dart';

class NewModel extends Equatable{
  final String? title;
  final String ?desc;
  final String ?content;
  final String ?url;
  final String ?urlToImage;
  final String ?publishedAt;
  final SourceModel sourceModel;
  bool bookMark;

  NewModel({required this.title, required this.desc, required this.content,
    required this.url, required this.urlToImage, required this.publishedAt,
    required this.sourceModel,
    this.bookMark=false});

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    desc,
    content,
    url,
    urlToImage,
    publishedAt,
    sourceModel,

  ];




}
class SourceModel extends Equatable{
  final String? id ;
  final String ?name ;
  SourceModel({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
  ];

}
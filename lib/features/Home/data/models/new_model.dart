import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class NewModel extends Equatable{

  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String ?desc;

  @HiveField(2)
  final String ?content;

  @HiveField(3)
  final String ?url;

  @HiveField(4)
  final String ?urlToImage;

  @HiveField(5)
  final String ?publishedAt;

  @HiveField(6)
  final SourceModel sourceModel;

  @HiveField(7)
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
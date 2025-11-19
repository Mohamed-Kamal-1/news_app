import 'package:news_app/domain/model/source/source.dart';

class SourceResponseModel {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceResponseModel({this.status, this.code, this.message, this.sources});
}

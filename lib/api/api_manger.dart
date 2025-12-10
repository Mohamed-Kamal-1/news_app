import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/api/model/respons/news_article/Article_response_dto.dart';
import 'package:news_app/api/model/respons/news_source/Source_response_dto.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'endpoints/endpoints.dart';

@singleton
class ApiManger {
  final dio = Dio();

  ApiManger() {
    dio.options.baseUrl = _baseUrl;
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  static ApiManger? _apiManger;

  static ApiManger getInstance() {
    _apiManger ??= ApiManger();
    return _apiManger!;
  }

  static const String _baseUrl = 'https://newsapi.org/v2';

  // static const String _apiKey = '3f1fd1414c284e95bb0c3527a127fc73';
  //   static const String _apiKey = 'e9b8dbc2094c48daa5c6f3859bc1d339';
    static const String _apiKey = '3f1fd1414c284e95bb0c3527a127fc73';

  Future<SourceResponseDto> getNewsSources(String categoryId) async {
    Map<String, String> parameter = {'apiKey': _apiKey, "category": categoryId};
    Response response = await dio.get(
      Endpoints.sourcesApi,
      queryParameters: parameter,
    );
    SourceResponseDto sourceResponse = SourceResponseDto.fromJson(
      response.data,
    );
    return sourceResponse;
  }

  Future<ArticleResponseDto> getArticles(String sourceId) async {
    Map<String, String> parameter = {'apiKey': _apiKey, "sources": sourceId};
    Response response = await dio.get(
      Endpoints.articlesApi,
      queryParameters: parameter,
    );
    ArticleResponseDto articleResponse = ArticleResponseDto.fromJson(
      response.data,
    );

    return articleResponse;
  }

  Future<ArticleResponseDto> searchForArticles(
    String searchKeyWord, {
    int? page,
    int? pageSize,
  }) async {
    Map<String, dynamic> parameter = {
      'q': searchKeyWord,
      'apiKey': _apiKey,
      'page': page,
      'pageSize': pageSize,
    };
    Response response = await dio.get(
      Endpoints.articlesApi,
      queryParameters: parameter,
    );

    ArticleResponseDto articleResponse = ArticleResponseDto.fromJson(
      response.data,
    );
    return articleResponse;
  }

  // static Future<SourceResponse> getSources() async {
  //   try {
  //     Map<String, String> parameter = {'apiKey': _apiKey};
  //     Uri uri = Uri.http(_baseUrl, Endpoints.sourcesApi);
  //     http.Response response = await http.get(uri, headers: parameter);
  //     String responseBody = response.body;
  //     print("==============================================================");
  //     print(SourceResponse.fromJson(responseBody).sources);
  //     print("==============================================================");
  //     return SourceResponse.fromJson(responseBody);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<ArticleResponse> getArticles(String sourceId) async {
  //   try {
  //     Map<String, String> parameter = {'apiKey': _apiKey, 'sources': sourceId};
  //     Uri uri = Uri.https(_baseUrl, Endpoints.articlesApi, parameter);
  //     http.Response response = await http.get(uri);
  //     String responseBody = response.body;
  //     final jsonResponse = jsonDecode(responseBody);
  //     return ArticleResponse.fromJson(jsonResponse);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

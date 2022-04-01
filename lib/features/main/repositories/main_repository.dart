import 'package:dio/dio.dart';
import 'package:rickandmortyapi/services/api/api_service.dart';
import 'package:rickandmortyapi/services/repository/repository.dart';
import 'package:rickandmortyapi/shared/constants/endpoint.dart';

class MainRepository extends Repository {
  final ApiService _apiService = ApiService();

  @override
  Future<Map<String, dynamic>> getData(String page) async {
    final queries = {
      'page': page,
    }..removeWhere((key, value) => value == '0' || value == '');

    final Response response = await _apiService.getData(
      Endpoints.characters.buildURL().toString(),
      queryParameters: queries,
    );
    return response.data;
  }
}

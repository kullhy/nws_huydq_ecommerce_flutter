import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();
  var headers = {'Content-Type': 'application/json'};

  Future<Response> postAPI(Object data, String url) async {
    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    return response;
  }

  Future<Response> getAPI(String url) async {
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> putAPI(String url, Object data) async {
    var response = await dio.request(
      url,
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> getAPIWithToken(String url, String token) async {
    var headers = {'Authorization': 'Bearer $token'};
    var dio = Dio();
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    return response;
  }
}

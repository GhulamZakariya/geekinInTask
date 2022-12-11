import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class SearchRemoteServices {
  ///get articles
  Future<dynamic> getArticles(
    Map filters, int page
  ) async {
    Map<String, String> authenticatedHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer gwtpKmNrLgRRQS51",
    };

    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&page=$page&api-key=b32zaWmswaXeRayR377kvYn6FPAGEqTP"),
          headers: authenticatedHeaders);
      dynamic data = jsonDecode(response.body);
      log("data ${response.body}");
      log("status code ${response.statusCode}");
      log("request ${response.request}");
      if (response.statusCode == 200) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log("exception: ${e.toString()}");
      return null;
    }
  }

  ///get books
  Future<dynamic> getBooks(int page) async {
    Map<String, String> authenticatedHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer gwtpKmNrLgRRQS51",
    };

    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?page=$page&api-key=b32zaWmswaXeRayR377kvYn6FPAGEqTP"),
          headers: authenticatedHeaders);
      dynamic data = jsonDecode(response.body);
      log("data ${response.body}");
      log("status code ${response.statusCode}");
      log("request ${response.request}");
      if (response.statusCode == 200) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log("exception: ${e.toString()}");
      return null;
    }
  }
}

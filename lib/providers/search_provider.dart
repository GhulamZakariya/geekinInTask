import 'package:flutter/material.dart';
import 'package:nex_gen_task/models/md_article.dart';
import 'package:nex_gen_task/remoteServices/search_services.dart';

import '../models/md_book.dart';

class SearchProvider with ChangeNotifier {
  dynamic articlesData;
  dynamic booksData;
  List<Doc> mdArticle = [];
  List<ListElement> mdBook = [];
  bool loadingArticleData = false;
  bool loadingBooksData = false;
  int bookPage = 1;
  int articlePage = 1;

  ///article filters
  TextEditingController newsDesk = TextEditingController(text: "");
  TextEditingController firstSource = TextEditingController(text: "");
  TextEditingController secondSource = TextEditingController(text: "");
  TextEditingController firstOrganization = TextEditingController(text: "");
  TextEditingController secondOrganization = TextEditingController(text: "");

  updateBookPage(int value) {
    bookPage = bookPage + value;
    notifyListeners();
  }

  resetBookPage() {
    bookPage = 1;
  }

  resetArticlePage() {
    articlePage = 1;
  }

  updateArticlePage(int value) {
    articlePage = articlePage + value;
    notifyListeners();
  }

  Future<void> getArticles({bool? showLoading}) async {
    if (showLoading ?? false) {
      loadingArticleData = true;
      notifyListeners();
    }
    Map filters = {
      "newsDesk": newsDesk.text,
      "firstSource": firstSource.text,
      "secondSource": secondSource.text,
      "fOrganization": firstOrganization.text,
      "sOrganization": secondOrganization.text,
    };
    dynamic data = await SearchRemoteServices().getArticles(filters,articlePage);
    if (data != null) {
      print(" articles data $data");
      articlesData = data;
      if (articlePage == 1) {
        mdArticle = List.from(articlesData["response"]['docs'])
            .map((e) => Doc.fromJson(e))
            .toList();
      } else {
        mdArticle.addAll(List.from(articlesData["response"]['docs'])
            .map((e) => Doc.fromJson(e))
            .toList());
      }
    }
    loadingArticleData = false;
    notifyListeners();
  }

  Future<void> getBooks({bool? showLoading}) async {
    if (showLoading ?? false) {
      loadingBooksData = true;
      notifyListeners();
    }
    dynamic data = await SearchRemoteServices().getBooks(bookPage);
    if (data != null) {
      print(" books data $data");
      booksData = data;
      if (bookPage == 1) {
        mdBook = List.from(booksData['results']['lists'])
            .map((e) => ListElement.fromJson(e))
            .toList();
      } else {
        mdBook.addAll(List.from(booksData['results']['lists'])
            .map((e) => ListElement.fromJson(e))
            .toList());
      }
    }
    loadingBooksData = false;
    notifyListeners();
  }
}

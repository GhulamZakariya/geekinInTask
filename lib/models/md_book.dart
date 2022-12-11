// To parse this JSON data, do
//
//     final mdBook = mdBookFromJson(jsonString);

import 'dart:convert';

MdBook mdBookFromJson(String str) => MdBook.fromJson(json.decode(str));

class MdBook {
  MdBook({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  String? status;
  String? copyright;
  int? numResults;
  Results? results;

  factory MdBook.fromJson(Map<String, dynamic> json) => MdBook(
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        numResults: json["num_results"] == null ? null : json["num_results"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );
}

class Results {
  Results({
    this.bestsellersDate,
    this.publishedDate,
    this.publishedDateDescription,
    this.previousPublishedDate,
    this.nextPublishedDate,
    this.lists,
  });

  DateTime? bestsellersDate;
  DateTime? publishedDate;
  String? publishedDateDescription;
  DateTime? previousPublishedDate;
  String? nextPublishedDate;
  List<ListElement>? lists;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        bestsellersDate: json["bestsellers_date"] == null
            ? null
            : DateTime.parse(json["bestsellers_date"]),
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        publishedDateDescription: json["published_date_description"] == null
            ? null
            : json["published_date_description"],
        previousPublishedDate: json["previous_published_date"] == null
            ? null
            : DateTime.parse(json["previous_published_date"]),
        nextPublishedDate: json["next_published_date"] == null
            ? null
            : json["next_published_date"],
        lists: json["lists"] == null
            ? null
            : List<ListElement>.from(
                json["lists"].map((x) => ListElement.fromJson(x))),
      );
}

class ListElement {
  ListElement({
    this.listId,
    this.listName,
    this.listNameEncoded,
    this.displayName,
    this.updated,
    this.listImage,
    this.listImageWidth,
    this.listImageHeight,
    this.books,
  });

  int? listId;
  String? listName;
  String? listNameEncoded;
  String? displayName;
  Updated? updated;
  dynamic listImage;
  dynamic listImageWidth;
  dynamic listImageHeight;
  List<Book>? books;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        listId: json["list_id"] == null ? null : json["list_id"],
        listName: json["list_name"] == null ? null : json["list_name"],
        listNameEncoded: json["list_name_encoded"] == null
            ? null
            : json["list_name_encoded"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        updated: json["updated"] == null
            ? null
            : updatedValues.map?[json["updated"]],
        listImage: json["list_image"],
        listImageWidth: json["list_image_width"],
        listImageHeight: json["list_image_height"],
        books: json["books"] == null
            ? null
            : List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );
}

class Book {
  Book({
    this.ageGroup,
    this.amazonProductUrl,
    this.articleChapterLink,
    this.author,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.bookUri,
    this.contributor,
    this.contributorNote,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updatedDate,
    this.weeksOnList,
    this.buyLinks,
  });

  String? ageGroup;
  String? amazonProductUrl;
  String? articleChapterLink;
  String? author;
  String? bookImage;
  int? bookImageWidth;
  int? bookImageHeight;
  String? bookReviewLink;
  String? bookUri;
  String? contributor;
  String? contributorNote;
  DateTime? createdDate;
  String? description;
  String? firstChapterLink;
  String? price;
  String? primaryIsbn10;
  String? primaryIsbn13;
  String? publisher;
  int? rank;
  int? rankLastWeek;
  String? sundayReviewLink;
  String? title;
  DateTime? updatedDate;
  int? weeksOnList;
  List<BuyLink>? buyLinks;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        ageGroup: json["age_group"] == null ? null : json["age_group"],
        amazonProductUrl: json["amazon_product_url"] == null
            ? null
            : json["amazon_product_url"],
        articleChapterLink: json["article_chapter_link"] == null
            ? null
            : json["article_chapter_link"],
        author: json["author"] == null ? null : json["author"],
        bookImage: json["book_image"] == null ? null : json["book_image"],
        bookImageWidth:
            json["book_image_width"] == null ? null : json["book_image_width"],
        bookImageHeight: json["book_image_height"] == null
            ? null
            : json["book_image_height"],
        bookReviewLink:
            json["book_review_link"] == null ? null : json["book_review_link"],
        bookUri: json["book_uri"] == null ? null : json["book_uri"],
        contributor: json["contributor"] == null ? null : json["contributor"],
        contributorNote:
            json["contributor_note"] == null ? null : json["contributor_note"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        description: json["description"] == null ? null : json["description"],
        firstChapterLink: json["first_chapter_link"] == null
            ? null
            : json["first_chapter_link"],
        price: json["price"] == null ? null : json["price"],
        primaryIsbn10:
            json["primary_isbn10"] == null ? null : json["primary_isbn10"],
        primaryIsbn13:
            json["primary_isbn13"] == null ? null : json["primary_isbn13"],
        publisher: json["publisher"] == null ? null : json["publisher"],
        rank: json["rank"] == null ? null : json["rank"],
        rankLastWeek:
            json["rank_last_week"] == null ? null : json["rank_last_week"],
        sundayReviewLink: json["sunday_review_link"] == null
            ? null
            : json["sunday_review_link"],
        title: json["title"] == null ? null : json["title"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
        weeksOnList:
            json["weeks_on_list"] == null ? null : json["weeks_on_list"],
        buyLinks: json["buy_links"] == null
            ? null
            : List<BuyLink>.from(
                json["buy_links"].map((x) => BuyLink.fromJson(x))),
      );
}

class BuyLink {
  BuyLink({
    this.name,
    this.url,
  });

  Name? name;
  String? url;

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: json["name"] == null ? null : nameValues.map?[json["name"]],
        url: json["url"] == null ? null : json["url"],
      );
}

enum Name {
  AMAZON,
  APPLE_BOOKS,
  BARNES_AND_NOBLE,
  BOOKS_A_MILLION,
  BOOKSHOP,
  INDIE_BOUND
}

final nameValues = EnumValues({
  "Amazon": Name.AMAZON,
  "Apple Books": Name.APPLE_BOOKS,
  "Barnes and Noble": Name.BARNES_AND_NOBLE,
  "Bookshop": Name.BOOKSHOP,
  "Books-A-Million": Name.BOOKS_A_MILLION,
  "IndieBound": Name.INDIE_BOUND
});

enum Updated { WEEKLY, MONTHLY }

final updatedValues =
    EnumValues({"MONTHLY": Updated.MONTHLY, "WEEKLY": Updated.WEEKLY});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final mdArticle = mdArticleFromJson(jsonString);

import 'dart:convert';

MdArticle mdArticleFromJson(String str) => MdArticle.fromJson(json.decode(str));

class MdArticle {
  MdArticle({
    this.status,
    this.copyright,
    this.response,
  });

  String? status;
  String? copyright;
  Response? response;

  factory MdArticle.fromJson(Map<String, dynamic> json) => MdArticle(
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  Response({
    this.docs,
    this.meta,
  });

  List<Doc>? docs;
  Meta? meta;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        docs: json["docs"] == null
            ? null
            : List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );
}

class Doc {
  Doc({
    this.docAbstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.source,
    this.multimedia,
    this.headline,
    this.keywords,
    this.pubDate,
    this.documentType,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.byline,
    this.typeOfMaterial,
    this.id,
    this.wordCount,
    this.uri,
    this.printSection,
    this.printPage,
  });

  String? docAbstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  Source? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keyword>? keywords;
  String? pubDate;
  DocumentType? documentType;
  String? newsDesk;
  SectionName? sectionName;
  String? subsectionName;
  Byline? byline;
  TypeOfMaterial? typeOfMaterial;
  String? id;
  int? wordCount;
  String? uri;
  String? printSection;
  String? printPage;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        docAbstract: json["abstract"] == null ? null : json["abstract"],
        webUrl: json["web_url"] == null ? null : json["web_url"],
        snippet: json["snippet"] == null ? null : json["snippet"],
        leadParagraph:
            json["lead_paragraph"] == null ? null : json["lead_paragraph"],
        source:
            json["source"] == null ? null : sourceValues.map?[json["source"]],
        multimedia: json["multimedia"] == null
            ? null
            : List<Multimedia>.from(
                json["multimedia"].map((x) => Multimedia.fromJson(x))),
        headline: json["headline"] == null
            ? null
            : Headline.fromJson(json["headline"]),
        keywords: json["keywords"] == null
            ? null
            : List<Keyword>.from(
                json["keywords"].map((x) => Keyword.fromJson(x))),
        pubDate: json["pub_date"] == null ? null : json["pub_date"],
        documentType: json["document_type"] == null
            ? null
            : documentTypeValues.map?[json["document_type"]],
        newsDesk: json["news_desk"] == null ? null : json["news_desk"],
        sectionName: json["section_name"] == null
            ? null
            : sectionNameValues.map?[json["section_name"]],
        subsectionName:
            json["subsection_name"] == null ? null : json["subsection_name"],
        byline: json["byline"] == null ? null : Byline.fromJson(json["byline"]),
        typeOfMaterial: json["type_of_material"] == null
            ? null
            : typeOfMaterialValues.map?[json["type_of_material"]],
        id: json["_id"] == null ? null : json["_id"],
        wordCount: json["word_count"] == null ? null : json["word_count"],
        uri: json["uri"] == null ? null : json["uri"],
        printSection:
            json["print_section"] == null ? null : json["print_section"],
        printPage: json["print_page"] == null ? null : json["print_page"],
      );
}

class Byline {
  Byline({
    this.original,
    this.person,
    this.organization,
  });

  String? original;
  List<Person>? person;
  dynamic organization;

  factory Byline.fromJson(Map<String, dynamic> json) => Byline(
        original: json["original"] == null ? null : json["original"],
        person: json["person"] == null
            ? null
            : List<Person>.from(json["person"].map((x) => Person.fromJson(x))),
        organization: json["organization"],
      );
}

class Person {
  Person({
    this.firstname,
    this.middlename,
    this.lastname,
    this.qualifier,
    this.title,
    this.role,
    this.organization,
    this.rank,
  });

  String? firstname;
  String? middlename;
  String? lastname;
  dynamic qualifier;
  dynamic title;
  Role? role;
  String? organization;
  int? rank;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstname: json["firstname"] == null ? null : json["firstname"],
        middlename: json["middlename"] == null ? null : json["middlename"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        qualifier: json["qualifier"],
        title: json["title"],
        role: json["role"] == null ? null : roleValues.map?[json["role"]],
        organization:
            json["organization"] == null ? null : json["organization"],
        rank: json["rank"] == null ? null : json["rank"],
      );
}

enum Role { REPORTED }

final roleValues = EnumValues({"reported": Role.REPORTED});

enum DocumentType { ARTICLE, MULTIMEDIA }

final documentTypeValues = EnumValues(
    {"article": DocumentType.ARTICLE, "multimedia": DocumentType.MULTIMEDIA});

class Headline {
  Headline({
    this.main,
    this.kicker,
    this.contentKicker,
    this.printHeadline,
    this.name,
    this.seo,
    this.sub,
  });

  String? main;
  String? kicker;
  dynamic contentKicker;
  String? printHeadline;
  dynamic name;
  dynamic seo;
  dynamic sub;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        main: json["main"] == null ? null : json["main"],
        kicker: json["kicker"] == null ? null : json["kicker"],
        contentKicker: json["content_kicker"],
        printHeadline:
            json["print_headline"] == null ? null : json["print_headline"],
        name: json["name"],
        seo: json["seo"],
        sub: json["sub"],
      );
}

class Keyword {
  Keyword({
    this.name,
    this.value,
    this.rank,
    this.major,
  });

  Name? name;
  String? value;
  int? rank;
  Major? major;

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
        name: json["name"] == null ? null : nameValues.map?[json["name"]],
        value: json["value"] == null ? null : json["value"],
        rank: json["rank"] == null ? null : json["rank"],
        major: json["major"] == null ? null : majorValues.map?[json["major"]],
      );
}

enum Major { N }

final majorValues = EnumValues({"N": Major.N});

enum Name { SUBJECT, PERSONS, ORGANIZATIONS, GLOCATIONS }

final nameValues = EnumValues({
  "glocations": Name.GLOCATIONS,
  "organizations": Name.ORGANIZATIONS,
  "persons": Name.PERSONS,
  "subject": Name.SUBJECT
});

class Multimedia {
  Multimedia({
    this.rank,
    this.subtype,
    this.caption,
    this.credit,
    this.type,
    this.url,
    this.height,
    this.width,
    this.legacy,
    this.subType,
    this.cropName,
  });

  int? rank;
  String? subtype;
  dynamic caption;
  dynamic credit;
  Type? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        rank: json["rank"] == null ? null : json["rank"],
        subtype: json["subtype"] == null ? null : json["subtype"],
        caption: json["caption"],
        credit: json["credit"],
        type: json["type"] == null ? null : typeValues.map?[json["type"]],
        url: json["url"] == null ? null : json["url"],
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        legacy: json["legacy"] == null ? null : Legacy.fromJson(json["legacy"]),
        subType: json["subType"] == null ? null : json["subType"],
        cropName: json["crop_name"] == null ? null : json["crop_name"],
      );
}

class Legacy {
  Legacy({
    this.xlarge,
    this.xlargewidth,
    this.xlargeheight,
    this.thumbnail,
    this.thumbnailwidth,
    this.thumbnailheight,
    this.widewidth,
    this.wideheight,
    this.wide,
  });

  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;
  String? thumbnail;
  int? thumbnailwidth;
  int? thumbnailheight;
  int? widewidth;
  int? wideheight;
  String? wide;

  factory Legacy.fromJson(Map<String, dynamic> json) => Legacy(
        xlarge: json["xlarge"] == null ? null : json["xlarge"],
        xlargewidth: json["xlargewidth"] == null ? null : json["xlargewidth"],
        xlargeheight:
            json["xlargeheight"] == null ? null : json["xlargeheight"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        thumbnailwidth:
            json["thumbnailwidth"] == null ? null : json["thumbnailwidth"],
        thumbnailheight:
            json["thumbnailheight"] == null ? null : json["thumbnailheight"],
        widewidth: json["widewidth"] == null ? null : json["widewidth"],
        wideheight: json["wideheight"] == null ? null : json["wideheight"],
        wide: json["wide"] == null ? null : json["wide"],
      );
}

enum Type { IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE});

enum SectionName { U_S, WORLD }

final sectionNameValues =
    EnumValues({"U.S.": SectionName.U_S, "World": SectionName.WORLD});

enum Source { THE_NEW_YORK_TIMES }

final sourceValues =
    EnumValues({"The New York Times": Source.THE_NEW_YORK_TIMES});

enum TypeOfMaterial { NEWS, INTERACTIVE_FEATURE }

final typeOfMaterialValues = EnumValues({
  "Interactive Feature": TypeOfMaterial.INTERACTIVE_FEATURE,
  "News": TypeOfMaterial.NEWS
});

class Meta {
  Meta({
    this.hits,
    this.offset,
    this.time,
  });

  int? hits;
  int? offset;
  int? time;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        hits: json["hits"] == null ? null : json["hits"],
        offset: json["offset"] == null ? null : json["offset"],
        time: json["time"] == null ? null : json["time"],
      );
}

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

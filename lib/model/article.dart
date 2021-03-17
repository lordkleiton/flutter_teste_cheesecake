import 'package:teste_cheesecake/model/tag.dart';

class Article {
  final String title;
  final String website;
  final String authors;
  final String date;
  final String content;
  final List<Tag> tags;

  // ignore: non_constant_identifier_names
  final String image_url;

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        website = json['website'],
        authors = json['authors'],
        date = json['date'],
        content = json['content'],
        tags = (json['tags'] as List<dynamic>)
            .map((e) => Tag.fromJson(e))
            .toList(),
        image_url = json['image_url'];
}

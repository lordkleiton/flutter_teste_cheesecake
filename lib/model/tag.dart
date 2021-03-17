class Tag {
  final int id;
  final String label;

  Tag.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        label = json['label'];
}

class ArticleModel {
  final String? id;
  final String? image;
  final String? title;
  final String? description;
  final DateTime? date;
  final bool? isBookmark;
  final List<String>? tags;
  final String? tagCategory;

  ArticleModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.date,
    this.isBookmark,
    this.tags,
    this.tagCategory,
  });

  ArticleModel copyWith({
    String? id,
    String? image,
    String? title,
    String? description,
    DateTime? date,
    bool? isBookmark,
    List<String>? tags,
    String? tagCategory,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isBookmark: isBookmark ?? this.isBookmark,
      tags: tags ?? this.tags,
      tagCategory: tagCategory ?? this.tagCategory,
    );
  }

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        image = json['image'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        date = DateTime.parse(json['date'] as String? ?? '03-12-2004'),
        isBookmark = json['isBookmark'] as bool?,
        tags = (json['tags'] as List?)?.map((dynamic e) => e as String).toList(),
        tagCategory = json['tag_category'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'image' : image,
    'title' : title,
    'description' : description,
    'date' : date?.toIso8601String()?? '',
    'isBookmark' : isBookmark,
    'tags' : tags,
    'tag_category' : tagCategory
  };
}
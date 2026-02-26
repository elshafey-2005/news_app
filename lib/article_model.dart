class Article {
  final String title;
  final String? description;
  final String? urlToImage;
  final String? url;

  Article({
    required this.title,
    this.description,
    this.urlToImage,
    this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      url: json['url'] as String?,
    );
  }
}

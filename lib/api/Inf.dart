class Inf {
  String author;
  String title;
  String url;
  String urlToImage;

  Inf({
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory Inf.fromJson(Map item) {
    return Inf(
      author: item['author'] == null ? '' : item['author'],
      title: item['title'] == null ? '' : item['title'],
      url: item['url'] == null ? '' : item['url'],
      urlToImage: item['urlToImage'] == null ? '' : item['urlToImage'],
    );
  }
}

List<Inf> getInf = [];

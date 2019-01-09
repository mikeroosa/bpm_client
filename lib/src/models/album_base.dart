class AlbumBase {
  AlbumBase({
    this.title,
    this.uri,
    this.img,
    this.year,
  });

  final String title;
  final String uri;
  final String img;
  final String year;

  AlbumBase.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        uri = json['uri'],
        img = json['img'],
        year = json['year'];

  @override
  String toString() {
    return 'AlbumBase{title: $title, uri: $uri, img: $img, year: $year}';
  }
}

class ArtistBase {
  ArtistBase({
    this.id,
    this.name,
    this.uri,
    this.img,
  });

  final String id;
  final String name;
  final String uri;
  final String img;

  ArtistBase.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        uri = json['uri'],
        img = json['img'];

  @override
  String toString() {
    return 'ArtistBase{id: $id, name: $name, uri: $uri, img: $img}';
  }
}

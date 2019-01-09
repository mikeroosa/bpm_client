class SongBase {
  SongBase({
    this.id,
    this.title,
    this.uri,
    this.artistId,
    this.name,
  });

  final String id;
  final String title;
  final String uri;
  final String artistId;
  final String name;

  SongBase.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        uri = json['uri'],
        artistId = json['artist_id'],
        name = json['name'];

  @override
  String toString() {
    return 'SongBase{id: $id, title: $title, uri: $uri, artistId: $artistId, name: $name}';
  }
}

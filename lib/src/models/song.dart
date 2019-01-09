import 'package:bpm_client/src/models/song_base.dart';

class Song extends SongBase {
  Song({
    String id,
    String title,
    String uri,
    String artistId,
    String name,
    this.img,
    this.tempo,
    this.key,
  }) : super(id: id, title: title, uri: uri, artistId: artistId, name: name);

  final String img;
  final String tempo;
  final String key;

  Song.fromJson(Map<String, dynamic> json)
      : img = json['img'],
        tempo = json['tempo'],
        key = json['key'],
        super.fromJson(json);

  @override
  String toString() {
    return 'Song{id: $id, title: $title, uri: $uri, artistId: $artistId, name: $name, img: $img, tempo: $tempo, key: $key}';
  }
}

import 'package:bpm_client/src/models/artist_base.dart';

class Artist extends ArtistBase {
  Artist({
    String id,
    String name,
    String uri,
    String img,
    this.from,
    this.bio,
  }) : super(id: id, name: name, uri: uri, img: img);

  final String from;
  final String bio;

  Artist.fromJson(Map<String, dynamic> json)
      : from = json['from'],
        bio = json['bio'],
        super.fromJson(json);

  @override
  String toString() {
    return 'Artist{id: $id, name: $name, uri: $uri, img: $img, from: $from, bio: $bio}';
  }
}

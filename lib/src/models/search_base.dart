import 'package:bpm_client/src/models/album_base.dart';
import 'package:bpm_client/src/models/artist_base.dart';

class SearchBase {
  SearchBase({
    this.songId,
    this.songTitle,
    this.songUri,
    this.tempo,
    this.key,
    this.artist,
    this.album,
  });

  final String songId;
  final String songTitle;
  final String songUri;
  final String tempo;
  final String key;
  final ArtistBase artist;
  final AlbumBase album;

  SearchBase.fromJson(Map<String, dynamic> json)
      : songId = json['song_id'],
        songTitle = json['song_title'],
        songUri = json['song_uri'],
        tempo = json['tempo'],
        key = json['key'],
        artist = ArtistBase.fromJson(json['artist']),
        album = AlbumBase.fromJson(json['album']);

  @override
  String toString() {
    return 'SearchBase{songId: $songId, songTitle: $songTitle, songUri: $songUri, tempo: $tempo, key: $key, artist: $artist, album: $album}';
  }
}

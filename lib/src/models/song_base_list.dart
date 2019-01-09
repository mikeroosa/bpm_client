import 'package:bpm_client/src/models/song_base.dart';

class SongBaseList {
  SongBaseList({
    this.songs,
  });

  final List<SongBase> songs;

  SongBaseList.fromJson(List<dynamic> json)
      : songs = json.map((i) => SongBase.fromJson(i)).toList();
}

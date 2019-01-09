import 'package:bpm_client/src/models/artist_base.dart';

class ArtistBaseList {
  ArtistBaseList({
    this.artists,
  });

  final List<ArtistBase> artists;

  ArtistBaseList.fromJson(List<dynamic> json)
      : artists = json.map((i) => ArtistBase.fromJson(i)).toList();
}

import 'package:bpm_client/bpm_client.dart';

void main() async {
  final client = GetSongBPMClient('YOUR_API_KEY');

  final song = await client.song('o2r0L');
  print(song);

  final artist = await client.artist('nZR');
  print(artist);

  final songResults = await client.songSearch('Master of Puppets');
  songResults.songs.forEach((s) => print(s));

  final artistResults = await client.artistSearch('Metallica');
  artistResults.artists.forEach((a) => print(a));

  final searchResults =
      await client.songAndArtistSearch('Master of Puppets', 'Metallica');
  searchResults.items.forEach((s) => print(s));
}

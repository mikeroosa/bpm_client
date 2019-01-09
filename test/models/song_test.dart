import 'package:bpm_client/bpm_client.dart';
import 'package:test/test.dart';

void main() {
  group('Song Tests', () {
    final data = {
      "id": "o2r0L",
      "title": "Master of Puppets",
      "uri": "https://getsongbpm.com/song/master-of-puppets/o2r0L",
      "artist_id": "nZR",
      "name": "Metallica",
      "img":
          "https://images-na.ssl-images-amazon.com/images/P/B000002H33.01.MZZZZZZZ.jpg",
      "tempo": "220",
      "key": "4"
    };
    final song = Song.fromJson(data);

    test('should return Song when given json', () async {
      expect(song.id, data['id']);
      expect(song.title, data['title']);
      expect(song.uri, data['uri']);
      expect(song.artistId, data['artist_id']);
      expect(song.name, data['name']);
      expect(song.img, data['img']);
      expect(song.tempo, data['tempo']);
      expect(song.key, data['key']);
    });

    test('toString should return a valid representation of the data', () async {
      expect(song.toString(),
          'Song{id: ${song.id}, title: ${song.title}, uri: ${song.uri}, artistId: ${song.artistId}, name: ${song.name}, img: ${song.img}, tempo: ${song.tempo}, key: ${song.key}}');
    });
  });
}

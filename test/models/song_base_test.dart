import 'package:bpm_client/bpm_client.dart';
import 'package:test/test.dart';

void main() {
  group('Song Base Tests', () {
    final data = {
      "id": "o2r0L",
      "title": "Master of Puppets",
      "uri": "https://getsongbpm.com/song/master-of-puppets/o2r0L",
      "artist_id": "nZR",
      "name": "Metallica"
    };
    final songBase = SongBase.fromJson(data);

    test('should return SongBase when given json', () async {
      expect(songBase.id, data['id']);
      expect(songBase.title, data['title']);
      expect(songBase.uri, data['uri']);
      expect(songBase.artistId, data['artist_id']);
      expect(songBase.name, data['name']);
    });

    test('toString should return a valid representation of the data', () async {
      expect(songBase.toString(),
          'SongBase{id: ${songBase.id}, title: ${songBase.title}, uri: ${songBase.uri}, artistId: ${songBase.artistId}, name: ${songBase.name}}');
    });
  });
}

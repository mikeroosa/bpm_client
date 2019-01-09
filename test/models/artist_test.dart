import 'package:bpm_client/bpm_client.dart';
import 'package:test/test.dart';

void main() {
  group('Artist Tests', () {
    final data = {
      "id": "nZR",
      "name": "Metallica",
      "uri": "https://getsongbpm.com/artist/metallica/nZR",
      "img":
          "https://lastfm-img2.akamaized.net/i/u/252aeb30d1e44aaa8eacb2b3c8172716.png",
      "from": "US",
      "bio":
          "Metallica is an American metal band formed in 1981 in Los Angeles, California, United States when drummer Lars Ulrich posted an advertisement in The Recycler. Metallica’s line-up originally consisted of Ulrich, rhythm guitarist and vocalist James Hetfield, and lead guitarist Dave Mustaine. Mustaine was later fired due to problems with alcoholism and drug addiction - he went on to form the band Megadeth. Exodus guitarist Kirk Hammett took his place. ."
    };
    final artist = Artist.fromJson(data);

    test('should return Artist when given json', () async {
      expect(artist.id, data['id']);
      expect(artist.name, data['name']);
      expect(artist.uri, data['uri']);
      expect(artist.img, data['img']);
      expect(artist.from, data['from']);
      expect(artist.bio, data['bio']);
    });

    test('toString should return a valid representation of the data', () async {
      expect(artist.toString(),
          'Artist{id: ${artist.id}, name: ${artist.name}, uri: ${artist.uri}, img: ${artist.img}, from: ${artist.from}, bio: ${artist.bio}}');
    });
  });
}

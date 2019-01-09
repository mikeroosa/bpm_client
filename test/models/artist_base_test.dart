import 'package:bpm_client/bpm_client.dart';
import 'package:test/test.dart';

void main() {
  group('Artist Base Tests', () {
    final data = {
      "id": "nZR",
      "name": "Metallica",
      "uri": "https://getsongbpm.com/artist/metallica/nZR",
      "img":
          "https://lastfm-img2.akamaized.net/i/u/252aeb30d1e44aaa8eacb2b3c8172716.png"
    };
    final artistBase = ArtistBase.fromJson(data);

    test('should return ArtistBase when given json', () async {
      expect(artistBase.id, data['id']);
      expect(artistBase.name, data['name']);
      expect(artistBase.uri, data['uri']);
      expect(artistBase.img, data['img']);
    });

    test('toString should return a valid representation of the data', () async {
      expect(artistBase.toString(),
          'ArtistBase{id: ${artistBase.id}, name: ${artistBase.name}, uri: ${artistBase.uri}, img: ${artistBase.img}}');
    });
  });
}

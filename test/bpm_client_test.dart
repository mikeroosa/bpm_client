import 'package:bpm_client/bpm_client.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'data/artist_data.dart';
import 'data/artist_search_data.dart';
import 'data/both_search_data.dart';
import 'data/song_data.dart';
import 'data/song_search_data.dart';

class MockClient extends Mock implements Client {}

void main() {
  final apiKey = '<API_KEY>';
  group('GetSongBPM API Tests', () {
    group('Song', () {
      test('should return song when given id', () async {
        final httpClient = MockClient();
        final bpmClient = GetSongBPMClient(
          apiKey,
          client: httpClient,
        );

        when(httpClient.get(any))
            .thenAnswer((_) async => Response(songData, 200));

        final song = await bpmClient.song('o2r0L');

        expect(song, TypeMatcher<Song>());
        expect(song.id, 'o2r0L');
        expect(song.title, 'Master of Puppets');
      });
    });

    group('Artist', () {
      test('should return artist when given id', () async {
        final httpClient = MockClient();
        final bpmClient = GetSongBPMClient(
          apiKey,
          client: httpClient,
        );

        when(httpClient.get(any))
            .thenAnswer((_) async => Response(artistData, 200));

        final artist = await bpmClient.artist('nZR');

        expect(artist, TypeMatcher<Artist>());
        expect(artist.id, 'nZR');
        expect(artist.name, 'Metallica');
      });
    });

    group('SongSearch', () {
      test('searching for a song should return results', () async {
        final httpClient = MockClient();
        final bpmClient = GetSongBPMClient(
          apiKey,
          client: httpClient,
        );

        when(httpClient.get(any))
            .thenAnswer((_) async => Response(songSearchData, 200));

        var results = await bpmClient.songSearch('Master of Puppets');
        expect(results, TypeMatcher<SongBaseList>());
        expect(results.songs.length, 3);
      });
    });

    group('ArtistSearch', () {
      test('searching for an artist should return results', () async {
        final httpClient = MockClient();
        final bpmClient = GetSongBPMClient(
          apiKey,
          client: httpClient,
        );

        when(httpClient.get(any))
            .thenAnswer((_) async => Response(artistSearchData, 200));

        var results = await bpmClient.artistSearch('Metal');
        expect(results, TypeMatcher<ArtistBaseList>());
        expect(results.artists.length, 3);
      });
    });

    group('SongAndArtistSearch', () {
      test('searching for both song and artist should return results',
          () async {
        final httpClient = MockClient();
        final bpmClient = GetSongBPMClient(
          apiKey,
          client: httpClient,
        );

        when(httpClient.get(any))
            .thenAnswer((_) async => Response(searchData, 200));

        var results = await bpmClient.songAndArtistSearch(
            'Master of Puppets', 'Metallica');
        expect(results, TypeMatcher<SearchBaseList>());
        expect(results.items.length, 2);
      });
    });
  });
}

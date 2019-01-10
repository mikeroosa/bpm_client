import 'dart:async';
import 'dart:convert';

import 'package:bpm_client/src/models/artist.dart';
import 'package:bpm_client/src/models/artist_base_list.dart';
import 'package:bpm_client/src/models/search_base_list.dart';
import 'package:bpm_client/src/models/song.dart';
import 'package:bpm_client/src/models/song_base_list.dart';
import 'package:http/http.dart';

/// This class is used to interact with the GetSongBPM API.
class GetSongBPMClient {
  static final Uri baseUri = Uri.parse('https://api.getsongbpm.com');

  final String apiKey;
  final Client _client;

  /// Constructor that allows a client to be injected.
  /// If no client is provided, a default one is created.
  GetSongBPMClient(this.apiKey, {Client client}) : _client = client ?? Client();

  /// song will get a song object from the API when the id is provided
  Future<Song> song(String id) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}song/',
      queryParameters: _buildQueryParams(id: id),
    );

    final response = await _client.get('$uri');
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    return Song.fromJson(map['song']);
  }

  /// artist will get an aritst object from the API when the id is provided
  Future<Artist> artist(String id) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}artist/',
      queryParameters: _buildQueryParams(id: id),
    );

    final response = await _client.get('$uri');
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    return Artist.fromJson(map['artist']);
  }

  /// songSearch will search the API for songs matching the provided song name
  Future<SongBaseList> songSearch(String songName) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}search/',
      queryParameters: _buildQueryParams(
        lookupType: 'song',
        songName: songName,
      ),
    );

    final response = await _client.get('$uri');
    final songs = jsonDecode(response.body) as Map<String, dynamic>;
    return SongBaseList.fromJson(songs['search']);
  }

  /// aritstSearch will search the API for artists matching the provided artist name
  Future<ArtistBaseList> artistSearch(String artistName) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}search/',
      queryParameters: _buildQueryParams(
        lookupType: 'artist',
        artistName: artistName,
      ),
    );

    final response = await _client.get('$uri');
    final artists = jsonDecode(response.body) as Map<String, dynamic>;
    return ArtistBaseList.fromJson(artists['search']);
  }

  /// songAndArtistSearch will search the API for items that match both the provided song and artist
  Future<SearchBaseList> songAndArtistSearch(
      String songName, String artistName) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}search/',
      queryParameters: _buildQueryParams(
        lookupType: 'both',
        artistName: artistName,
        songName: songName,
      ),
    );

    var url = uri.toString();
    url = url.replaceAll('%3A', ':');
    url = url.replaceAll('%2520', '%20');

    final response = await _client.get(url);
    final items = jsonDecode(response.body) as Map<String, dynamic>;
    return SearchBaseList.fromJson(items['search']);
  }

  Map<String, String> _buildQueryParams(
      {String id, String lookupType, String songName, String artistName}) {
    final params = <String, String>{};

    params['api_key'] = '$apiKey';
    if (id != null && id.isNotEmpty) {
      params['id'] = '$id';
      return params;
    }

    if (lookupType == null) return params;
    if (lookupType.isEmpty) return params;

    params['type'] = '$lookupType';
    if (lookupType == 'song') params['lookup'] = '${songName.toLowerCase()}';

    if (lookupType == 'artist')
      params['lookup'] = '${artistName.toLowerCase()}';

    if (lookupType == 'both')
      params['lookup'] =
          'song:${songName.toLowerCase()}%20artist:${artistName.toLowerCase()}';

    return params;
  }
}

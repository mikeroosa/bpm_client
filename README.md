# bpm_client

A library that makes it easy to interact with the GetSongBPM API to get beats per minute for many songs.

This is built using the Dart Programming Language with its only dependency being the http package. This means it should work in any Dart code from Flutter to Web to Server.

## Usage

Make sure to go to the [GetSongBPM Website][getsongbpm] and register for an API key. This is required for accessing the API.

```dart
import 'package:bpm_client/bpm_client.dart';

final client = GetSongBPMClient('YOUR_API_KEY');

final song = await client.song('o2r0L');
print(song);

final artist = await client.artist('nZR');
print(artist);

final songResults = await client.songSearch('Master of Puppets');
songResults.songs.forEach((s) => print(s));

final artistResults = await client.artistSearch('Metallica');
artistResults.artists.forEach((a) => print(a));

final searchResults = await client.songAndArtistSearch('Master of Puppets', 'Metallica');
searchResults.items.forEach((s) => print(s));
```

## Testing

Testing is limited at this time and the http client is mocked so you don't actually hit the API. Tests need to be expanded.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[getsongbpm]: https://getsongbpm.com
[tracker]: http://github.com/ThirdBaseMedia/bpm_client/issues/new

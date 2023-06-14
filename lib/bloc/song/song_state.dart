part of 'song_bloc.dart';

abstract class SongState extends Equatable {
  const SongState();
}

// SongInitial is the state that will be emitted when the app is started.
class SongInitial extends SongState {
  @override
  List<Object> get props => [];
}

// SongLoadingState is the state that will be emitted when the songs are being loaded.
class SongLoadingState extends SongState {
  @override
  List<Object?> get props => [];
}
// SongLoadedState is the state that will be emitted when the songs are loaded successfully.
class SongLoadedState extends SongState {
  // songs is the list of songs that will be passed to the UI
  final List<Song> songs;
  const SongLoadedState({required this.songs,});

  @override
  List<Object?> get props => [songs];
}


// SongLoadingFailure is the state that will be emitted when the songs are not loaded successfully.
class SongLoadingFailure extends SongState {
  @override
  List<Object?> get props => [];
}

// SingleSongLoadedState is the state that will be emitted when a single song is loaded successfully.
class SingleSongLoadedState extends SongState {
  final Song song;
  SingleSongLoadedState({
    required this.song,
  });
  @override
  List<Object?> get props => [song];
}

// SongLyricsLoadedState is the state that will be emitted when the lyrics of a song is loaded successfully.
class SongLyricsLoadedState extends SongState {
  final Lyrics lyric;
  const SongLyricsLoadedState({
    required this.lyric,
  });
  @override
  List<Object?> get props => [lyric];
}
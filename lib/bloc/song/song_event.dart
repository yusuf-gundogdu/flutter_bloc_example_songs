part of 'song_bloc.dart';

abstract class SongEvent extends Equatable {
  const SongEvent();
}


class GetSongs extends SongEvent {

  @override
  List<Object?> get props => [];
}


class GetLyrics extends SongEvent {
  final Lyrics lyric;
  final int id;
  GetLyrics({required this.lyric, required this.id});
  @override
  List<Object?> get props => [lyric];
}

class GetSong extends SongEvent {
  final Song song;
  final int id;
  GetSong({required this.song, required this.id});
  @override
  List<Object?> get props => [song];
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Repository/song_repository.dart';
import '../../model/lyrics_model.dart';
import '../../model/song_model.dart';

part 'song_event.dart';

part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(SongInitial()) {
    on<SongEvent>((event, emit) {
      // TODO: implement event handler
    });
    // GetSongs event handler maps to _getSongs method
    on<GetSongs>(_getSongs);
    on<GetSong>(_getSong);
    on<GetLyrics>(_getLyrics);
  }

  final SongRepository _repository = SongRepository();

  Future<void> _getSongs(GetSongs event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    List<Song> songs = [];
    // Load songs from the repository
    songs = await _repository.loadSongs();
    if (songs != []) {
      emit(SongLoadingFailure());
    } else {
      // Emit the SongLoadedState with the songs
      emit(SongLoadedState(songs: songs));
    }
  }

  Future<void> _getSong(GetSong event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    Song? song;
    song = await _repository.getSong(event.id);
    if (song == null) {
      emit(SongLoadingFailure());
    } else {
      emit(SingleSongLoadedState(song: song));
    }
  }

  Future<void> _getLyrics(GetLyrics event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    Lyrics? lyric;
    lyric = await _repository.getLyrics(event.id);
    if (lyric == null) {
      emit(SongLoadingFailure());
    } else {
      emit(SongLyricsLoadedState(lyric: lyric));
    }
  }
}

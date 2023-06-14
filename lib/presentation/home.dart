import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/song/song_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState) return Center(child: CircularProgressIndicator());
          if (state is SongLoadingFailure) return Center(child: Text("Something Went Wrong"));
          if (state is SongLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  TextButton(
                      onPressed: () {
                        context.read<SongBloc>().add(GetSongs());
                        print("Load");
                        print(state.songs.length);
                      },
                      child: Text("Load")),
                  SizedBox(height: 100),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.songs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        style: ListTileStyle.drawer,
                        isThreeLine: false,
                        title: Text(state.songs[index].songName),
                        subtitle: Text("From ${state.songs[index].albumName}"),
                        trailing: Text("By ${state.songs[index].artistName}"),
                        onTap: () {},
                      );
                    },
                    //zoom linkini atsana
                  ),
                ],
              ),
            );
          } else
            return Column();
          //  return ErrorPage(errorMessage: "Something Went Wrong");
        },
      ),
    );
  }
}

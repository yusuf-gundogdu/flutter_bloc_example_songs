import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/home.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/song/song_bloc.dart';

void main() {
  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => SongBloc()..add(GetSongs())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: BlocBuilder<SongBloc, SongState>(
          builder: (context, state) {
            if (state is SongLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SongLoadedState) {
              return ListView.builder(
                itemCount: state.songs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    style: ListTileStyle.drawer,
                    isThreeLine: false,
                    title: Text(state.songs[index].songName),
                    subtitle: Text("From ${state.songs[index].albumName}"),
                    trailing: Text("By ${state.songs[index].artistName}"),
                    leading: Image.asset("assets/images/music.png"),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: ((context) =>
                      //         SongDetails(id: state.songs[index].songId)),
                      //   ),
                      // );
                    },
                  );
                },
              );
            } else
              return Column();
          },
        ),
      ),
    );
  }
}

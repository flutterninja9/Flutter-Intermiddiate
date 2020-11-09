import 'package:basic_bloc_practice/bloc/bloc/loader_bloc.dart';
import 'package:basic_bloc_practice/presentation/widgets/imageLoaded.dart';
import 'package:basic_bloc_practice/presentation/widgets/image_loading.dart';
import 'package:basic_bloc_practice/presentation/widgets/initial_state.dart';
import 'package:basic_bloc_practice/presentation/widgets/loading_Failed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoaderBloc bloc = BlocProvider.of<LoaderBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Loader"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoaderBloc, LoaderState>(
              builder: (context, state) {
                if (state is LoaderInitial) {
                  return Container(height: 100, child: InitialState());
                } else if (state is LoadingImage) {
                  return Container(height: 50, child: ImageLoadingInd());
                } else if (state is LoadingFailed) {
                  return ImageLoadingFailed();
                } else {
                  return LoadedImage();
                }
              },
            ),
            BlocBuilder<LoaderBloc, LoaderState>(
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.only(top: 50),
                  child: RaisedButton(
                    onPressed: () {
                      bloc.add(LoadImage());
                    },
                    child: Text("LOAD",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

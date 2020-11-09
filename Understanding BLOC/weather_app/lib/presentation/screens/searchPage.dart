import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/bloc/bloc/weatherbloc_bloc.dart';
import 'package:weather_app/presentation/screens/showWeather.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherblocBloc>(context);

    return Scaffold(body: BlocBuilder<WeatherblocBloc, WeatherblocState>(
      builder: (context, state) {
        if (state is WeatherblocInitial) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Weather App",
                      style: GoogleFonts.poppins(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 4,
                      child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_My3Zxm.json'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(top: 25),
                      child: TextFormField(
                        controller: searchText,
                        decoration: InputDecoration(
                            hintText: "Enter city name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            hintStyle: GoogleFonts.poppins(),
                            prefixIcon: Icon(Icons.search)),
                        onFieldSubmitted: (city) {
                          weatherBloc.add(FetchWeather(city: searchText.text));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is WeatherLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return ShowWeatherScreen(
              city: searchText.text, weather: state.weatherScreenData);
        } else {
          return Center(
            child: Text(
              "Some Error Occured!",
              style: GoogleFonts.inter(color: Colors.red, fontSize: 25),
            ),
          );
        }
      },
    ));
  }
}

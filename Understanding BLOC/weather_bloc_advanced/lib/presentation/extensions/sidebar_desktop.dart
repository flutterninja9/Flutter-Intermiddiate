import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:weather_bloc_advanced/blocs/bloc/weather_bloc.dart';
import 'package:weather_bloc_advanced/helpers/constants.dart';

class SidebarDesktop extends StatefulWidget {
  @override
  _SidebarDesktopState createState() => _SidebarDesktopState();
}

class _SidebarDesktopState extends State<SidebarDesktop> {
  String selected = "dashboard";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);
    DateTime CURRtIME = DateTime.now();
    return Container(
      height: Get.height,
      width: 230,
      color: primaryColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Image.asset('assets/sun.png'),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("WEATHERBLOG",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Positioned(
            top: 90,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 300,
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "dashboard";
                      });
                    },
                    child: sideBarOption(
                        icon: Icon(
                          LineAwesomeIcons.dashcube,
                          color: Colors.white,
                        ),
                        title: 'Dashboard',
                        selected: selected,
                        option: 'dashboard'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "statistics";
                      });
                    },
                    child: sideBarOption(
                        icon: Icon(
                          Ionicons.bar_chart_outline,
                          color: Colors.white,
                        ),
                        title: 'Statistics',
                        selected: selected,
                        option: 'statistics'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "map";
                      });
                    },
                    child: sideBarOption(
                        icon: Icon(
                          LineAwesomeIcons.map_marked,
                          color: Colors.white,
                        ),
                        title: 'Map',
                        selected: selected,
                        option: 'map'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "calender";
                      });
                    },
                    child: sideBarOption(
                        icon: Icon(
                          LineAwesomeIcons.calendar,
                          color: Colors.white,
                        ),
                        title: 'Calender',
                        selected: selected,
                        option: 'calender'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = "settings";
                      });
                    },
                    child: sideBarOption(
                        icon: Icon(
                          Ionicons.settings_sharp,
                          color: Colors.white,
                        ),
                        title: 'Settings',
                        selected: selected,
                        option: 'settings'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 390,
            child: SizedBox(
              width: 230,
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return GestureDetector(
                      onTap: () {
                        bloc.add(SearchWeather(city: 'London'));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 300,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Center(
                          child: Icon(
                            Ionicons.refresh,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (state is LoadingWeather) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 300,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (state is WeatherLoaded) {
                    return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 300,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Image.network(state.weather
                                                  .current.condition.icon),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Today",
                                                    style: GoogleFonts.poppins(
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    CURRtIME.hour.toString() +
                                                        ":" +
                                                        CURRtIME.minute
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    dayName[CURRtIME.weekday] +
                                                        ", " +
                                                        CURRtIME.day
                                                            .toString() +
                                                        " " +
                                                        monthName[
                                                            CURRtIME.month],
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.grey[600],
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        ));
                  } else if (state is LoadingFailed) {
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 300,
                      width: 230,
                      color: Colors.white,
                      child: Center(
                          child: Text("Loading Failed",
                              style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600))),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget sideBarOption({icon, title, selected, option}) {
  return Container(
    width: 230,
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: getTextColor(selected: selected, option: option),
          child: getGradient(selected: selected, option: option),
          height: 50,
          width: 230,
        ),
      ],
    ),
  );
}

getTextColor({selected, option}) {
  if (selected == option) {
    return Colors.white.withOpacity(0.0);
  } else {
    return Colors.transparent;
  }
}

getGradient({selected, option}) {
  if (selected == option) {
    return Container(
      height: 50,
      width: 230,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 4,
            color: Colors.white,
          ),
        ],
      ),
    );
  } else {
    Container(
      height: 50,
      width: 230,
      color: Colors.transparent,
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override 
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget currentWeatherIcon(int code) {
    switch(code) {
      case >= 200 && < 300 :
      return Image.asset(
        'assets/thunderstorm.png'
      );
      case >= 300 && < 400 :
        return Image.asset(
        'assets/rainy.png'
      );
      case >= 500 && < 600 :
        return Image.asset(
        'assets/heavy_rain.png'
      );
      case >= 600 && < 700 :
        return Image.asset(
        'assets/snow.png'
      );
      case >= 700 && < 800 :
        return Image.asset(
        'assets/heavy_snow.png'
      );
      case == 800 :
        return Image.asset(
        'assets/sunny.png'
      );
      default:
        return Image.asset(
          'assets/partially_sunny.png'
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0.8 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [ 
              // Align( 
              //   alignment: AlignmentDirectional(0.4, 0.6),
              //   child: Container( 
              //     height: 300,
              //     width: 300,
              //     decoration: BoxDecoration( 
              //       shape: BoxShape.circle,
              //       color: Colors.yellowAccent
              //     ),
              //   ),
              // ),
              // Align( 
              //   alignment: AlignmentDirectional(-0.4, 0.6),
              //   child: Container( 
              //     height: 300,
              //     width: 300,
              //     decoration: BoxDecoration( 
              //       shape: BoxShape.circle,
              //       color: Colors.yellowAccent
              //     ),
              //   ),
              // ),
              Align(
                alignment: AlignmentDirectional(0, -1.8),
                child: Container( 
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration( 
                    shape: BoxShape.rectangle,
                    color: Colors.cyan.shade500
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent)
                )
              ),
              BlocBuilder<WeatherBloc, WeatherState> (
                builder: (context, state) {
                  if(state is WeatherSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                          'Weather app for Olly Olly',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '🚩 ${state.weather.areaName} - ${state.weather.country}',
                            style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                          Text(
                            'lat:${state.weather.latitude}° - long:${state.weather.longitude}°',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                              fontSize: 10
                            ),
                          ),
                        const SizedBox(height: 8),
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 150,
                            child: currentWeatherIcon(state.weather.weatherConditionCode!),
                          ),
                        ),
                         Center(
                          child: Text(
                            '${state.weather.temperature?.celsius?.round()}º C',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                         Center(
                          child: Text(
                            state.weather.weatherMain!,
                            style:  TextStyle(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                         Center(
                          child: Text(
                            DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
                            // 'Friday 16 - 09:41am',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w300
                            )
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row( 
                          mainAxisAlignment:  MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/sunrise.png',
                                scale: 10,
                                ),
                                const SizedBox(width: 5),
                                 Column( 
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle( 
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12
                                      )
                                    ),
                                    // const SizedBox(height: 2),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunrise!),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/wind.png',
                                scale: 10,
                                ),
                                const SizedBox(width: 5),
                                 Column( 
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Wind Speed',
                                      style: TextStyle( 
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12
                                      )
                                    ),
                                    // const SizedBox(height: 2),
                                    Text(
                                      '${state.weather.windSpeed}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                            children: [
                              Image.asset(
                                'assets/night.png',
                              scale: 10,
                              ),
                              const SizedBox(width: 5),
                               Column( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunset',
                                    style: TextStyle( 
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12
                                    )
                                  ),
                                  // const SizedBox(height: 2),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunset!),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                    )
                                  )
                                ],
                              )
                            ],
                            ),
                          ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Divider(
                              color: Colors.white12,
                            )
                          ),
                          Row( 
                          mainAxisAlignment:  MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/maxTemperature.png',
                                scale: 10,
                                ),
                                const SizedBox(width: 5),
                                 Column( 
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Max. Temp',
                                      style: TextStyle( 
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12
                                      )
                                    ),
                                    // const SizedBox(height: 2),
                                    Text(
                                      '${state.weather.tempMax?.celsius?.round()}º C',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/temperatureFeelsLike.png',
                                scale: 10,
                                ),
                                const SizedBox(width: 5),
                                 Column( 
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp (feels like)',
                                      style: TextStyle( 
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12
                                      )
                                    ),
                                    // const SizedBox(height: 2),
                                    Text(
                                      '${state.weather.tempFeelsLike?.celsius?.round()}º C',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                            children: [
                              Image.asset(
                                'assets/minTemperature.png',
                              scale: 10,
                              ),
                              const SizedBox(width: 5),
                               Column( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Min. Temp',
                                    style: TextStyle( 
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12
                                    )
                                  ),
                                  // const SizedBox(height: 2),
                                  Text(
                                    '${state.weather.tempMin?.celsius?.round()}º C',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                    )
                                  )
                                ],
                              )
                            ],
                            ),
                          ],
                          ),
                        ],
                      )
                    );
                  } else {
                    return Container();
                  }
              }
              ) 
            ],
          ),
          ),
        ),
      );
  }
}
  



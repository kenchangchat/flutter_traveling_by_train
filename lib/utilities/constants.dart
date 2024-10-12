// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

const COLOR_THEME = Color(0xFF3F69EF);
const COLOR_THEME_DARK = Color(0xFF2F55D0);
const COLOR_THEME_BRIGHT = Color(0xFF6A8AEE);
const COLOR_THEME_SOFT = Color(0xFFF1F2F6);
const COLOR_THEME_MAIN = Color(0xFFFFFFFF);
const COLOR_THEME_MAIN_DARK = Color(0xFF000000);
const COLOR_THEME_BLAKGROUND = Color(0xFFF5F5F5);
const COLOR_THEME_SHADOW = Color(0xFFAAAAAA);
const COLOR_THEME_SHADOW_LIGHT = Color(0xFFDDDDDD);
const COLOR_THEME_LIGHT = Color(0xFFFFFFFF);
const COLOR_THEME_INTENSIVE = Color(0xFFFFFFFF);
const COLOR_THEME_ACCENTUATED = Color(0xFFFFFFFF);
const COLOR_THEME_OPPOSITE = Color(0xFFfea448);
const COLOR_THEME_OPPOSITE_LIGHT = Color(0xFFffd279);
const COLOR_THEME_HOVER = Color(0xFF0081C9);
const COLOR_THEME_HOVER_LIGHT = Color(0xFF5BC0F8);
const COLOR_THEME_GRAY = Color(0xFFC3C8D3);
const COLOR_THEME_TRANS_GRAY = Color(0x56C3C8D3);

Container BLACKGROUND_COLOR = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [COLOR_THEME_LIGHT, COLOR_THEME_LIGHT, COLOR_THEME_LIGHT],
      stops: [0, 0.5, 0.9],
    ),
  ),
);

String DATE_TIME_WEB_FORMAT = 'dd/MM/yyyy HH:mm:ss';
String DATE_WEB_FORMAT = 'dd/MM/yyyy';
String DATE_DB_FORMAT = 'yyyy-MM-dd';
String TIME_FORMAT = 'HH:mm';

String myNameApp = 'Traveling by train';

double LOCATION_LAT = 13.72917;
double LOCATION_LNG = 100.52389;
const MAP_LAYER = [
  {
    "title": "Google Terrain",
    "layer": "https://mt1.google.com/vt/lyrs=p&x={x}&y={y}&z={z}"
  },
  {
    "title": "Google Hybrid",
    "layer": "https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}"
  },
];

// local
String PROTOCAL = "http";
String IP_ADDRESS_URL = '192.168.1.125';
String IP_ADDRESS_URL_API = '192.168.1.125:3002';

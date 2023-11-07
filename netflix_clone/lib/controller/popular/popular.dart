import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/popular/popular.dart';
String getUrl =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=599db4cbf9ae4345b53ed08d01450277#';

Future<List<Popular>> getAllPopular() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = PopularList.fromJson(_bodyAsJson['results']);
  print(_data.popularList[0].overview);
  return _data.popularList;
}
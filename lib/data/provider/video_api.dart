
import 'dart:convert';

import 'package:http/http.dart' as http;

class VideoAPI{

  String apiEndPoint = 'https://test-ximit.mahfil.net/api/trending-video/1?page=1';

  Future<Object> getVideoRaw() async{
    final response = await http.get(Uri.parse(apiEndPoint));

    return jsonDecode(response.body);
  }

}
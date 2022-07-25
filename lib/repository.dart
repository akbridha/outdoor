import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:outdoor/rentactivity.dart';

class repository {
  final _baseUrl = 'https://rentalzeus.000webhostapp.com';

  Future ambilListBarang() async {
    try {
      final respon = await http.get(Uri.parse(_baseUrl + '/getAllStuff.php'));

      if (respon.statusCode == 200) {
        print(respon.body);
        Iterable iter = jsonDecode(respon.body);
        List<Barang> blog = iter.map((e) => Barang.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String no_cust, String nama_barang, String kuantitas) async {
    try {
      final respon = await http.post(Uri.parse(_baseUrl + '/createRequest.php'),
          body: {
            'no_cust': no_cust,
            'nama_barang': nama_barang,
            'kuantitas': kuantitas
          });

      if (respon.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<Album> fetchAlbum() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Album.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

//   Future<http.Response> createAlbum(String title) {
//   return http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );
// }
}

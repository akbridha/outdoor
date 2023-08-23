import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:outdoor/approve.dart';
import 'package:outdoor/rentactivity.dart';

class repository {
  String? tempp;
  // final _baseUrl = 'https://rentalzeus.000webhostapp.com';
  final _baseUrl = 'https://tes-mobile.landa.id/api';

  Future ambilListBarang() async {
    try {
      // final respon = await http.get(Uri.parse(_baseUrl + '/getAllStuff.php'));
      final respon =
          await http.get(Uri.parse('https://tes-mobile.landa.id/api/menus'));

      if (respon.statusCode == 200) {
        // final Map<String, dynamic> jsonData = jsonDecode(respon.body);
        // final responseData = ResponseData.fromJson(jsonData);
        // final List<Barang> barangList = responseData.datas;

        final Map<String, dynamic> jsonData = jsonDecode(respon.body);
        final List<dynamic> dataJsonList = jsonData['datas'];
        print(dataJsonList);
        // final List<Barang> barangList =
        Iterable iter = dataJsonList;
        List<Barang> barangList = iter.map((e) => Barang.fromJson(e)).toList();
        //     dataJsonList.map((data) => Barang.fromJson(data)).toList();

        return barangList;

        // print(respon.body.toString());
        //   List<Barang> blog = iter.map((e) => Barang.fromJson(e)).toList();
        //   return blog;

// Parse JSON
        // Map<String, dynamic> jsonData = jsonDecode(respon.body);
        // Iterable iter = jsonDecode(respon.body);
        // List<Barang> blog = iter.map((e) => Barang.fromJson(e)).toList();
        // return blog;

// Mengambil nilai 'datas' dan mengonversinya menjadi list
        // List<dynamic> dataList = jsonData['datas'];

// Sekarang Anda memiliki list yang berisi data JSON tanpa status code
        // print(dataList);
        // return dataList;
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

  Future postApprovalData(String nama_barang, String kuantitas) async {
    try {
      final respon = await http.post(Uri.parse(_baseUrl + '/updateStok.php'),
          body: {'nama_barang': nama_barang, 'kuantitas': kuantitas});

      if (respon.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future ambilListReques() async {
  //   try {
  //     final respon = await http.get(Uri.parse(_baseUrl + '/getAllReques.php'));

  //     if (respon.statusCode == 200) {
  //       print("ini respon body " + respon.body.toString() + " ini buntut");
  //       Iterable iter = jsonDecode(respon.body);
  //       List<Reques> requesList = iter.map((e) => Reques.fromJson(e)).toList();
  //       return requesList;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future ambilRequesByName(String no_cust) async {
  //   try {
  //     final respon = await http.post(
  //         Uri.parse(_baseUrl + '/getRequesByName.php'),
  //         body: {'no_cust': no_cust});
  //     print(await respon.body.toString());
  //     Iterable iter = jsonDecode(respon.body);
  //     List<RequesByName> requesListByName =
  //         iter.map((e) => RequesByName.fromJson(e)).toList();
  //     return requesListByName;

  //     // tempp = respon.body.toString();
  //     // approve.key = respon.body();

  //     // if (respon.statusCode == 200) {

  //     // } else {
  //     //   return "fail";
  //     // }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
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

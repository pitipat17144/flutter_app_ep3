import 'dart:convert';

import 'package:flutter_app_ep3/models/myaccount.dart';
import 'package:http/http.dart' as http;

String urlService = "http://10.1.2.47";

Future<List<Myaccount>> serviceGetAllMyAccount() async {

  final response = await http.get(
    Uri.encodeFull('${urlService}/accountdialy/serviceGetAllMyAccount.php'),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);

    final myaccountData = await responseData.map<Myaccount>((json){
      return Myaccount.fromJson(json);
    }).toList();

    return myaccountData;

  } else {
    return null;
  }
}


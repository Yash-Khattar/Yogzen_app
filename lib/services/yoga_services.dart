import 'package:flutter/material.dart';
import 'package:yogzen/components/snackbar.dart';
import 'package:yogzen/global/baseurl.dart';
import 'package:yogzen/global/error_handling.dart';
import 'package:http/http.dart' as http;

class YogaServices {
  Future<void> getYogaData(BuildContext context) async {
    var url = Uri.parse("$baseUrl/api/getAllYoga");
    try {
      var response = await http.get(url);
      print(response.body);
      if (context.mounted) {
        httpErrorHandling(
            context: context,
            response: response,
            onSuccess: () {
              print(response.body);
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/components/snackbar.dart';
import 'package:yogzen/global/baseurl.dart';
import 'package:yogzen/global/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:yogzen/models/yoga.dart';
import 'package:yogzen/providers/yoga_provider.dart';

class YogaServices {
  Future<void> getYogaData(BuildContext context) async {
    var url = Uri.parse("$baseUrl/api/getAllYoga");
    try {
      var response = await http.get(url);

      if (context.mounted) {
        httpErrorHandling(
            context: context,
            response: response,
            onSuccess: () {
              final List yogaListJson = json.decode(response.body);

              List<Yoga> yogaData = [];

              for (Map<String, dynamic> yoga in yogaListJson) {
                yogaData.add(Yoga.fromMap(yoga));
              }

              Provider.of<YogaProvider>(context, listen: false)
                  .setYogaData(yogaData);
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }
}

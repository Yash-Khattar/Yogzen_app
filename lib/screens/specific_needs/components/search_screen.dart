import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/components/yoga_card.dart';
import 'package:yogzen/screens/specific_needs/components/yoga_card_sn.dart';

import '../../../global/color.dart';
import '../../../models/yoga.dart';
import '../../../providers/yoga_provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Yoga> filteredYogas = [];
  @override
  Widget build(BuildContext context) {
    final yogaData = Provider.of<YogaProvider>(context, listen: false).yogaData;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _searchFocus = FocusNode();
    final _searchText = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBlue,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find your Yoga',
                  style: TextStyle(
                    color: kdarkBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextField(
                    controller: _searchText,
                    onSubmitted: (value) {
                      setState(() {
                        filteredYogas = yogaData
                            .where((yoga) => yoga.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                      _searchFocus.unfocus();
                    },
                    focusNode: _searchFocus,
                    autofocus: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                        // label: Text("Search"),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: kdarkBlueMuted,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: kdarkBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fillColor: Colors.white,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: kdarkBlueMuted, fontWeight: FontWeight.w500),
                        prefixIcon: Icon(Icons.search, color: kdarkBlueMuted),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     strokeAlign: BorderSide.strokeAlignOutside,
                        //     color: Colors.black12,
                        //     width: 1,
                        //   ),
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4)),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                filteredYogas.isEmpty
                    ? Center(child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text("Search for Yoga Aasanas!", style: TextStyle(color: Colors.black45),),
                    ))
                    : SizedBox(
                        height: height * 0.7,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          itemCount: filteredYogas.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: height * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: YogaCardSN(yoga: yogaData[index]),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

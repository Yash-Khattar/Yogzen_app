import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/screens/specific_needs/yoga_card_sn.dart';

import '../../global/color.dart';
import '../../providers/user_provider.dart';

class SpecificNeedsScreen extends StatefulWidget {
  const SpecificNeedsScreen({super.key});

  @override
  State<SpecificNeedsScreen> createState() => _SpecificNeedsScreenState();
}

class _SpecificNeedsScreenState extends State<SpecificNeedsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
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
                TextField(
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
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: kdarkBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: TextStyle(color: kdarkBlueMuted, fontWeight: FontWeight.w500),
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
                SizedBox(
                  height: 48,
                ),
                Text("Recommended for You",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 160,
                  child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.320,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return YogaCardSN();
                    },
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Text("Yoga Routines by Experts",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: YogaCardSNBig(),
                      );
                    },
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Text("For Back Pain",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 160,
                  child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.320,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return YogaCardSN();
                    },
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
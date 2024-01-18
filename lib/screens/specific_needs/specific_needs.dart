import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yogzen/components/chat_button.dart';
import 'package:yogzen/components/yoga_card.dart';
import 'package:yogzen/screens/specific_needs/components/search_screen.dart';
import 'package:yogzen/screens/specific_needs/components/yoga_card_sn.dart';

import '../../global/color.dart';
import '../../providers/yoga_provider.dart';

class SpecificNeedsScreen extends StatefulWidget {
  const SpecificNeedsScreen({super.key});

  @override
  State<SpecificNeedsScreen> createState() => _SpecificNeedsScreenState();
}

class _SpecificNeedsScreenState extends State<SpecificNeedsScreen> {
  @override
  Widget build(BuildContext context) {
    final yogaData = Provider.of<YogaProvider>(context, listen: false).yogaData;
    final height = MediaQuery.of(context).size.height;
    final _searchFocus = FocusNode();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const ChatButton(),
        backgroundColor: klightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Find your Yoga',
                  style: TextStyle(
                    color: kdarkBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextField(
                    focusNode: _searchFocus,
                    onTap: () {
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                      _searchFocus.unfocus();
                    },
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
                          borderSide: const BorderSide(
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
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 4, horizontal: 4)),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text("Recommended for You",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.320,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return YogaCardSN(yoga: yogaData[index]);
                    },
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text("Yoga Routines by Experts",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: height * 0.26,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: YogaCard(yoga: yogaData[index]),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text("For Back Pain",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.320,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return YogaCardSN(
                        yoga: yogaData[index],
                      );
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

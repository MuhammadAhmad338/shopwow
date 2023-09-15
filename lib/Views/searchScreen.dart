// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Services/apiServices.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final WidthHeight _widthHeight = WidthHeight();

  @override
  void dispose() {
    super.dispose();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<ApiServices>(context, listen: false);
    return Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          SizedBox(
            height: _widthHeight.screenHeight(context, 0.048),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: _widthHeight.screenHeight(context, 0.045),
                width: _widthHeight.screenWidth(context, 0.65),
                padding:
                    EdgeInsets.all(_widthHeight.screenWidth(context, 0.01)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          _widthHeight.screenWidth(context, 0.016)),
                      child: Image.asset("assets/images/search.png",
                          color: Colors.black,
                          height: _widthHeight.screenHeight(context, 0.08),
                          width: _widthHeight.screenWidth(context, 0.05)),
                    ),
                    SizedBox(
                      width: _widthHeight.screenWidth(context, 0.001),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: _widthHeight.screenHeight(context, 0.015)),
                        child: TextField(
                          controller: controller,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              searchProvider.searchTheProducts(value);
                            } else {
                              searchProvider.clearSearchResults();
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: _widthHeight.screenWidth(context, 0.05),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: _widthHeight.screenWidth(context, 0.042)),
                ),
              )
            ],
          ),
          SizedBox(height: _widthHeight.screenHeight(context, 0.001)),
          Expanded(
            child: Consumer<ApiServices>(builder: (context, provider, child) {
              final searchResults = provider.searchProducts;
              if (searchResults.isEmpty) {
                return Center(
                  child: Text('No results found!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _widthHeight.screenHeight(context, 0.020))),
                );
              }
              return Padding(
                padding:
                    EdgeInsets.all(_widthHeight.screenHeight(context, 0.015)),
                child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      var product = searchResults[index];
                      return Card(
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        borderOnForeground: true,
                        elevation: 1,
                        margin: EdgeInsets.only(
                            bottom: _widthHeight.screenHeight(context, 0.015)),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: _widthHeight.screenHeight(context, 0.035),
                            backgroundImage:
                                NetworkImage(product.image!.toString()),
                          ),
                          title: Text(
                            "${product.title} :: ${product.price}",
                            maxLines: 2,
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: const Text("HelloAhmad!"),
                        ),
                      );
                    }),
              );
            }),
          )
        ]));
  }
}

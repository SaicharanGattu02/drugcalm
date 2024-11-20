import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugcalm/Screens/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CategoriesProvider.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/CustomSnackBar.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final spinkits = Spinkits1();

  @override
  Widget build(BuildContext context) {
    // Define screen size
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'CATEGORIES',
        actions: [Container()],
      ),
      body: Consumer<CategoriesProvider>(
          builder: (context, categoriesProvider, child) {
        final categories_list = categoriesProvider.categoriesList;
        if (categoriesProvider.isLoading) {
          return Center(
              child: CircularProgressIndicator(
                color: Color(0xffE7C6A0),
              ));
        }else{
          return
            Container(
              width: w,
              height: h,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Drug Clam Background.png'),
                      fit: BoxFit.cover,
                  )),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 categories per row
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.66, // Aspect ratio for the items
                ),
                itemCount: categories_list.length, // Number of categories in the grid
                itemBuilder: (context, index) {
                  var data= categories_list[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      InkResponse(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductList()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width:120,
                                    height:100,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0), // Adjust the padding as needed
                                        child:CachedNetworkImage(
                                          imageUrl: data.image ?? "",
                                          fit: BoxFit.cover,
                                          placeholder:
                                              (BuildContext context,
                                              String url) {
                                            return Center(
                                              child: spinkits
                                                  .getSpinningLinespinkit(),
                                            );
                                          },
                                          errorWidget:
                                              (BuildContext context,
                                              String url,
                                              dynamic error) {
                                            // Handle error in case the image fails to load
                                            return Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        data.categoryName ?? "",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  );
                },
              ),
            );
        }
      }),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Services/otherservices.dart';
import '../providers/CategoriesProvider.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/CustomSnackBar.dart';
import 'ProductListScreen.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  final spinkits = Spinkits1();
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height to make the grid responsive
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
            appBar: CustomAppBar1(
              title: 'BRANDS',
              actions: [Container()],
            ),
            body: Consumer<CategoriesProvider>(
                builder: (context, categoriesProvider, child) {
              final brands_list = categoriesProvider.brandsList;
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.41,
                  ),
                  itemCount: brands_list.length,
                  itemBuilder: (context, index) {
                    var data = brands_list[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        InkResponse(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                        brandID: data.id ?? "",
                                        categoryID: "")));
                          },
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    width: w * 0.3,
                                    height: w * 0.15,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl: data.brandLogo ?? "",
                                        fit: BoxFit.cover,
                                        placeholder:
                                            (BuildContext context, String url) {
                                          return Center(
                                            child: spinkits
                                                .getSpinningLinespinkit(),
                                          );
                                        },
                                        errorWidget: (BuildContext context,
                                            String url, dynamic error) {
                                          // Handle error in case the image fails to load
                                          return Icon(Icons.error);
                                        },
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          )
        : NoInternetWidget();
  }
}

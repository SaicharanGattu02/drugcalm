import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Model/AddressListModel.dart';
import 'package:drugcalm/Screens/AddAddress.dart';
import 'package:drugcalm/providers/AddressProvider.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';

class AddressListScreen extends StatefulWidget {
  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  // List of addresses (simulating a model with address and mobile number)
  List<Map<String, String>> addressList = [
    {
      'address':
          '303, The Platina, A-Block, Jayabheri Enclave,Gachibowli, Hyderabad, Telangana 500032',
      'mobile': '9876543210'
    },
    {
      'address':
          '303, The Platina, A-Block, Jayabheri Enclave,Gachibowli, Hyderabad, Telangana 500032',
      'mobile': '9123456789'
    },
    {
      'address':
          '303, The Platina, A-Block, Jayabheri Enclave,Gachibowli, Hyderabad, Telangana 500032t',
      'mobile': '8234567890'
    },
  ];

  // Radio button value for selected address
  String? selectedAddress;

  // Function to handle address selection
  void _onAddressSelected(String? value) {
    setState(() {
      selectedAddress = value;
    });
  }

  void _addAddress() {
    setState(() {
      addressList.add({'address': 'New Address', 'mobile': '1234567890'});
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'Address List',
        actions: [Container()],
      ),
      body: Container(
        width: w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkResponse(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAddress(productid: "",type: "Add",),
                    ));
              },
              child: Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: color4, // Button color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // To make the container size fit content
                  children: [
                    Icon(
                      Icons.add_location, // Choose an icon you prefer
                      color: color1, // Icon color
                    ),
                    SizedBox(width: 8), // Space between the icon and text
                    Text(
                      'Add Address',
                      style: TextStyle(
                          color: color, // Text color
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), Consumer<AddressListProvider>(
        builder: (context, addressProvider, child) {
          final address_list = addressProvider.addressList;
          // Find the id of the address with default_address == true
          String? defaultAddressId = address_list
              .firstWhere(
                  (address) => address.default_address == true,
              orElse: () => AddressList()
          )
              .id;
          if (address_list.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: w * 0.2,),
                  Image.asset(
                    alignment: Alignment.center,
                    'assets/no_address.png', // Your "no items" image
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30,),
                  Text("No Address Found",
                    style: TextStyle(
                      color: Color(0xffCAA16C),
                      fontFamily: 'RozhaOne',
                      fontSize: 22,
                      height: 18 / 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "You have no any delivery location add delivery address first.",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'RozhaOne',
                      fontSize: 16,
                      height: 18 / 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: w * 0.2,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddAddress(type: "Add", productid: "")),
                      );
                    },
                    child: Container(
                      width: w * 0.5,
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff110B0F),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Add Location",
                          style: TextStyle(
                            color: Color(0xffCAA16C),
                            fontFamily: 'RozhaOne',
                            fontSize: 16,
                            height: 21.06 / 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }

          return

            Expanded(
              child: ListView.builder(
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  String address = addressList[index]['address']!;
                  String mobile = addressList[index]['mobile']!;

                  return Card(
                    color: color4,
                    child: Padding(
                      padding: EdgeInsets.all(10.0), // Padding inside the card
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: mobile,
                            groupValue: selectedAddress,
                            onChanged: _onAddressSelected,
                            activeColor: color1,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prashanth Chary",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      color: color11),
                                ),
                                Text(
                                  address,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: color),
                                ),
                                Text(
                                  "Mobile No: ${mobile}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          // Info IconButton on the right side
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              customButton: const Icon(
                                Icons.more_vert_rounded,
                                size: 18,
                                color: Colors.black,
                              ),
                              items: [
                                ...MenuItems.firstItems.map(
                                      (item) => DropdownMenuItem<MenuItem>(
                                    value: item,
                                    child: MenuItems.buildItem(item),
                                  ),
                                ),
                                DropdownMenuItem<Divider>(enabled: false, child: Divider(color: Colors.white)),
                              ],
                              onChanged: (value) {
                                MenuItems.onChanged(context, value! as MenuItem, address.id ?? "");
                              },
                              dropdownStyleData: DropdownStyleData(
                                width: 120,
                                padding: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                              ),
                              menuItemStyleData: MenuItemStyleData(
                                customHeights: [
                                  ...List<double>.filled(MenuItems.firstItems.length, 48),
                                  8,
                                ],
                                padding: const EdgeInsets.only(left: 16, right: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
        }
            ),
          ],
        ),
      ),
    );
  }
}



class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [edit, remove,];


  static const edit = MenuItem(text: 'Edit', icon: Icons.edit);
  static const remove = MenuItem(text: 'Remove', icon: Icons.delete_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 18),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item,String addressID) {

    Future<void> delateAddress() async{
      final address_delate_provider = Provider.of<AddressListProvider>(context, listen: false);
      address_delate_provider.removFromAddressList(addressID);
    }
    switch (item) {
      case MenuItems.edit:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddress(type: "Edit", productid: addressID)));

        break;
      case MenuItems.remove:

        delateAddress();
        break;
    }
  }
}

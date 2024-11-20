import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Model/AddressListModel.dart';
import '../Model/AdressDeatilsModel.dart';
import '../Model/BrandsModel.dart';
import '../Model/CategoriesModel.dart';
import '../Model/RegisterModel.dart';
import '../Model/ShippingDetailsModel.dart';
import '../Model/VerifyOtpModel.dart';
import '../Model/WishlistModel.dart';
import 'otherservices.dart';  // Import this for MediaType


class Userapi {
  static String host = "http://192.168.0.169:8000";

  static Future<RegisterModel?> PostRegister(String fullname, String mail,
      String phone, String password, String gender) async {
    try {
      Map<String, String> data = {
        "full_name": fullname,
        "email": mail,
        "mobile": phone,
        "password": password,
        "gender": gender
      };
      final url = Uri.parse("${host}/auth/register");
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data),
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("PostRegister Status:${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> PostOtp(String phone) async {
    try {
      Map<String, String> data = {
        "mobile": phone,
      };
      final url = Uri.parse("http://192.168.0.169:8000/auth/login-otp");
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data),
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("PostOtp Status:${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<VerifyOtpModel?> VerifyOtp(String phone, String otp) async {
    try {
      Map<String, String> data = {
        "mobile": phone,
        "otp": otp,
      };
      final url = Uri.parse("http://192.168.0.169:8000/auth/verify-otp");
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data),
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("VerifyOtp Status:${response.body}");
        return VerifyOtpModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> addAdress(
      String pincode,
      String mobile,
      String address,
      String address_type,
      String fullname,
      String alternate,
      ) async {
    try {
      // Define the form data
      final Map<String, String> formData = {
        'pincode': pincode,
        'mobile': mobile,
        'address': address,
        'address_type': address_type,
        'full_name': fullname,
        'alternate_mobile': alternate,
      };

      print("Formdata:${formData}");
      final url = Uri.parse("${host}/api/address");
      final headers = await getheader1();
      final response = await http.post(url, headers: headers, body: formData);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("addAdress response: ${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> updateAdress(
      String id,
      String pincode,
      String mobile,
      String address,
      String address_type,
      String fullname,
      String alternate,
      ) async {
    try {
      // Define the form data
      final Map<String, String> formData = {
        'pincode': pincode,
        'mobile': mobile,
        'address': address,
        'address_type': address_type,
        'full_name': fullname,
        'alternate_mobile': alternate,
      };
      final url = Uri.parse("${host}/api/update-address/$id");
      final headers = await getheader1();
      final response = await http.put(url, headers: headers,body: formData);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("updateAdress response: ${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> deleteAdress(String id) async {
    try {
      final url = Uri.parse("${host}/api/update-address/$id");
      final headers = await getheader1();
      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("deleteAdress response: ${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> defaultAdress(String id) async {
    try {
      final url = Uri.parse("${host}/api/default-address/$id");
      final headers = await getheader1();
      final response = await http.put(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("defaultAdress response: ${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<AdressDeatilsModel?> getaddressdetails(String id) async {
    try {
      final url = Uri.parse("${host}/api/address-details/$id");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getaddress response: ${response.body}");
        return AdressDeatilsModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<AddressListModel?> getAdressList() async {
    try {
      final url = Uri.parse("${host}/api/address");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getAdressList response: ${response.body}");
        return AddressListModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }



  static Future<ShippingDetailsModel?> getShippingDetails() async {
    try {
      final url = Uri.parse("${host}/api/shipping_details");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getShippingDetails response: ${response.body}");
        return ShippingDetailsModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> placeOrder(
      int order_value,
      String address,
      List<String> items, // Changed to accept a list of items
      ) async {
    // Set the URL of your API
    final url = Uri.parse('${host}/api/orders');

    // Get headers dynamically
    final headers = await getheader2();

    // Create a multipart request
    var request = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields['order_value'] = order_value.toString()
      ..fields['payment_method'] = 'Cash on delivery'
      ..fields['address'] = address;

    // Use this approach to handle multiple collaborators
    request.fields.addAll({
      for (int i = 0; i < items.length; i++) 'items[$i]': items[i],
    });

    try {
      // Send the request
      print("Request Fields: ${request.fields}");
      var response = await request.send();

      // Check for a successful response
      if (response.statusCode == 200) {
        print('Order placed successfully!');
        final responseData = await response.stream.bytesToString();

        // Decode the JSON response
        final jsonResponse = jsonDecode(responseData);
        print("placeOrder response: $jsonResponse");

        // Assuming RegisterModel has a fromJson constructor
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print('Failed to place order. Status code: ${response.statusCode}');
        final responseData = await response.stream.bytesToString();
        print('Response: $responseData');
      }
    } catch (e) {
      print('Error: $e');
    }

    return null; // Return null if there's an error
  }

  static Future<CategoriesModel?> getCategories() async {
    try {
      final url =
      Uri.parse("$host/api/categories"); // Adjusted the endpoint URL
      final headers =
      await getheader1(); // Ensuring headers are fetched asynchronously
      final response = await http.get(
        url,
        headers: headers,
      );
      // Check the response status code
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getCategories response: ${response.body}");

        // Parse the JSON response into a model
        return CategoriesModel.fromJson(jsonResponse);
      } else {
        // Handle non-200 responses (e.g., 401, 404, etc.)
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }


  static Future<BrandsModel?> getBrands() async {
    try {
      final url =
      Uri.parse("$host/api/brands"); // Adjusted the endpoint URL
      final headers =
      await getheader1(); // Ensuring headers are fetched asynchronously
      final response = await http.get(
        url,
        headers: headers,
      );
      // Check the response status code
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getBrands response: ${response.body}");

        // Parse the JSON response into a model
        return BrandsModel.fromJson(jsonResponse);
      } else {
        // Handle non-200 responses (e.g., 401, 404, etc.)
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> AddWishList(String product) async {
    try {
      Map<String, String> data = {
        "product": product,
      };
      final url = Uri.parse("${host}/api/wishlists");
      final headers = await getheader2();

      final response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("AddWishList Status:${response.body}");
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<WishlistModel?> getWishList() async {
    try {
      final url = Uri.parse("${host}/api/wishlists");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("GetWishList response: ${response.body}");
        return WishlistModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Catch any exceptions (e.g., network failure, JSON parsing error)
      print("Error occurred: $e");
      return null;
    }
  }
}

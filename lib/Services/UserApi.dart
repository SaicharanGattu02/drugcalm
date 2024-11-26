import 'dart:convert';
import 'dart:io';
import 'package:drugcalm/Model/GetCartListModel.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import '../Model/AddressListModel.dart';
import '../Model/AdressDeatilsModel.dart';
import '../Model/BLockListModel.dart';
import '../Model/BrandsModel.dart';
import '../Model/BusinessTypesModel.dart';
import '../Model/CategoriesModel.dart';
import '../Model/GetCartListModel.dart';
import '../Model/LanguageModel.dart';
import '../Model/OrderDetailsModel.dart';
import '../Model/OrdersListModel.dart';
import '../Model/OutletModel.dart';
import '../Model/ProductsListModel.dart';
import '../Model/RegisterModel.dart';
import '../Model/ShippingDetailsModel.dart';
import '../Model/UserDetailsModel.dart';
import '../Model/VerifyOtpModel.dart';
import '../Model/WishlistModel.dart';
import '../providers/ProductsDetailsModel.dart';
import 'otherservices.dart'; // Import this for MediaType
import 'package:http_parser/http_parser.dart'; // Import this for MediaType

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
      final url = Uri.parse("${host}/auth/login-otp");
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


  static Future<RegisterModel?> SignIn(String email,String password) async {
    try {
      Map<String, String> data = {
        "email": email,
        "password": password,
      };
      final url = Uri.parse("${host}/auth/login");
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data),
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("SignIn Status:${response.body}");
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
      final url = Uri.parse("${host}/auth/verify-otp");
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

  static Future<RegisterModel?> addAdress(String pincode,
      String mobile,
      String address,
      String address_type,
      String fullname,
      String alternate,) async {
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

  static Future<RegisterModel?> updateAdress(String id,
      String pincode,
      String mobile,
      String address,
      String address_type,
      String fullname,
      String alternate,) async {
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
      final response = await http.put(url, headers: headers, body: formData);
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

  static Future<BusinessTypesModel?> getBusinessTypes() async {
    try {
      // Define the URL
      final url = Uri.parse("${host}/api/business-types");
      final headers = await getheader1();
      // Send the GET request with the headers
      final response = await http.get(url, headers: headers);
      // print("response:${response.body}");

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getBusinessTypes response: ${response.body}");

        // Parse the JSON response into a BusinessTypesModel object
        return BusinessTypesModel.fromJson(jsonResponse);
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

  static Future<OutletModel?> getOutlet() async {
    try {
      // Define the URL
      final url = Uri.parse("${host}/api/outlets");
      final headers = await getheader1();
      // Send the GET request with the headers
      final response = await http.get(url, headers: headers);
      // print("response:${response.body}");

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getBusinessTypes response: ${response.body}");

        // Parse the JSON response into a BusinessTypesModel object
        return OutletModel.fromJson(jsonResponse);
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


  static Future<RegisterModel?> AddBusinessOutlet(name, business_type, sub_type,
      location, prem_type, File image) async {
    // URL
    final url = Uri.parse('${host}/api/outlets');

    // Get headers (Authorization token)
    final headers = await getheader();

    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = headers // Add Bearer token
      ..fields['name'] = name
      ..fields['business_type'] = business_type
      ..fields['sub_type'] = sub_type
      ..fields['location'] = location
      ..fields['prem_type'] = prem_type;

    try {
      // Adding the image file (replace with correct file path)

      var imageFile = await http.MultipartFile.fromPath(
        'image',
        image.path, // Get the path of the image file
        contentType: MediaType(
            'image', 'jpeg'), // Set content type (change as needed)
      );
      request.files.add(imageFile);

      // Send the request
      var response = await request.send();

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Collect response body from stream
        var responseBody = await response.stream.bytesToString();

        // Print the response (optional)
        print("getBusinessTypes response: $responseBody");

        // Parse the JSON response into a RegisterModel object
        final jsonResponse = jsonDecode(responseBody);
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle any error that occurs during the request
      print('Error: $e');
      return null;
    }
  }

  static Future<RegisterModel?> AddBasicDetails(
      land_line_number,
      mobile,
      alternate_mobile,
      full_name,
      business_name,
      email,
      password
      ) async {
    final url = Uri.parse('${host}/api/basic-info');

    // Get headers (Authorization token)
    final headers = await getheader();

    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = headers
      ..fields['land_line_number'] = land_line_number
      ..fields['mobile'] = mobile
      ..fields['alternate_mobile'] = alternate_mobile
      ..fields['full_name'] = full_name
      ..fields['business_name'] = business_name
      ..fields['password'] = password
      ..fields['email'] = email;
    try {
      // Send the request
      var response = await request.send();
      // Check if the response is successful
      if (response.statusCode == 200) {
        // Collect response body from stream
        var responseBody = await response.stream.bytesToString();
        // Print the response (optional)
        print("AddBasicDetails response: $responseBody");
        // Parse the JSON response into a RegisterModel object
        final jsonResponse = jsonDecode(responseBody);
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle any error that occurs during the request
      print('Error: $e');
      return null;
    }
  }


  static Future<RegisterModel?> AddBusinessDetailsApi(outlet,
      registration_number,
      license_number,
      drug_license_no,
      drug_license_expire,
      gst,
      pan,
      municipal_license_number,
      geolocation,
      outlet_count) async {
    var url = Uri.parse('${host}/api/business');
    var request = http.MultipartRequest('POST', url);
    // Adding form fields
    // Get headers (Authorization token)
    final headers = await getheader();
    request.headers['Authorization'] = headers; // Add Bearer token
    request.fields['outlet'] = outlet;
    request.fields['registration_number'] = registration_number;
    request.fields['license_number'] = license_number;
    request.fields['drug_license_no'] = drug_license_no;
    request.fields['drug_license_expire'] = drug_license_expire;
    request.fields['gst'] = gst;
    request.fields['pan'] = pan;
    request.fields['municipal_license_number'] = municipal_license_number;
    request.fields['geolocation'] = geolocation;
    request.fields['outlet_count'] = outlet_count;


    print("request fields:${request.fields}");

    try {
      var response = await request.send();
      // Check if the response is successful
      if (response.statusCode == 200) {
        // Collect response body from stream
        var responseBody = await response.stream.bytesToString();

        // Print the response (optional)
        print("getBusinessTypes response: $responseBody");

        // Parse the JSON response into a RegisterModel object
        final jsonResponse = jsonDecode(responseBody);
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
    }
    return null;
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

  static Future<RegisterModel?> placeOrder(String order_value,
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
      final url = Uri.parse("$host/api/brands"); // Adjusted the endpoint URL
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

  static Future<RegisterModel?> RemoveWishList(String product_id) async {
    print("product_id>>>${product_id}");
    try {
      final url = Uri.parse("${host}/api/update-wishlist/$product_id");
      final headers = await getheader2();
      final response = await http.put(
        url,
        headers: headers,
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("RemoveWishList Status:${response.body}");
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

  static Future<ProductsListModel?> getProductsList(categoryID,brandID) async {
    try {
      final url = Uri.parse("${host}/api/items?category=${categoryID}&brand=${brandID}");
      final headers = await getheader1();
      final response = await http.get(
        url,
        headers: headers,
      );
      // Check the response status code
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getProductsList response: ${response.body}");
        // Parse the JSON response into a model
        return ProductsListModel.fromJson(jsonResponse);
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

  static Future<UserDetailsModel?> getUserdetsils() async {
    try {
      final url = Uri.parse("${host}/auth/user-detail");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getUserdetsils response: ${response.body}");
        return UserDetailsModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> updateprofile(String id,
      String pincode,
      String mobile,
      String address,
      String address_type,) async {
    try {
      // Define the form data
      final Map<String, String> formData = {
        'pincode': pincode,
        'mobile': mobile,
        'address': address,
        'address_type': address_type
      };
      final url = Uri.parse("${host}/api/update-address/$id");
      final headers = await getheader1();
      final response = await http.put(url, headers: headers, body: formData);
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

  static Future<RegisterModel?> updateProfile(String fullname, String mobile,
      String email, File? image, String gender, String dob) async {
    String? mimeType;

    if (image != null) {
      mimeType = lookupMimeType(image.path); // Get MIME type for the image
      if (mimeType == null || !mimeType.startsWith('image/')) {
        print('Selected file is not a valid image.');
        return null;
      }
    }

    try {
      // Prepare the URL for the update request
      final url = Uri.parse("${host}/auth/user-detail");

      // Create a MultipartRequest for a multipart form upload
      final request = http.MultipartRequest('PUT', url);

      // Add headers (use your token and necessary headers here)
      final headers =
      await getheader1(); // Assuming you have a function to get headers
      request.headers.addAll(headers);

      // Add fields (name, mobile, email)
      request.fields['full_name'] = fullname;
      request.fields['mobile'] = mobile;
      request.fields['email'] = email;
      request.fields['gender'] = gender;
      request.fields['dob'] = dob;

      // If an image is provided, add it to the request as a file
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // The name of the file field in your API
            image.path,
            contentType:
            MediaType.parse(mimeType!), // Ensure mime type is non-null
          ),
        );
      }

      print("Req filelds:${request.fields}");

      // Send the request
      final response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseBody);
        print("updateProfile response: ${responseBody}");
        return RegisterModel.fromJson(
            jsonResponse); // Assuming RegisterModel parses the response
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  static Future<RegisterModel?> updateHealthInformation(String Age,
      String blood, String height, String Weight) async {
    try {
      final Map<String, String> formData = {
        'age': Age,
        'blood_group': blood,
        'hight': height,
        'weight': Weight,
      };
      print("updateHealthInformation response: ${formData}");
      final url = Uri.parse("${host}/auth/user-personal");
      final headers = await getheader1();
      final response = await http.put(url, headers: headers, body: formData);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("updateHealthInformation response: ${response.body}");
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

  static Future<GetCartListModel?> getCartList() async {
    try {
      final url = Uri.parse("${host}/carts");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonresponse = jsonDecode(response.body);
        print("GetCartList response: ${response.body}");
        return GetCartListModel.fromJson(jsonresponse);
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

  //
  static Future<RegisterModel?> addCartQuanitity(String productID,
      String quantity) async {
    try {
      Map<String, String> data = {
        "product": productID,
        "quantity": quantity,
      };
      print("DATA:${data}");
      final url = Uri.parse("${host}/api/carts");
      final headers = await getheader2();

      final response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("AddCartList Status:${response.body}");
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

  static Future<RegisterModel?> updateCartQuanitity(String productID,
      String quantity) async {
    try {
      final url = Uri.parse(
          "${host}/api/update-cart/$productID?quantity=${quantity}");
      final headers = await getheader2();
      final response = await http.put(
        url,
        headers: headers,
      );
      if (response != null) {
        final jsonResponse = jsonDecode(response.body);
        print("updateCartQuanitity Status:${response.body}");
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

  static Future<GetCartListModel?> GetCartList() async {
    try {
      final url = Uri.parse("${host}/api/carts");
      final headers = await getheader2();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("GetCartList response: ${response.body}");
        return GetCartListModel.fromJson(jsonResponse);
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


  static Future<ProductsDetailsModel?> getProductDetails(
      String? product_id) async {
    try {
      final url = Uri.parse("$host/api/item-details/${product_id}");
      final headers = await getheader1();
      final response = await http.get(
        url,
        headers: headers,
      );
      // Check the response status code
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getProductDetails response: ${response.body}");

        // Parse the JSON response into a model
        return ProductsDetailsModel.fromJson(jsonResponse);
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


  static Future<OrdersListModel?> getOrdersListapi(String type) async {
    try {
      final url = Uri.parse("${host}/api/orders?date_filter=${type}");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getOrdersList response: ${response.body}");
        return OrdersListModel.fromJson(jsonResponse);
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


  static Future<OrderResponse?> getOrderDetails(String id) async {
    try {
      final url = Uri.parse("${host}/api/order-details/$id");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getOrderDetails response: ${response.body}");
        return OrderResponse.fromJson(jsonResponse);
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


  static Future<BLockListModel?> getBlockList() async {
    try {
      final url = Uri.parse("${host}/api/block-list");
      final headers = await getheader1();
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getBlockList response: ${response.body}");
        return BLockListModel.fromJson(jsonResponse);
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

  static Future<RegisterModel?> removeBlockListapi(String id) async {
    try {
      final url = Uri.parse("${host}/api/update-block-list/${id}");

      final headers = await getheader1();
      final response = await http.put(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("removeBlockListapi response: ${response.body}");
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


  static Future<RegisterModel?> postBlockListapi(String id) async {
    Map<String, String> form = {
      'product': id,
    };
    try {
      final url = Uri.parse("${host}/api/block-list");
      print("API URL: $url");

      final headers = await getheader1();
      print("Request Headers: $headers");

      final response = await http.post(url, headers: headers, body: form);
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("Added Item In Block List: $jsonResponse");
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


static Future<RegisterModel?> uploadFiles(List<Map<String, File>> selectedFiles) async {
    // API endpoint
    final uri = Uri.parse('${host}/api/kyc');

    // Create a multipart request
    var request = http.MultipartRequest('POST', uri);
    // Get headers (Authorization token)
    final headers = await getheader();

    // Add cookie headers (similar to curl's --header)
    request.headers['Authorization'] = headers;

    // Add each file to the request from the selectedFiles list
    for (var fileEntry in selectedFiles) {
      // Assuming each map entry has a key-value pair where key is the document type and value is the file
      fileEntry.forEach((key, file) async {
        String fieldName = key;  // The key is the document type (e.g., 'registration', 'drug_license', etc.)
        // Add the file to the request
        request.files.add(await http.MultipartFile.fromPath(
            fieldName,
            file.path,
            contentType: MediaType('application', 'octet-stream') // Adjust MIME type if necessary
        ));
      });
    }

    // Send the request
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Collect response body from stream
        var responseBody = await response.stream.bytesToString();

        // Print the response (optional)
        print("uploadFiles response: $responseBody");

        // Parse the JSON response into a RegisterModel object
        final jsonResponse = jsonDecode(responseBody);
        return RegisterModel.fromJson(jsonResponse);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }



  static Future<LanguageModel?> getLanguage() async {
    try {
      final url = Uri.parse("${host}/api/language-codes");

      final response = await http.get(url,);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("getLanguage response: ${response.body}");
        return LanguageModel.fromJson(jsonResponse);
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




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';  // For ChangeNotifier
import '../Model/BrandsModel.dart';
import '../Model/CategoriesModel.dart';
import '../Services/UserApi.dart';

class CategoriesProvider with ChangeNotifier {
  List<Categories>? _categories;
  List<Brands>? _brands;
  bool _isLoading = true;  // New loading state
  // Getters
  List<Categories> get categoriesList => _categories ?? [];
  List<Brands> get brandsList => _brands ?? [];

  bool get isLoading => _isLoading;  // Expose the loading state

  // Fetch categories list with loading state
  Future<void> fetchCategoriesList() async {
    try {
      var response = await Userapi.getCategories();
      if(response?.settings?.success==1){
        _categories = response?.data ?? [];
        _isLoading=false;
        notifyListeners();  // Notify listeners that loading has finished
      }else{
        _isLoading=false;
        notifyListeners();  // Notify listeners that loading has finished
      }
    } catch (e) {
      _isLoading=false;
      notifyListeners();  // Notify listeners that loading has finished
      throw Exception('Failed to fetch categories: $e');  // Handle any errors
    } finally {
      _isLoading = false;  // Set isLoading to false after the fetch is complete
      notifyListeners();  // Notify listeners that loading has finished
    }
  }

  // Fetch categories list with loading state
  Future<void> fetchBrandsList() async {
    try {
      var response = await Userapi.getBrands();
      if(response?.settings?.success==1){
        _brands = response?.data ?? [];
        _isLoading=false;
        notifyListeners();  // Notify listeners that loading has finished
      }else{
        _isLoading=false;
        notifyListeners();  // Notify listeners that loading has finished
      }
    } catch (e) {
      _isLoading=false;
      notifyListeners();  // Notify listeners that loading has finished
      throw Exception('Failed to fetch categories: $e');  // Handle any errors
    } finally {
      _isLoading = false;  // Set isLoading to false after the fetch is complete
      notifyListeners();  // Notify listeners that loading has finished
    }
  }
}


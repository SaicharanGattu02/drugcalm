import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';  // For ChangeNotifier
import '../Model/WishlistModel.dart';
import '../Services/UserApi.dart';
import 'ProductListProvider.dart';

class WishlistProvider with ChangeNotifier {
  List<Wishlist> _wishlistProducts = []; // Local list of wishlist products
  List<Wishlist> get wishlistProducts => _wishlistProducts;

  ProductListProvider productListProvider;

  WishlistProvider(this.productListProvider);

  // Method to update ProductListProvider reference
  void updateProductListProvider(ProductListProvider newProvider) {
    productListProvider = newProvider;
  }

  // Fetch the wishlist from the server
  Future<int?> fetchWishList() async {
    try {
      var response = await Userapi.getWishList();
      if (response?.settings?.success == 1) {
        _wishlistProducts = (response?.data ?? []);
        notifyListeners();
        return response?.settings?.success;
      } else {
        _wishlistProducts = [];
        notifyListeners();
        return response?.settings?.success;
      }
    } catch (e) {
      throw Exception('Failed to fetch wishlist details: $e');
    }
  }

  Future<void> addToWishlist(String productId) async {
    try {
      print("Calling API to add product to wishlist...");
      var res = await Userapi.AddWishList(productId);
      print("API Response: $res");

      // Check if the API call is successful
      if (res != null && res.settings?.success == 1) {
        // If successful, update the local wishlist
        Product product = Product(id: productId);
        Wishlist newWishlist = Wishlist(product: product);
        _wishlistProducts.add(newWishlist);
        notifyListeners();

        // Update the product list provider
        productListProvider.updateProductWishlistStatus(productId, true);
        productListProvider.updateBestsellerWishlistStatus(productId, true);
      } else {
        throw Exception('Failed to add product to wishlist');
      }
    } catch (e) {
      print("Error adding to wishlist: $e");
      throw Exception('Failed to add to wishlist: $e');
    }
  }



  // Optimized method to remove a product from the wishlist
  Future<void> removeFromWishlist(String productId) async {
    try {
      // Remove the product locally from the wishlist
      Wishlist productToRemove = _wishlistProducts.firstWhere(
            (wishlist) => wishlist.product?.id == productId,
        orElse: () => Wishlist(product: Product(id: productId)),  // Placeholder Wishlist with product ID
      );

      if (productToRemove != null) {
        _wishlistProducts.remove(productToRemove);
        notifyListeners();
      }

      // Call API to remove product from wishlist (optional)
      var res = await Userapi.RemoveWishList(productId);
      if (res != null && res.settings?.success == 1) {
        // If successful on the server, update product status
        productListProvider.updateProductWishlistStatus(productId, false);
        productListProvider.updateBestsellerWishlistStatus(productId, false);
      } else {
        // Revert local change if the server update fails
        if (productToRemove != null) {
          _wishlistProducts.add(productToRemove);
          notifyListeners();
        }
        throw Exception('Failed to remove product from wishlist');
      }
    } catch (e) {
      throw Exception('Failed to remove from wishlist: $e');
    }
  }
}




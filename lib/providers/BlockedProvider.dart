import 'package:drugcalm/providers/ProductDetailsProvider.dart';
import 'package:flutter/cupertino.dart';

import '../Model/BLockListModel.dart';
import '../Services/UserApi.dart';

class BlockListProvider with ChangeNotifier {
  List<BlockList> _blockListProducts = [];
  List<BlockList>  get blockListProducts =>_blockListProducts;
  ProductDetailsProvider _productDetailsProvider;

  BlockListProvider(this._productDetailsProvider);

  void updateProductDetailsProvider(ProductDetailsProvider read){
    _productDetailsProvider=read;
  }


  Future<int?> fetchBlockList() async {
    var res = await Userapi.getBlockList();
    try {
      if (res != null || res?.settings?.success == 1) {
        _blockListProducts = res?.data ?? [];
        notifyListeners();
        return res?.settings?.success;
      } else {
        _blockListProducts = [];
        notifyListeners();
        return res?.settings?.success;
      }
    } catch (e) {
      throw Exception('Failed to fetch blockList details: $e');
    }
  }

  Future<int?> AddBlockList(String id) async {
    print("Calling API to add product to blockList...");
    var res = await Userapi.postBlockListapi(id);
    print("API Response: $res");
    try {
      if (res != null && res.settings?.success == 1) {
        Product product = Product(id: id);
        BlockList blockList = BlockList(product: product);
        _blockListProducts.add(blockList);
        notifyListeners();
        return res.settings?.success;
      } else {
        return res?.settings?.success;
      }
    } catch (e) {
      print("Error adding to wishlist: $e");
      throw Exception('Failed to add to wishlist: $e');
    }
  }

  Future<int?> removeBlockList(String id) async {
    var res = await Userapi.removeBlockListapi(id);
    try {
      if (res != null && res.settings?.success == 1) {
        // Find the block list product with the given ID and remove it
        _blockListProducts.removeWhere((blockList) => blockList.product?.id == id);
        notifyListeners();
        return res.settings?.success;
      } else {
        return res?.settings?.success;
      }
    } catch (e) {
      print("Error removing from blockList: $e");
      throw Exception('Failed to remove from blockList: $e');
    }
  }



}

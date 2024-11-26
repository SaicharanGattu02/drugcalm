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

  Future<void> AddBlockList(String id) async {
    print("Calling API to add product to blockList...");
    var res = await Userapi.postBlockListapi(id);
    print("API Response: $res");
    try {
      if (res != null && res.settings?.success == 1) {
        Product product = Product(id: id);
        BlockList blockList = BlockList(product: product);
        _blockListProducts.add(blockList);
        notifyListeners();

      } else {
        throw Exception('Failed to add product to blockList');
      }
    } catch (e) {
      print("Error adding to wishlist: $e");
      throw Exception('Failed to add to wishlist: $e');
    }
  }

  Future<void> removeBlockList(String id) async {
    var res = await Userapi.removeBlockListapi(id);
    try {
      if (res != null && res.settings?.success == 1) {
        fetchBlockList();
        Product product = Product(id: id);
        BlockList blockList = BlockList(product: product);
        _blockListProducts.add(blockList);
        notifyListeners();
      } else {
        throw Exception('Failed to add product to remove blockList');
      }
    } catch (e) {
      print("Error  remove to  blockList: $e");
      throw Exception('Failed to remove blockList: $e');
    }
  }
}

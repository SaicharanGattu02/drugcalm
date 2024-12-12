class Product {
  final String id;
  final String name;
  final String subName;
  final String manufactureCompany;
  final String image;
  final double margin;
  final String quantity;
  final String productForm;
  final String? rating;
  final bool? isBlocked; // make this nullable
  final bool bestSeller;
  final String medicineCategory;
  final String usagePurpose;
  final String healthSegment;
  final String mrp;
  final String netPrice;
  final String ptr;
  final bool isInWishlist;

  Product({
    required this.id,
    required this.name,
    required this.subName,
    required this.manufactureCompany,
    required this.image,
    required this.margin,
    required this.quantity,
    required this.productForm,
    this.rating,
    this.isBlocked, // make this nullable
    required this.bestSeller,
    required this.medicineCategory,
    required this.usagePurpose,
    required this.healthSegment,
    required this.mrp,
    required this.netPrice,
    required this.ptr,
    required this.isInWishlist,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      subName: json['sub_name'],
      manufactureCompany: json['manufacture_company'],
      image: json['image'],
      margin: json['margin'].toDouble(),
      quantity: json['quantity'].toString(),  // Convert quantity to string
      productForm: json['product_form'],
      rating: json['rating'].toString(),
      isBlocked: json['is_blocked'], // Nullable
      bestSeller: json['best_seller'],
      medicineCategory: json['medicine_category'],
      usagePurpose: json['usage_purpose'],
      healthSegment: json['health_segment'],
      mrp: json['mrp'],
      netPrice: json['net_price'],
      ptr: json['ptr'],
      isInWishlist: json['is_in_wishlist'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sub_name': subName,
      'manufacture_company': manufactureCompany,
      'image': image,
      'margin': margin,
      'quantity': quantity,
      'product_form': productForm,
      'rating': rating,
      'is_blocked': isBlocked,
      'best_seller': bestSeller,
      'medicine_category': medicineCategory,
      'usage_purpose': usagePurpose,
      'health_segment': healthSegment,
      'mrp': mrp,
      'net_price': netPrice,
      'ptr': ptr,
      'is_in_wishlist': isInWishlist,
    };
  }
}
class Item {
  final String id;
  final Product product;
  final int quantity;
  final double totalAmount;

  Item({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalAmount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      totalAmount: json['total_amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'total_amount': totalAmount,
    };
  }
}

class Address {
  final String id;
  final String mobile;
  final String fullName;
  final String address;
  final bool isDefault;
  final String addressType;
  final String pincode;

  Address({
    required this.id,
    required this.mobile,
    required this.fullName,
    required this.address,
    required this.isDefault,
    required this.addressType,
    required this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      mobile: json['mobile'],
      fullName: json['full_name'],
      address: json['address'],
      isDefault: json['default'],
      addressType: json['address_type'],
      pincode: json['pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mobile': mobile,
      'full_name': fullName,
      'address': address,
      'default': isDefault,
      'address_type': addressType,
      'pincode': pincode,
    };
  }
}

class Shipping {
  final String id;
  final double handlingCharges;
  final double shippingFee;
  final double deliveryCharges;
  final double discount;
  final double totalAmount;
  final double saleAmount;

  Shipping({
    required this.id,
    required this.handlingCharges,
    required this.shippingFee,
    required this.deliveryCharges,
    required this.discount,
    required this.totalAmount,
    required this.saleAmount,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      id: json['id'],
      handlingCharges: json['handling_charges'].toDouble(),
      shippingFee: json['shipping_fee'].toDouble(),
      deliveryCharges: json['delivery_charges'].toDouble(),
      discount: json['discount'].toDouble(),
      totalAmount: json['total_amount'].toDouble(),
      saleAmount: json['sale_amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'handling_charges': handlingCharges,
      'shipping_fee': shippingFee,
      'delivery_charges': deliveryCharges,
      'discount': discount,
      'total_amount': totalAmount,
      'sale_amount': saleAmount,
    };
  }
}

class OrderDetails {
  final String id;
  final String orderId;
  final String status;
  final String paymentMethod;
  final String paymentStatus;
  final List<Item> items;
  final Address address;
  final double orderValue;
  final Product? product;
  final Shipping shipping;

  OrderDetails({
    required this.id,
    required this.orderId,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.items,
    required this.address,
    required this.orderValue,
    this.product,
    required this.shipping,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<Item> items = itemsList.map((item) => Item.fromJson(item)).toList();

    return OrderDetails(
      id: json['id'],
      orderId: json['order_id'],
      status: json['status'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      items: items,
      address: Address.fromJson(json['address']),
      orderValue: json['order_value'].toDouble(),
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      shipping: Shipping.fromJson(json['shipping']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'status': status,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'items': items.map((item) => item.toJson()).toList(),
      'address': address.toJson(),
      'order_value': orderValue,
      'product': product?.toJson(),
      'shipping': shipping.toJson(),
    };
  }
}

class OrderResponse {
  final OrderDetails data;
  final Settings? settings;

  OrderResponse({
    required this.data,
    this.settings,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      data: OrderDetails.fromJson(json['data']),
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'settings': settings?.toJson(),
    };
  }
}

class Settings {
  final int? success;
  final String? message;
  final int? status;

  Settings({
    this.success,
    this.message,
    this.status,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      success: json['success'],
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'status': status,
    };
  }
}

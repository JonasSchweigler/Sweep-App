import 'package:shareweb/utilities/models/order.dart';

class UserData {
  final String userID;
  final List<Order> orders;
  final List<Order> cart;

  UserData({
    this.orders,
    this.cart,
    this.userID,
  });
}

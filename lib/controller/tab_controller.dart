import 'package:get/get.dart';

class TabsController extends GetxController {
  List<String> menuItems =
      ["Cases", "Services", "About Us", "Careers", "Blog", "Contact"].obs;
  var selectedIndex = 0.obs;
  void setMenuIndex(int index) {
    selectedIndex.value = index;
  }
}

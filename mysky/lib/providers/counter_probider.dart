import 'package:flutter/cupertino.dart';
import 'package:mysky/Api_integration/api_get_area.dart';
import 'package:mysky/Api_modelClass/all_get_area_model_class.dart';

class CounterProvider extends ChangeNotifier {
  //get Area
  List<Areas> allGetAreaslist = [];
  getArea(BuildContext context) async {
    allGetAreaslist = await ApiAllGetArea.GetApiAllGetArea(context);
    notifyListeners();
  }
}

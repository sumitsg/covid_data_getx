import 'package:get/get.dart';
import 'package:shopx_app_using_getx/model/covid_data_model.dart';
import 'package:shopx_app_using_getx/services/remote_services.dart';

class ProductController extends GetxController {
  var coviddata = <CovidDataModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCovidData();
  }

  void getCovidData() async {
    var data = await RemoteServices.getCovidData();

    if (data != null) {
      coviddata.value = data;
    }
  }
}

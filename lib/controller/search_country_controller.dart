import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopx_app_using_getx/model/covid_data_model.dart';
import 'package:shopx_app_using_getx/services/remote_services.dart';

class SearchCountryController extends GetxController {
  final searchTextController = TextEditingController();
  // var countryData = <CovidDataModel>[].obs;

  SearchCountryController() {
    searchTextController.addListener(() {
      // if (searchTextController.text.length % 3 == 0 &&
      //     searchTextController.text.length != 0) {
      searchcontryData();
      // }
    });
  }
  RxBool isLoading = false.obs;
  RxList<CovidDataModel> countryData = RxList();
  void searchcontryData() async {
    showLoading();
    var result =
        await RemoteServices.getCountriesData(searchTextController.text);
    hideLoading();
    if (result != null) {
      countryData.value = result.obs;
    } else {
      return null;
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}

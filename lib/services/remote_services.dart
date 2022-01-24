import 'package:http/http.dart' as http;
import 'package:shopx_app_using_getx/model/covid_data_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<CovidDataModel>?> getCovidData() async {
    var response =
        await client.get(Uri.parse('https://covid19-api.com/country/all'));
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return covidDataModelFromJson(jsonString);
    } else {
      //show error msg
      return null;
    }
  }

  static Future<List<CovidDataModel>?> getCountriesData(String country) async {
    var response = await client
        .get(Uri.parse('https://covid19-api.com/country?name=$country'));
    print(response.body);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return covidDataModelFromJson(jsonString);
    } else {
      //show error msg
      return null;
    }
  }
}

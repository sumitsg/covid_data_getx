import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopx_app_using_getx/controller/search_country_controller.dart';
import 'package:shopx_app_using_getx/view/country_tile.dart';

class CountryDetails extends StatefulWidget {
  const CountryDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  final String defaultFlag = 'IN';
  final countryController = Get.put(SearchCountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Country',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'avenir',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: countryController.searchTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Obx(
              () {
                return countryController.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : countryController.countryData.isEmpty
                        ? const Center(
                            child: Text('NO COUNTRY FOUND'),
                          )
                        : Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${countryController.countryData[0].country} | ${countryController.countryData[0].code != null ? emoji(countryController.countryData[0].code) : emoji(defaultFlag)}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 38,
                                        fontFamily: 'avenir',
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    'Confirmed :-${countryController.countryData[0].confirmed}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Recovered :-${countryController.countryData[0].recovered}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Total Deaths :-${countryController.countryData[0].deaths}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Total Deaths :-${countryController.countryData[0].critical}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Last Updated :-${countryController.countryData[0].lastUpdate != null ? dateformat(countryController.countryData[0].lastUpdate) : 'NA'}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Last Changed :-${countryController.countryData[0].lastChange != null ? dateformat(countryController.countryData[0].lastChange) : 'NA'}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'avenir',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
              },
            ),
          )
        ],
      ),
    );
  }

  // ! to change date n time
  String dateformat(DateTime? data) {
    return DateFormat('yyyy-MM-dd – kk:mm').format(data!);
  }
}

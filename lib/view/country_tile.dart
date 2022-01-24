import 'package:flutter/material.dart';

import 'package:shopx_app_using_getx/model/covid_data_model.dart';

class CountryTile extends StatelessWidget {
  final CovidDataModel cData;

  const CountryTile({Key? key, required this.cData}) : super(key: key);

  final String defaultFlag = 'IN';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${cData.country} | ${cData.code != null ? emoji(cData.code) : emoji(defaultFlag)} ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Confirmed :-${cData.confirmed}',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Recovered :-${cData.recovered}',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Total Deaths :-${cData.deaths}',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String emoji(String code) {
  int flagOffset = 0x1F1E6;
  int asciiOffset = 0x41;

  String country = code;

  int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
  int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

  String emoji =
      String.fromCharCode(firstChar) + String.fromCharCode(secondChar);

  return emoji;
}

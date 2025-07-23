import 'package:app_with_riverpod/data/model/country_detail_model.dart';
import 'package:flutter/material.dart';

class CountryDetailWidget extends StatelessWidget {
  const CountryDetailWidget({super.key, required this.model});
  final CountryDetailModel model;

  @override
  Widget build(BuildContext context) {
    final String? flagLink = model.flags?.png;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Common Name'),
              trailing: Text(model.name?.common ?? ""),
            ),
            ListTile(
              title: Text('Official Name'),
              trailing: Text(model.name?.official ?? ""),
            ),
            ListTile(
              title: Text('Population'),
              trailing: Text(model.population.toString()),
            ),
            ListTile(
              title: Text('Region'),
              trailing: Text(model.region.toString()),
            ),
            ListTile(
              title: Text('SubRegion'),
              trailing: Text(model.subregion.toString()),
            ),
            ListTile(
              title: Text('Capital'),
              trailing: Text(model.capital?.join(',') ?? ""),
            ),
            if (flagLink != null) Image.network(flagLink),
          ],
        ),
      ),
    );
  }
}

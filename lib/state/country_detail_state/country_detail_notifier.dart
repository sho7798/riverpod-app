import 'package:app_with_riverpod/data/service/country_service.dart';
import 'package:app_with_riverpod/state/country_detail_state/country_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef CountryDetailProvider =
    AutoDisposeNotifierProvider<CountryDetailNotifier, CountryDetailState>;

class CountryDetailNotifier extends AutoDisposeNotifier<CountryDetailState> {
  final _countryService = CountryService();

  @override
  CountryDetailState build() {
    return CountryDetailLoading();
  }

  void getCountry(String name) async {
    try {
      state = CountryDetailLoading();
      final country = await _countryService.getCountry(name);
      state = CountryDetailSuccess(country);
    } catch (e) {
      state = CountryDetailFailed(e.toString());
    }
  }
}

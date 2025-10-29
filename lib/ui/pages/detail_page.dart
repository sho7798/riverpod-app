import 'package:app_with_riverpod/data/model/country_detail_model.dart';
import 'package:app_with_riverpod/state/country_detail_state/country_detail_state.dart';
import 'package:app_with_riverpod/ui/widgets/country_detail_widget.dart';
import 'package:app_with_riverpod/ui/widgets/failed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/country_detail_state/country_detail_notifier.dart';

class CountryDetailPage extends ConsumerStatefulWidget {
  const CountryDetailPage({
    super.key,
    required this.countryName,
    required this.official,
  });

  final String countryName;
  final String official;

  @override
  ConsumerState<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends ConsumerState<CountryDetailPage> {
  final countryDetailProvider = CountryDetailProvider(
    () => CountryDetailNotifier(),
  );

  @override
  void initState() {
    super.initState();
    getCountryDetail();
  }

  void getCountryDetail() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(countryDetailProvider.notifier)
          .getCountry(widget.countryName.toLowerCase());
    });
  }

  @override
  //calling when change the parent widget
  void didUpdateWidget(covariant CountryDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    getCountryDetail();
  }

  @override
  Widget build(BuildContext context) {
    final CountryDetailState countryDetailState = ref.watch(
      countryDetailProvider,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.countryName)),
      body: switch (countryDetailState) {
        CountryDetailLoading() => Center(child: CircularProgressIndicator()),

        CountryDetailSuccess(countryDetailModel: CountryDetailModel model) =>
          CountryDetailWidget(model: model),

        CountryDetailFailed(errorMessage: String errorMessage) => FailedWidget(
          errorMessage: errorMessage,
          tryAgain: () {},
        ),
      },
    );
  }
}

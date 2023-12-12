import 'package:quotex/const/strings.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/view_model/terms_vm.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';

class TermsApiClient {
  static TermsViewModel getTerms(List<TermsModel> custom) {
    return TermsViewModel(
        trading: trading,
        base: base,
        custom: custom,
        readingCharts: readingChartsInitial,
        stocks: stocksInitial,
        activeTerms: [...trading],
        lastTerms: trading.first,
        testModel: VTestViewModel(date: DateTime.now()));
  }
}

import 'package:quotex/const/strings.dart';
import 'package:quotex/terms/domain/view_model/terms_vm.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';

class TermsApiClient {
  static TermsViewModel getTerms() {
    return TermsViewModel(
        trading: trading,
        base: base,
        readingCharts: readingChartsInitial,
        stocks: stocksInitial,
        activeTerms: [...trading],
        lastTerms: trading.first,
        testModel: VTestViewModel(date: DateTime.now()));
  }
}

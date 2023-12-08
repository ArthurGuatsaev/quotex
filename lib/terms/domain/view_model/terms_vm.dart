import 'package:equatable/equatable.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';

class TermsViewModel extends Equatable {
  final List<TermsModel> trading;
  final List<TermsModel> readingCharts;
  final List<TermsModel> stocks;
  final List<TermsModel> base;
  final List<TermsModel> activeTerms;
  final List<TermsModel> fogotenTerms;
  final List<TermsModel> favoriteTerms;
  final VTestViewModel testModel;
  final TermStadyStatus status;
  final TermsModel lastTerms;
  const TermsViewModel(
      {this.trading = const [],
      this.base = const [],
      required this.testModel,
      this.readingCharts = const [],
      this.fogotenTerms = const [],
      this.stocks = const [],
      this.activeTerms = const [],
      this.favoriteTerms = const [],
      this.status = TermStadyStatus.initial,
      required this.lastTerms});
  @override
  List<Object> get props => [
        trading,
        readingCharts,
        stocks,
        activeTerms,
        lastTerms,
        status,
        favoriteTerms
      ];

  TermsViewModel copyWith({
    List<TermsModel>? trading,
    List<TermsModel>? fogotenTerms,
    List<TermsModel>? readingCharts,
    List<TermsModel>? base,
    List<TermsModel>? stocks,
    List<TermsModel>? activeTerms,
    List<TermsModel>? favoriteTerms,
    TermsModel? lastTerms,
    TermStadyStatus? status,
    VTestViewModel? testModel,
  }) {
    return TermsViewModel(
      testModel: testModel ?? this.testModel,
      trading: trading ?? this.trading,
      base: base ?? this.base,
      fogotenTerms: fogotenTerms ?? this.fogotenTerms,
      readingCharts: readingCharts ?? this.readingCharts,
      stocks: stocks ?? this.stocks,
      activeTerms: activeTerms ?? this.activeTerms,
      lastTerms: lastTerms ?? this.lastTerms,
      favoriteTerms: favoriteTerms ?? this.favoriteTerms,
      status: status ?? this.status,
    );
  }

  List<TermsModel> determine(String category) {
    switch (category) {
      case 'trading':
        trading.shuffle();
        return [...trading];
      case 'readingCharts':
        readingCharts.shuffle();
        return [...readingCharts];
      case 'stocks':
        stocks.shuffle();
        return [...stocks];
      case 'base':
        base.shuffle();
        return [...base];
      default:
        return [...trading];
    }
  }

  TermsViewModel chooseActive(String category) {
    final terms = determine(category);
    return copyWith(
        fogotenTerms: [],
        activeTerms: terms,
        lastTerms: terms.first,
        status: TermStadyStatus.start);
  }

  TermsViewModel timeChange(int duration, DateTime date) {
    return copyWith(
        testModel: testModel.copyWith(duration: duration, date: date));
  }

  TermsViewModel entityChange(int entity) {
    return copyWith(testModel: testModel.copyWith(entity: entity));
  }

  TermsViewModel changeLastTerm(TermsModel tern) {
    return copyWith(lastTerms: tern, status: TermStadyStatus.initial);
  }

  TermsViewModel startTest(List<TermsModel> terms) {
    return copyWith(
        testModel: testModel.copyWith(terms: terms, date: DateTime.now()));
  }

  TermsViewModel addTestAnsear(VTestViewModel test) {
    return copyWith(testModel: test);
  }

  TermsViewModel resetTest() {
    return copyWith(testModel: VTestViewModel(date: DateTime.now()));
  }

  TermsViewModel noRemember(List<TermsModel> fogot) {
    return copyWith(fogotenTerms: fogot);
  }

  TermsViewModel againtIteration() {
    if (fogotenTerms.isEmpty) {
      return copyWith(status: TermStadyStatus.finish);
    }
    return copyWith(activeTerms: [...fogotenTerms], fogotenTerms: []);
  }

  TermsViewModel mixed() {
    return copyWith(
        activeTerms: determine(lastTerms.category!),
        status: TermStadyStatus.initial);
  }

  TermsViewModel favorite(List<TermsModel> history) {
    return copyWith(favoriteTerms: history);
  }

  Map<String, int> get viewItemsList {
    return {
      'Trading': trading.length,
      'Stocks': stocks.length,
      'Reading charts': readingCharts.length,
      'Base': base.length,
    };
  }
}

enum TermStadyStatus { finish, initial, start }

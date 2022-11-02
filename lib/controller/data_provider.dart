import 'package:flutter/cupertino.dart';
import 'package:task/controller/data_fetcher.dart';
import 'package:task/model/data_model.dart';

class DataProvider extends ChangeNotifier {
  final List<DataModel> _dataList = [];
  bool isDataLoading = false;
  final ScrollController _scrollController = ScrollController();

  DataProvider(context) {
    _dataList.clear();
    dataFetcher();
    _scrollController.addListener(scrollListener);
  }

  dataFetcher() async {
    isLoadingToggler();

    final tempList = await DataServices().fetchDataFromNetwork();
    _dataList.addAll(tempList);
    isLoadingToggler();
    notifyListeners();
  }

  List<DataModel> get getList => _dataList;
  ScrollController get scrollController => _scrollController;

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      dataFetcher();
      notifyListeners();
    }
  }

  isLoadingToggler() {
    isDataLoading = !isDataLoading;
    notifyListeners();
  }
}

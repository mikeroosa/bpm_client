import 'package:bpm_client/src/models/search_base.dart';

class SearchBaseList {
  SearchBaseList({
    this.items,
  });

  final List<SearchBase> items;

  SearchBaseList.fromJson(List<dynamic> json)
      : items = json.map((i) => SearchBase.fromJson(i)).toList();
}

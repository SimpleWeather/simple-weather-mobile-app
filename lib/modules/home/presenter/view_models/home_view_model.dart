import 'package:flutter/material.dart';

abstract class HomeViewModel {
  abstract bool showSearch;

  abstract final TextEditingController textController;

  bool get validateSearch;
}

class HomeViewModelImpl implements HomeViewModel {
  @override
  final textController = TextEditingController();

  @override
  bool showSearch = false;

  @override
  bool get validateSearch => textController.text.isNotEmpty && showSearch;
}

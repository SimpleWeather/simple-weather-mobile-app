import 'package:flutter/material.dart';

abstract class HomeViewModel {
  abstract final TextEditingController textController;
}

class HomeViewModelImpl implements HomeViewModel {
  @override
  final textController = TextEditingController();
}

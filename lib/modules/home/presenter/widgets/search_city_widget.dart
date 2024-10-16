import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_models/home_view_model.dart';

class SearchCityWidget extends StatefulWidget {
  const SearchCityWidget({super.key});

  @override
  State<SearchCityWidget> createState() => _SearchCityWidgetState();
}

class _SearchCityWidgetState extends State<SearchCityWidget> {
  final viewModel = Modular.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: !viewModel.showSearch
          ? IconButton(
              onPressed: () => setState(() {
                viewModel.showSearch = true;
              }),
              icon: const Row(
                children: [
                  Icon(Icons.search),
                  Text('Pesquisar'),
                ],
              ),
            )
          : TextFormField(
              controller: viewModel.textController,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: 'Ex: Salvador',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    viewModel.showSearch = false;
                  }),
                  icon: const Icon(Icons.close),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
    );
  }
}

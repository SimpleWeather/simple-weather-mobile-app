import 'package:flutter/material.dart';

class SearchCityWidget extends StatefulWidget {
  final Function(String) onSearch;
  final VoidCallback onTap;
  final VoidCallback onCloseTap;
  final bool showSearch;
  final TextEditingController controller;
  const SearchCityWidget({
    super.key,
    required this.onSearch,
    required this.onTap,
    required this.showSearch,
    required this.controller,
    required this.onCloseTap,
  });

  @override
  State<SearchCityWidget> createState() => _SearchCityWidgetState();
}

class _SearchCityWidgetState extends State<SearchCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: !widget.showSearch
          ? IconButton(
              onPressed: widget.onTap,
              icon: const Row(
                children: [
                  Icon(Icons.search),
                  Text('Pesquisar'),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: TextFormField(
                controller: widget.controller,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                onChanged: widget.onSearch,
                decoration: InputDecoration(
                  hintText: 'Ex: Salvador',
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  suffixIcon: IconButton(
                    onPressed: widget.onCloseTap,
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
            ),
    );
  }
}

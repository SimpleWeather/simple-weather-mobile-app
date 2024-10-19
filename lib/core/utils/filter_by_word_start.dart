import 'package:simple_weather/core/utils/string_normalizers.dart';

List<T> filterByWordStart<T>(
  List<T> elements,
  String Function(T) fieldToCompare,
  String query,
) {
  final texts = elements
      .where(
        (e) => fieldToCompare.call(e).isNotEmpty,
      )
      .toList();

  if (query.isEmpty) return elements;

  return texts.where(
    (element) {
      final fieldText = fieldToCompare
          .call(element)
          .replaceAllCharactersAccents()
          .toLowerCase();
      final queryText = query.replaceAllCharactersAccents().toLowerCase();

      if (query.contains(' ')) {
        return fieldText.contains(queryText);
      }

      return fieldText.split(' ').any(
            (x) => x.startsWith(queryText),
          );
    },
  ).toList();
}

extension StringNormalizers on String {
  String replaceAllCharactersAccents() {
    return replaceAll(RegExp('[aAáÁâÂàÀäÄãÃ]'), 'a')
        .replaceAll(RegExp('[eEéÉêÊèÈëË]'), 'e')
        .replaceAll(RegExp('[iIíÍîÎìÌïÏ]'), 'i')
        .replaceAll(RegExp('[oOóÓôÔòÒöÖõÕ]'), 'o')
        .replaceAll(RegExp('[uUúÚûÛùÙüÜ]'), 'u');
  }

  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'[!@#$%^&*]'), '');
  }
}

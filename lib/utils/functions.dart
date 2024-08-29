String generateFibonacci(int n) {
  if (n <= 0) return '';

  List<int> fibonaciList = [0, 1];
  for (int i = 2; i < n; i++) {
    fibonaciList.add(fibonaciList[i - 1] + fibonaciList[i - 2]);
  }

  String result = '${fibonaciList.take(n).join(', ')}, $n';
  return result;
}

bool isPalindrome(String input) {
  String reversedInput = input.split('').reversed.join('');
  return input == reversedInput;
}

List<int> sortArray(List<int> array) {
  array.sort((a, b) => a.compareTo(b));
  return array;
}

List<List<String>> groupAnagrams(List<String> words) {
  Map<String, List<String>> anagramMap = {};
  for (String str in words) {
    String key = String.fromCharCodes(str.runes.toList()..sort());

    if (!anagramMap.containsKey(key)) {
      anagramMap[key] = [];
    }
    anagramMap[key]!.add(str);
  }

  return anagramMap.values.toList();
}

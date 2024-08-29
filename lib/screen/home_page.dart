import 'package:flutter/material.dart';
import 'package:mini_app_test/utils/functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output = '';

  // Widget to display input and output for each function
  void _showInputDialog(
      String title, String hintText, Function(String) onSubmit) {
    String input = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (value) {
              input = value;
            },
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: [
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                onSubmit(input);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini App Test Tokio')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showInputDialog('Fibonacci Sequence', 'Masukkan N', (input) {
                    int n = int.parse(input);
                    String fibonacciSequence = generateFibonacci(n);
                    setState(() {
                      output = fibonacciSequence;
                    });
                  });
                },
                child: const Text('Generate Fibonacci'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showInputDialog('Palindrome Checker', 'Masukkan kata disini',
                      (input) {
                    bool isPalindromeResult = isPalindrome(input);
                    setState(() {
                      output = isPalindromeResult.toString();
                    });
                  });
                },
                child: const Text('Check Palindrome'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showInputDialog('Sort Array',
                      'Masukkan huruf disini dipisahkan dengan koma', (input) {
                    List<int> array = input.split(',').map(int.parse).toList();
                    List<int> sortedArray = sortArray(array);
                    setState(() {
                      output = sortedArray.join(', ');
                    });
                  });
                },
                child: const Text('Sort Array'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showInputDialog(
                      'Group Anagrams', 'Masukan kata pisahkan dengan koma',
                      (input) {
                    List<String> words = input.split(',');
                    List<List<String>> anagramGroups = groupAnagrams(words);
                    setState(() {
                      output = anagramGroups
                          .map((group) => group.join(', '))
                          .join('\n');
                    });
                  });
                },
                child: const Text('Group Anagrams'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Output:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(output),
            ],
          ),
        ),
      ),
    );
  }
}

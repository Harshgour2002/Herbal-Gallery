import 'package:flutter/material.dart';

class LanguageDialogExample extends StatefulWidget {
  const LanguageDialogExample({super.key});

  @override
  State<LanguageDialogExample> createState() => _LanguageDialogExampleState();
}

class _LanguageDialogExampleState extends State<LanguageDialogExample> {
  String _selectedLanguage = 'English';

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String tempSelected = _selectedLanguage;
        return AlertDialog(
          title: const Text('Select Language'),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: const Text('English'),
                    value: 'English',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setStateDialog(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Hindi'),
                    value: 'Hindi',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setStateDialog(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Marathi'),
                    value: 'Marathi',
                    groupValue: tempSelected,
                    onChanged: (value) {
                      setStateDialog(() {
                        tempSelected = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedLanguage = tempSelected;
                });
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Dialog Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected: $_selectedLanguage',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showLanguageDialog,
              child: const Text('Change Language'),
            ),
          ],
        ),
      ),
    );
  }
}

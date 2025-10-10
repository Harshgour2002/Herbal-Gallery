import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _queryType = "General Enquiry";
  bool _consent = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: TextStyle(color: isDark ? Colors.black : Colors.white),
        ),
        centerTitle: true,
        backgroundColor: isDark ? Colors.green.shade800 : Colors.green.shade500,
        iconTheme: IconThemeData(color: isDark ? Colors.black : Colors.white),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Container(
            width: 600,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Us",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  _buildTextField(
                    "Full Name",
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Query type",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildRadioTile("General Query"),
                  _buildRadioTile("Support Query"),
                  SizedBox(height: 10),
                  Text(
                    "Message",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: Colors.green,
                    decoration: _inputDecoration(
                      "Enter Your Full Message Here",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Message field cannot be empty";
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // Consent Checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        value: _consent,
                        onChanged: (val) {
                          setState(() {
                            _consent = val ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "I consent to being contacted by the team *",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form submitted successfully!"),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper: Build TextField
  Widget _buildTextField(String label, {TextInputType? keyboardType}) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: Colors.green,
      decoration: _inputDecoration(label),
      validator: (value) => value!.isEmpty ? "Required field" : null,
    );
  }

  // Helper: Input Decoration
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      floatingLabelStyle: TextStyle(color: Colors.green),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.green),
      ),
    );
  }

  // Helper: Radio Buttons
  Widget _buildRadioTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: _queryType == title ? Colors.green : Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile<String>(
        title: Text(title),
        value: title,
        groupValue: _queryType,
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
            _queryType = value!;
          });
        },
      ),
    );
  }
}

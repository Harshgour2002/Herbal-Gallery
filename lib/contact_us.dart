import 'package:flutter/material.dart';
import 'package:herbal_gallary/contactFormScreen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us", style: TextStyle(color: isDark ? Colors.black : Colors.white),),
        backgroundColor: isDark ? Colors.green[800] : Colors.green[500],
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDark ? Colors.black : Colors.white
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Logo for herbal gallery
            CircleAvatar(
              radius: 40,
              backgroundColor: isDark
                  ? Colors.green.shade100
                  : Colors.green.shade700,
              child: Icon(
                Icons.eco_rounded,
                color: isDark ? Colors.green.shade700 : Colors.green.shade100,
                size: 50,
              ),
            ),

            const SizedBox(height: 30),

            Text("Herbal Gallery", style: TextStyle(fontSize: 30)),

            SizedBox(height: 30,),
            //contact us cards
            _buildCards(
                icon: Icons.location_on_sharp,
                title: "Our Location",
                detail: "Village:- Balkhadsura, \nPost:- chhaigaon Makhan \nKhandwa MP \nPinCode:-450771",
                color: Colors.green.shade600),

            SizedBox(height: 15,),

            _buildCards(
                icon: Icons.mail_outline_sharp,
                title: "Email Us",
                detail: "herbalgallery@example.com",
                color: Colors.green.shade600),

            SizedBox(height: 15,),

            _buildCards(
                icon: Icons.call,
                title: "Contact US",
                detail: "+91-8888888888",
                color: Colors.green.shade600),

            SizedBox(height: 15,),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.green[800] : Colors.green[500],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              onPressed: (){
                //on press logic
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactFormScreen()));
              },
              icon: Icon(Icons.support_agent_outlined, size: 28, color: isDark ? Colors.white : Colors.white),
              label: Text("Get Support", style: TextStyle(fontSize: 20, color: isDark ? Colors.white : Colors.white),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCards({
  required IconData icon,
  required String title,
  required String detail,
  required Color color,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: color.withOpacity(0.3)),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.1),
          blurRadius: 3,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                detail,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

class Preamble extends StatefulWidget {
  const Preamble({super.key});

  @override
  State<Preamble> createState() => _PreambleState();
}

class _PreambleState extends State<Preamble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/preamble.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    "The Preamble of India",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        '''
We, the people of India, having solemnly resolved to constitute India into a 
Sovereign Socialist Secular Democratic Republic and to secure to all its citizens:
Justice, social, economic and political;
Liberty of thought, expression, belief, faith and worship;
Equality of status and of opportunity;
and to promote among them all
Fraternity assuring the dignity of the individual and the unity and integrity of the Nation.
In our Constituent Assembly this twenty-sixth day of November, 1949, 
do hereby adopt, enact and give to ourselves this Constitution.''',
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                        },
                        icon: Icon(Icons.volume_up),
                        label: Text("Listen"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                        },
                        icon: Icon(Icons.share),
                        label: Text("Share"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

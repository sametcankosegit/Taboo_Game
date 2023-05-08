import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HAKKINDA'),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.red,
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uygulamamıza Hoşgeldiniz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Bu uygulama Samet Can Köse tarafından Türk Halki için geliştirilmiştir.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Amacımız',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Uygulamamızın amacı gerek halkimiz bilinçlendirmek gerekse afet durumunda ve sonrasında yardım ulaştırmaktır.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Ekibimiz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTeamMember(
                  context,
                  'https://cdn3.iconfinder.com/data/icons/cool-avatars-2/190/00-07-2-512.png',
                  'Samet Can Köse',
                  'CEO',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(
      BuildContext context, String imageUrl, String name, String role) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 40,
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          role,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

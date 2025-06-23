import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Mi perfil',
          style: TextStyle(color: Colors.black,
            fontSize: isSmall ? 18 : 24,
            fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // cambia por foto real
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Pablo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('pablodbjs@gmail.com', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined),
                )
              ],
            ),
            const Divider(height: 32, thickness: 1, color: Colors.pinkAccent),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('ACCOUNT SETTING', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_none_outlined),
              title: const Text('Notificaciones'),
              onTap: () {},
            ),

            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('SUPPORT', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('Términos y condiciones'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Información'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Califícanos'),
              onTap: () {},
            ),

            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Cerrar sesión', style: TextStyle(color: Colors.red)),
              onTap: () {
                // TODO: implementar logout
              },
            ),
          ],
        ),
      ),
    );
  }
}

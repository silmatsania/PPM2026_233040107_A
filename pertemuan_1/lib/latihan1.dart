import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 1 - Hello Flutter',
      home: HelloWorldPage(),
    );
  }
}

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Flutter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView ditambah agar tidak overflow di layar kecil
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Emoji sapaan
              const Text(
                '👋',
                style: TextStyle(fontSize: 64),
              ),
              const SizedBox(height: 16),

              // Nama
              const Text(
                'Halo, Silma Tsania Nurrasy!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              // Subjudul
              const Text(
                'Selamat datang di dunia Flutter.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 28),

              // Kartu profil — IntrinsicWidth agar lebar menyesuaikan konten
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header kartu
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person,
                              color: Colors.blue.shade700, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Data Mahasiswa',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.blue.shade200, height: 20),

                      // Baris info
                      _buildInfoRow(Icons.badge, 'NIM', '233040107'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          Icons.school, 'Prodi', 'Teknik Informatika'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          Icons.calendar_today, 'Semester', '6'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Tombol
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.waving_hand),
                label: const Text('Tap Saya'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17, color: Colors.blue.shade600),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// PROFILE PAGE
// ═══════════════════════════════════════════════════════════
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color _blue = Color(0xFF2196F3);
  static const Color _blueLight = Color(0xFF64B5F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // ── AppBar ──────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: _blue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

      // ── Drawer ──────────────────────────────────────────
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 52, 20, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [_blue, _blueLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.4), width: 1.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://api.dicebear.com/9.x/adventurer/png?seed=Silma&backgroundColor=b6e3f4',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Silma Tsania Nurrasy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'silma@gmail.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _DrawerItem(
                    icon: Icons.home_rounded,
                    title: 'Beranda',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.person_rounded,
                    title: 'Profil',
                    isActive: true,
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.settings_rounded,
                    title: 'Pengaturan',
                    onTap: () => Navigator.pop(context),
                  ),
                  _DrawerItem(
                    icon: Icons.info_outline_rounded,
                    title: 'Tentang',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Divider(),
                  ),
                  Builder(
                    builder: (ctx) => _DrawerItem(
                      icon: Icons.widgets_rounded,
                      title: 'Widget Gallery',
                      onTap: () {
                        Navigator.pop(ctx);
                        Navigator.push(
                          ctx,
                          MaterialPageRoute(
                            builder: (_) => const GalleryHome(),
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (ctx) => _DrawerItem(
                      icon: Icons.tune_rounded,
                      title: 'Pengaturan Lanjut',
                      onTap: () {
                        Navigator.pop(ctx);
                        showDialog(
                          context: ctx,
                          builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Text('Pengaturan'),
                            content: const Text(
                              'Halaman pengaturan belum tersedia.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Tutup'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ── Body ────────────────────────────────────────────
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header profil — putih menyatu
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 28),
              child: Column(
                children: [
                  // Avatar dengan border + shadow biru
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _blue, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: _blue.withOpacity(0.2),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 54,
                      backgroundColor: const Color(0xFFB6E3F4),
                      child: ClipOval(
                        child: Image.network(
                          'https://api.dicebear.com/9.x/adventurer/png?seed=Silma&backgroundColor=b6e3f4&hair=long01&eyes=variant01',
                          width: 108,
                          height: 108,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Silma Tsania Nurrasy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: _blue.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _blue.withOpacity(0.25)),
                    ),
                    child: const Text(
                      'Mahasiswa Teknik Informatika',
                      style: TextStyle(
                        fontSize: 13,
                        color: _blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Divider tipis
            Container(height: 1, color: Colors.grey.shade100),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Statistik
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      children: const [
                        Expanded(
                            child: _StatBox(label: 'Post', value: '12')),
                        _StatDivider(),
                        Expanded(
                            child: _StatBox(label: 'Teman', value: '128')),
                        _StatDivider(),
                        Expanded(
                            child: _StatBox(label: 'Like', value: '1.2K')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Label Informasi
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 18,
                        decoration: BoxDecoration(
                          color: _blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const _SectionHeader('Informasi'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const _SectionCard(
                    icon: Icons.info_outline_rounded,
                    title: 'Tentang Saya',
                    content:
                    'Saya suka belajar hal baru, terutama yang berkaitan '
                        'dengan teknologi dan pengembangan aplikasi mobile.',
                  ),
                  const _SectionCard(
                    icon: Icons.school_rounded,
                    title: 'Pendidikan',
                    content:
                    'Universitas Pasundan — Semester 6\nNIM: 233040107',
                  ),
                  const _SectionCard(
                    icon: Icons.favorite_rounded,
                    title: 'Hobi & Minat',
                    content: 'Coding • Membaca • Fotografi • Game',
                  ),
                  const _SectionCard(
                    icon: Icons.email_rounded,
                    title: 'Kontak',
                    content: 'silma@gmail.com\n+62 812-3456-7890',
                  ),

                  const SizedBox(height: 8),

                  // Label Skills
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 18,
                        decoration: BoxDecoration(
                          color: _blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const _SectionHeader('Skills'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Skills Card — Tugas Mandiri 3
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: _blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.star_rounded,
                              color: _blue, size: 20),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: const [
                                  _SkillChip(
                                    label: 'Mobile Dev',
                                    icon: Icons.phone_android_rounded,
                                    color: Color(0xFF2196F3),
                                  ),
                                  _SkillChip(
                                    label: 'UI/UX Design',
                                    icon: Icons.brush_rounded,
                                    color: Color(0xFF00BCD4),
                                  ),
                                  _SkillChip(
                                    label: 'Pemrograman OOP',
                                    icon: Icons.flutter_dash,
                                    color: Color(0xFF4CAF50),
                                  ),
                                  _SkillChip(
                                    label: 'Analisis Sistem',
                                    icon: Icons.code_rounded,
                                    color: Color(0xFFFF9800),
                                  ),
                                  _SkillChip(
                                    label: 'Database Management',
                                    icon: Icons.merge_type_rounded,
                                    color: Color(0xFF9C27B0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ruang untuk FAB
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),

      // ── FAB → SnackBar ──────────────────────────────────
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Edit profil belum tersedia'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: _blue,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.edit_rounded),
          label: const Text(
            'Edit Profil',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),

      // ── BottomNavigationBar ─────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _blue,
        unselectedItemColor: Colors.grey.shade400,
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Pesan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Setting'),
        ],
        onTap: (i) {},
      ),
    );
  }
}

// ── Helper: _DrawerItem ──────────────────────────────────────
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2196F3);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? blue.withOpacity(0.08) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon,
            color: isActive ? blue : Colors.grey.shade500, size: 22),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            color: isActive ? blue : Colors.grey.shade800,
            fontSize: 14,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// ── Helper: _StatBox ─────────────────────────────────────────
class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2196F3),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36, color: Colors.grey.shade200);
  }
}

// ── Helper: _SectionHeader ───────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF2196F3),
        letterSpacing: 0.3,
      ),
    );
  }
}

// ── Helper: _SectionCard ─────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon,
                  color: const Color(0xFF2196F3), size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    content,
                    style: TextStyle(
                      height: 1.6,
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Helper: _SkillChip ────────────────────────────────────────
class _SkillChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _SkillChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// WIDGET GALLERY
// ═══════════════════════════════════════════════════════════
class GalleryHome extends StatelessWidget {
  const GalleryHome({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Display', Icons.image_rounded, const Color(0xFF2196F3)),
      ('Input', Icons.edit_rounded, const Color(0xFF4CAF50)),
      ('Button', Icons.smart_button_rounded, const Color(0xFFFF9800)),
      ('Feedback', Icons.notifications_rounded, const Color(0xFF9C27B0)),
      ('Layout', Icons.dashboard_rounded, const Color(0xFF009688)),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Widget Gallery',
            style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final (name, icon, color) = categories[i];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 6),
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              title: Text(name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.chevron_right,
                    size: 18, color: Colors.grey.shade400),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CategoryPage(name: name)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String name;
  const CategoryPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final body = switch (name) {
      'Display' => const _DisplayDemo(),
      'Input' => const _InputDemo(),
      'Button' => const _ButtonDemo(),
      'Feedback' => const _FeedbackDemo(),
      'Layout' => const _LayoutDemo(),
      _ => const Center(child: Text('?')),
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}

// ── Demo Display ─────────────────────────────────────────────
class _DisplayDemo extends StatelessWidget {
  const _DisplayDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const Card(
          child: ListTile(
            leading: Icon(Icons.album),
            title: Text('Judul Item'),
            subtitle: Text('Sub-judul'),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Chip', style: TextStyle(fontWeight: FontWeight.bold)),
        const Wrap(
          spacing: 8,
          children: [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Dart')),
            Chip(label: Text('Mobile')),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Divider',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const Divider(thickness: 2),
        const SizedBox(height: 16),
        const Text('CircleAvatar & Icon',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const Row(
          children: [
            CircleAvatar(child: Text('A')),
            SizedBox(width: 12),
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white),
            ),
            SizedBox(width: 12),
            Icon(Icons.star, color: Colors.amber, size: 40),
          ],
        ),
        const SizedBox(height: 16),
        const Text('ListTile',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nama Pengguna'),
                subtitle: Text('subtitle di sini'),
                trailing: Icon(Icons.arrow_forward_ios, size: 14),
              ),
              Divider(height: 0),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('silma@gmail.com'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Demo Input ────────────────────────────────────────────────
class _InputDemo extends StatefulWidget {
  const _InputDemo();

  @override
  State<_InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<_InputDemo> {
  bool _checked = false;
  bool _switched = true;
  double _slider = 0.5;
  String? _dropdown = 'Apel';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('TextField',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
            hintText: 'Ketik nama Anda',
          ),
        ),
        const SizedBox(height: 16),
        const Text('TextField Password',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        const SizedBox(height: 8),
        CheckboxListTile(
          title: const Text('Checkbox'),
          value: _checked,
          onChanged: (v) => setState(() => _checked = v ?? false),
        ),
        SwitchListTile(
          title: const Text('Switch'),
          value: _switched,
          onChanged: (v) => setState(() => _switched = v),
        ),
        const Text('Slider',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Slider(
            value: _slider,
            onChanged: (v) => setState(() => _slider = v)),
        const SizedBox(height: 8),
        const Text('Dropdown',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButton(
          value: _dropdown,
          isExpanded: true,
          items: ['Apel', 'Jeruk', 'Mangga']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => _dropdown = v),
        ),
      ],
    );
  }
}

// ── Demo Button ───────────────────────────────────────────────
class _ButtonDemo extends StatelessWidget {
  const _ButtonDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {}, child: const Text('Elevated')),
        const SizedBox(height: 8),
        FilledButton(onPressed: () {}, child: const Text('Filled')),
        const SizedBox(height: 8),
        OutlinedButton(
            onPressed: () {}, child: const Text('Outlined')),
        const SizedBox(height: 8),
        TextButton(
            onPressed: () {}, child: const Text('Text Button')),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.send),
          label: const Text('Dengan Icon'),
        ),
        const SizedBox(height: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite, color: Colors.red),
        ),
        const SizedBox(height: 8),
        const Text('FloatingActionButton',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            FloatingActionButton(
              heroTag: 'fab1',
              onPressed: () {},
              mini: true,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              heroTag: 'fab2',
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Extended'),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Demo Feedback ─────────────────────────────────────────────
class _FeedbackDemo extends StatelessWidget {
  const _FeedbackDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Halo dari SnackBar!')),
            );
          },
          child: const Text('Tampilkan SnackBar'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Konfirmasi'),
                content: const Text('Yakin ingin lanjut?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ya'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Tampilkan Dialog'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => Container(
                padding: const EdgeInsets.all(24),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Bottom Sheet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text('Ini adalah modal bottom sheet.'),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
          child: const Text('Tampilkan Bottom Sheet'),
        ),
        const SizedBox(height: 16),
        const Text('Progress Indicator:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const LinearProgressIndicator(value: 0.6),
        const SizedBox(height: 12),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

// ── Demo Layout ───────────────────────────────────────────────
class _LayoutDemo extends StatelessWidget {
  const _LayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Stack — widget bertumpuk',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: Stack(
            children: [
              Container(
                  width: double.infinity, color: Colors.blue.shade100),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                    width: 50, height: 50, color: Colors.red),
              ),
              const Positioned(
                bottom: 12,
                right: 12,
                child: Icon(Icons.star, size: 40, color: Colors.amber),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Wrap — auto-pindah baris saat penuh',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            8,
                (i) => Container(
              padding: const EdgeInsets.all(12),
              color: Colors.teal.shade100,
              child: Text('Item ${i + 1}'),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('GridView (count: 3)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(
              6,
                  (i) => Container(
                color: Colors.purple.shade100,
                alignment: Alignment.center,
                child: Text('${i + 1}'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Padding vs Margin',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          color: Colors.orange.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: Colors.orange,
              child: const Text('Padding: jarak dalam',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.green.shade100,
          child: Container(
            margin: const EdgeInsets.all(16),
            color: Colors.green,
            child: const Text('Margin: jarak luar',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Expanded vs SizedBox di Row',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 80,
              height: 50,
              color: Colors.red,
              child: const Center(
                  child: Text('80px',
                      style: TextStyle(color: Colors.white))),
            ),
            Expanded(
              child: Container(
                height: 50,
                color: Colors.green,
                child: const Center(
                    child: Text('Expanded',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 80,
              height: 50,
              color: Colors.blue,
              child: const Center(
                  child: Text('80px',
                      style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ],
    );
  }
}
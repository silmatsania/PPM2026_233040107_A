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
      title: 'Latihan Widget',
      home: LatihanHome(),
    );
  }
}

class LatihanHome extends StatelessWidget {
  const LatihanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Widget'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Latihan 1'),
              Tab(text: 'Latihan 2'),
              Tab(text: 'Latihan 3'),
              Tab(text: 'Latihan 4'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Latihan1(),
            Latihan2(),
            Latihan3(),
            Latihan4(),
          ],
        ),
      ),
    );
  }
}

// ─── Latihan 1: Text & Styling ────────────────────────────────
class Latihan1 extends StatelessWidget {
  const Latihan1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Hello Flutter!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Ini teks biasa dengan ukuran kecil',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 32),
              _SectionLabel('Eksperimen fontSize'),
              Text(
                'fontSize: 40',
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
              SizedBox(height: 8),
              Text(
                'fontSize: 12 — terasa lebih kecil',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              SizedBox(height: 24),
              _SectionLabel('Eksperimen FontWeight'),
              Text(
                'FontWeight.w300 — tipis',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'FontWeight.bold — tebal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'FontWeight.w900 — sangat tebal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 24),
              _SectionLabel('Eksperimen Colors'),
              Text(
                'Colors.red',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(height: 6),
              Text(
                'Colors.deepPurple',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
              SizedBox(height: 6),
              Text(
                'Color(0xFF2196F3)',
                style: TextStyle(fontSize: 20, color: Color(0xFF2196F3)),
              ),
              SizedBox(height: 24),
              _SectionLabel('Eksperimen letterSpacing'),
              Text(
                'letterSpacing: 2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Tanpa letterSpacing',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Latihan 2: Container & Decoration ───────────────────────
class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _SectionLabel('Kode awal modul — 200x200, shadow'),
          const SizedBox(height: 12),
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3), // fix
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Box',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const _SectionLabel('Eksperimen — width 300, height 100'),
          const SizedBox(height: 12),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3), // fix
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                '300 x 100',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const _SectionLabel('Eksperimen — borderRadius 100 → lingkaran'),
          const SizedBox(height: 12),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3), // fix
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Bulat!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const _SectionLabel('Eksperimen — blurRadius: 50'),
          const SizedBox(height: 12),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3), // fix
                  blurRadius: 50,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'blurRadius: 50',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const _SectionLabel('Eksperimen — Border.all'),
          const SizedBox(height: 12),
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3), // fix
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Dengan border',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─── Latihan 3: Row & Column ──────────────────────────────────
class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  Widget _box(String label, Color color) {
    return Container(
      width: 55,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _boxTall(String label, Color color, double h) {
    return Container(
      width: 55,
      height: h,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('MainAxisAlignment — semua nilai'),
          const SizedBox(height: 12),
          const Text('.start',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _box('A', Colors.blue),
              _box('B', Colors.blue),
              _box('C', Colors.blue),
            ],
          ),
          const SizedBox(height: 12),
          const Text('.center',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _box('A', Colors.orange),
              _box('B', Colors.orange),
              _box('C', Colors.orange),
            ],
          ),
          const SizedBox(height: 12),
          const Text('.end',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _box('A', Colors.green),
              _box('B', Colors.green),
              _box('C', Colors.green),
            ],
          ),
          const SizedBox(height: 12),
          const Text('.spaceBetween',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _box('A', Colors.purple),
              _box('B', Colors.purple),
              _box('C', Colors.purple),
            ],
          ),
          const SizedBox(height: 12),
          const Text('.spaceAround',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _box('A', Colors.teal),
              _box('B', Colors.teal),
              _box('C', Colors.teal),
            ],
          ),
          const SizedBox(height: 12),
          const Text('.spaceEvenly',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _box('A', Colors.red),
              _box('B', Colors.red),
              _box('C', Colors.red),
            ],
          ),
          const SizedBox(height: 28),
          const _SectionLabel('Bonus — crossAxisAlignment di Row'),
          const SizedBox(height: 12),
          const Text('.start',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Container(
            color: Colors.grey.shade100,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _boxTall('A', Colors.blue, 40),
                _boxTall('B', Colors.blue, 60),
                _boxTall('C', Colors.blue, 55),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('.center',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Container(
            color: Colors.grey.shade100,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _boxTall('A', Colors.orange, 40),
                _boxTall('B', Colors.orange, 60),
                _boxTall('C', Colors.orange, 55),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('.end',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Container(
            color: Colors.grey.shade100,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _boxTall('A', Colors.green, 40),
                _boxTall('B', Colors.green, 60),
                _boxTall('C', Colors.green, 55),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('.stretch',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Container(
            color: Colors.grey.shade100,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _boxTall('A', Colors.purple, 80),
                _boxTall('B', Colors.purple, 80),
                _boxTall('C', Colors.purple, 80),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─── Latihan 4: Icon & Bottom Bar ────────────────────────────
class Latihan4 extends StatelessWidget {
  const Latihan4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _SectionLabel(
                    '4 ikon pilihan dari fonts.google.com/icons'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _IconLabel(
                        icon: Icons.rocket_launch,
                        label: 'Launch',
                        color: Colors.blue,
                        size: 32),
                    _IconLabel(
                        icon: Icons.psychology,
                        label: 'AI',
                        color: Colors.purple,
                        size: 32),
                    _IconLabel(
                        icon: Icons.bolt,
                        label: 'Bolt',
                        color: Colors.amber,
                        size: 32),
                    _IconLabel(
                        icon: Icons.flutter_dash,
                        label: 'Flutter',
                        color: Colors.teal,
                        size: 32),
                  ],
                ),
                const SizedBox(height: 28),
                const _SectionLabel('Eksperimen — variasi ukuran'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    _IconLabel(
                        icon: Icons.star,
                        label: 'size 24',
                        color: Colors.amber,
                        size: 24),
                    _IconLabel(
                        icon: Icons.star,
                        label: 'size 32',
                        color: Colors.amber,
                        size: 32),
                    _IconLabel(
                        icon: Icons.star,
                        label: 'size 48',
                        color: Colors.amber,
                        size: 48),
                    _IconLabel(
                        icon: Icons.star,
                        label: 'size 64',
                        color: Colors.amber,
                        size: 64),
                  ],
                ),
                const SizedBox(height: 28),
                const _SectionLabel('Eksperimen — variasi warna'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _IconLabel(
                        icon: Icons.favorite,
                        label: 'Merah',
                        color: Colors.red,
                        size: 40),
                    _IconLabel(
                        icon: Icons.eco,
                        label: 'Hijau',
                        color: Colors.green,
                        size: 40),
                    _IconLabel(
                        icon: Icons.auto_awesome,
                        label: 'Ungu',
                        color: Colors.purple,
                        size: 40),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.rocket_launch), label: 'Launch'),
            BottomNavigationBarItem(
                icon: Icon(Icons.psychology), label: 'AI'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bolt), label: 'Bolt'),
            BottomNavigationBarItem(
                icon: Icon(Icons.flutter_dash), label: 'Flutter'),
          ],
        ),
      ],
    );
  }
}

// ── Helper widgets ─────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final double size;

  const _IconLabel({
    required this.icon,
    required this.label,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: size, color: color),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ============================================================
// MODEL
// ============================================================
class Catatan {
  final String judul;
  final String isi;
  final String kategori;
  final String email; // Tugas 3: field email
  final DateTime dibuatPada;

  Catatan({
    required this.judul,
    required this.isi,
    required this.kategori,
    required this.email,
    required this.dibuatPada,
  });

  // Tugas 1: copyWith untuk update data lama
  Catatan copyWith({
    String? judul,
    String? isi,
    String? kategori,
    String? email,
    DateTime? dibuatPada,
  }) {
    return Catatan(
      judul: judul ?? this.judul,
      isi: isi ?? this.isi,
      kategori: kategori ?? this.kategori,
      email: email ?? this.email,
      dibuatPada: dibuatPada ?? this.dibuatPada,
    );
  }
}

// ============================================================
// ROOT APP
// ============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catatan Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF42A5F5),
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xFF42A5F5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF42A5F5),
          foregroundColor: Colors.white,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Color(0xFF42A5F5),
            side: BorderSide(color: Color(0xFF42A5F5)),
          ),
        ),

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
        // Tugas 1: /tambah bisa menerima catatanLama (opsional) untuk mode Edit
          case '/tambah':
            final catatanLama =
            settings.arguments is Catatan ? settings.arguments as Catatan : null;
            return MaterialPageRoute(
              builder: (_) => TambahCatatanPage(catatanLama: catatanLama),
            );
          case '/detail':
            if (settings.arguments is! Catatan) return null;
            final catatan = settings.arguments as Catatan;
            return MaterialPageRoute(
              builder: (_) => DetailCatatanPage(catatan: catatan),
            );
        }
        return null;
      },
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // === STATE ===
  final List<Catatan> _catatan = [
    Catatan(
      judul: 'Belajar Flutter',
      isi: 'Mempelajari Stateful Widget, Form, dan Navigation.',
      kategori: 'Kuliah',
      email: 'mahasiswa@gmail.com',
      dibuatPada: DateTime.now(),
    ),
    Catatan(
      judul: 'Tugas Praktikum',
      isi: 'Kerjakan tugas mandiri pertemuan 3.',
      kategori: 'Tugas',
      email: 'mahasiswa@gmail.com',
      dibuatPada: DateTime.now(),
    ),
  ];

  // Tugas 2: state untuk filter kategori
  String _filterKategori = 'Semua';
  final _kategoriOpsi = const ['Semua', 'Kuliah', 'Tugas', 'Pribadi', 'Lainnya'];

  // Tugas 2: getter list yang sudah difilter
  List<Catatan> get _catatanTerfilter {
    if (_filterKategori == 'Semua') return _catatan;
    return _catatan.where((c) => c.kategori == _filterKategori).toList();
  }

  String _formatTanggal(DateTime dt) {
    const bulan = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return '${dt.day} ${bulan[dt.month]} ${dt.year}';
  }

  // Navigasi ke halaman tambah (mode Tambah)
  Future<void> _bukaTambahCatatan() async {
    final hasil = await Navigator.pushNamed(context, '/tambah');

    if (hasil is Catatan) {
      setState(() => _catatan.add(hasil));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Catatan "${hasil.judul}" ditambahkan')),
      );
    }
  }

  // Tugas 1: Navigasi ke halaman tambah (mode Edit), update item yang ada
  Future<void> _bukaEditCatatan(Catatan catatanLama) async {
    final hasil = await Navigator.pushNamed(
      context,
      '/tambah',
      arguments: catatanLama, // kirim data lama → form pre-filled
    );

    if (hasil is Catatan) {
      setState(() {
        final index = _catatan.indexOf(catatanLama);
        if (index != -1) _catatan[index] = hasil; // update, bukan add
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Catatan "${hasil.judul}" diperbarui')),
      );
    }
  }

  void _hapusCatatan(Catatan c) {
    setState(() => _catatan.remove(c));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Catatan "${c.judul}" dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tampil = _catatanTerfilter;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Mahasiswa'),
        // Tugas 2: Dropdown filter kategori di AppBar
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DropdownButton<String>(
              value: _filterKategori,
              underline: const SizedBox(),
              dropdownColor: const Color(0xFF42A5F5),
              style: const TextStyle(color: Colors.white, fontSize: 14),
              icon: const Icon(Icons.filter_list, color: Colors.white),
              items: _kategoriOpsi
                  .map((k) => DropdownMenuItem(
                value: k,
                child: Text(
                  k,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _filterKategori = v!),
            ),
          ),
        ],
      ),
      body: tampil.isEmpty
          ? _EmptyState(
        isFiltered: _filterKategori != 'Semua',
        kategori: _filterKategori,
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: tampil.length,
        itemBuilder: (context, i) {
          final c = tampil[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: ListTile(
              title: Text(
                c.judul,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${c.kategori} • ${_formatTanggal(c.dibuatPada)}'),
              leading: CircleAvatar(
                child: Text(c.judul[0].toUpperCase()),
              ),
              // Tugas 1: trailing row dengan tombol edit & hapus
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF42A5F5)),
                    tooltip: 'Edit catatan',
                    onPressed: () => _bukaEditCatatan(c),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    tooltip: 'Hapus catatan',
                    onPressed: () => _hapusCatatan(c),
                  ),
                ],
              ),
              onTap: () async {
                // Tangkap hasil dari Detail (bisa berisi Catatan yang sudah diedit)
                final hasil = await Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: c,
                );
                if (hasil is Catatan) {
                  setState(() {
                    final index = _catatan.indexOf(c);
                    if (index != -1) _catatan[index] = hasil;
                  });
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Catatan "${hasil.judul}" diperbarui')),
                  );
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahCatatan,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ============================================================
// EMPTY STATE WIDGET
// ============================================================
class _EmptyState extends StatelessWidget {
  final bool isFiltered;
  final String kategori;

  const _EmptyState({this.isFiltered = false, this.kategori = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notes_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            isFiltered
                ? 'Tidak ada catatan\nkategori "$kategori"'
                : 'Belum ada catatan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isFiltered
                ? 'Coba pilih kategori lain atau tambah catatan baru'
                : 'Tap tombol Tambah untuk membuat catatan baru',
            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TAMBAH / EDIT CATATAN PAGE  (Tugas 1: di-reuse untuk Edit)
// ============================================================
class TambahCatatanPage extends StatefulWidget {
  // Tugas 1: parameter opsional; null = mode Tambah, ada isi = mode Edit
  final Catatan? catatanLama;

  const TambahCatatanPage({super.key, this.catatanLama});

  @override
  State<TambahCatatanPage> createState() => _TambahCatatanPageState();
}

class _TambahCatatanPageState extends State<TambahCatatanPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _judulCtrl;
  late final TextEditingController _isiCtrl;
  late final TextEditingController _emailCtrl; // Tugas 3

  late String _kategori;
  final _kategoriOpsi = const ['Kuliah', 'Tugas', 'Pribadi', 'Lainnya'];

  // Tugas 1: deteksi mode Edit atau Tambah
  bool get _isEditMode => widget.catatanLama != null;

  @override
  void initState() {
    super.initState();
    // Tugas 1: pre-fill controller dengan data lama kalau mode Edit
    final lama = widget.catatanLama;
    _judulCtrl = TextEditingController(text: lama?.judul ?? '');
    _isiCtrl = TextEditingController(text: lama?.isi ?? '');
    _emailCtrl = TextEditingController(text: lama?.email ?? '');
    _kategori = lama?.kategori ?? 'Kuliah';
  }

  @override
  void dispose() {
    _judulCtrl.dispose();
    _isiCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) return;

    final hasil = Catatan(
      judul: _judulCtrl.text.trim(),
      isi: _isiCtrl.text.trim(),
      kategori: _kategori,
      email: _emailCtrl.text.trim(),
      // Tugas 1: kalau edit, pertahankan tanggal asli; kalau tambah, pakai now
      dibuatPada: widget.catatanLama?.dibuatPada ?? DateTime.now(),
    );

    Navigator.pop(context, hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tugas 1: judul AppBar berubah sesuai mode
        title: Text(_isEditMode ? 'Edit Catatan' : 'Tambah Catatan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // --- Field Judul ---
            TextFormField(
              controller: _judulCtrl,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Judul',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Judul wajib diisi';
                if (v.trim().length < 3) return 'Minimal 3 karakter';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // --- Dropdown Kategori ---
            DropdownButtonFormField<String>(
              value: _kategori,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),
              items: _kategoriOpsi
                  .map((k) => DropdownMenuItem(value: k, child: Text(k)))
                  .toList(),
              onChanged: (v) => setState(() => _kategori = v!),
            ),
            const SizedBox(height: 16),

            // Tugas 3: Field Email dengan validasi regex (di bawah Kategori)
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Pengirim',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                hintText: 'contoh@gmail.com',
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(v.trim())) {
                  return 'Format email tidak valid (contoh: nama@gmail.com)';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // --- Field Isi ---
            TextFormField(
              controller: _isiCtrl,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Isi',
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Isi wajib diisi' : null,
            ),
            const SizedBox(height: 24),

            // --- Tombol Simpan ---
            FilledButton.icon(
              onPressed: _simpan,
              icon: Icon(_isEditMode ? Icons.update : Icons.save),
              label: Text(_isEditMode ? 'Simpan Perubahan' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DETAIL CATATAN PAGE
// ============================================================
class DetailCatatanPage extends StatelessWidget {
  final Catatan catatan;
  const DetailCatatanPage({super.key, required this.catatan});

  String _formatTanggal(DateTime dt) {
    const bulan = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${dt.day} ${bulan[dt.month]} ${dt.year}, '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
        // Tugas 1: tombol Edit di AppBar halaman Detail
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit catatan',
            onPressed: () async {
              // Pop dulu ke Home, lalu Home yang handle edit
              // Cara lebih elegan: langsung push edit dari sini
              final hasil = await Navigator.pushNamed(
                context,
                '/tambah',
                arguments: catatan,
              );
              if (hasil is Catatan && context.mounted) {
                // Kirim hasil edit ke Home melalui pop dengan data baru
                Navigator.pop(context, hasil);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul besar
            Text(
              catatan.judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Chip kategori
            Chip(
              avatar: const Icon(Icons.label_outline, size: 16),
              label: Text(catatan.kategori),
            ),
            const SizedBox(height: 4),

            // Tanggal
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  _formatTanggal(catatan.dibuatPada),
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Tugas 3: tampilkan email di halaman detail
            Row(
              children: [
                const Icon(Icons.email_outlined, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  catatan.email,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),

            const Divider(height: 32),

            // Isi lengkap
            Text(
              catatan.isi,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),

            const SizedBox(height: 32),

            // Tombol kembali
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
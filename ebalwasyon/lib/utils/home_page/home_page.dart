import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebalwasyon ng Payong Teknikal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 7, 13, 22),
          surface: Colors.white,
        ),
      ),
      home: const EbalwasyonForm(),
    );
  }
}

class EbalwasyonForm extends StatefulWidget {
  const EbalwasyonForm({super.key});

  @override
  State<EbalwasyonForm> createState() => _EbalwasyonFormState();
}

class _EbalwasyonFormState extends State<EbalwasyonForm> {
  int? _a1Rating;
  int? _a2Rating;
  int? _a3Rating;

  int? _b1Rating;
  int? _b2Rating;
  int? _b3Rating;

  final TextEditingController _ebalwasyonController = TextEditingController();
  final TextEditingController _pangalanController = TextEditingController();

  @override
  void dispose() {
    _ebalwasyonController.dispose();
    _pangalanController.dispose();
    super.dispose();
  }

  Widget _buildRatingRow({
    required String label,
    required int? selectedRating,
    required ValueChanged<int> onRatingSelected,
    bool multiline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment:
            multiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF333333),
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              final rating = index + 1;
              final isSelected = selectedRating == rating;
              return GestureDetector(
                onTap: () => onRatingSelected(rating),
                child: Container(
                  width: 28,
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color.fromARGB(255, 16, 19, 26)
                        : Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 22, 32, 53),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$rating',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Colors.white
                            : const Color.fromARGB(255, 19, 26, 41),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 23, 33, 48),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color(0xFFDDDDDD),
      thickness: 1,
      height: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ── Header ──────────────────────────────────────────────
              SizedBox(
                height: 110,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/wpu_campus.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFFD6E4F0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white.withOpacity(0.92),
                            Colors.white.withOpacity(0.50),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 16, left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/wpu_logo.jpg',
                              height: 64,
                              width: 64,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.grey.shade300),
                                ),
                                child: const Icon(Icons.account_balance,
                                    color: Color.fromARGB(255, 19, 25, 34),
                                    size: 32),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Republic of the Philippines',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black87),
                                ),
                                Text(
                                  'Western Philippines University',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1A3A6B),
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ── Main Card ───────────────────────────────────────────
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form Title
                    const Center(
                      child: Text(
                        'EBALWASYON NG PAYONG TEKNIKAL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 69, 109, 184),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Section I Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 20, 30, 44),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'I. PAGPILI NG MARKA (Select Rating)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      'LAGYAN NG MARKA (PAG-TAP) ANG MGA SUMUSUNOD AYON SA INYONG EBALWASYON.',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF555555),
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Section A
                    _buildSectionTitle(
                        'A. Kalidad ng Payong Teknikal (Quality)'),
                    _buildDivider(),

                    _buildRatingRow(
                      label: '1. Kakayahan ng eksperto (Expert)',
                      selectedRating: _a1Rating,
                      onRatingSelected: (r) => setState(() => _a1Rating = r),
                    ),
                    _buildDivider(),

                    _buildRatingRow(
                      label: '2. Pakikinig-ugnayan ng eksperto\n   (Expert)',
                      selectedRating: _a2Rating,
                      onRatingSelected: (r) => setState(() => _a2Rating = r),
                      multiline: true,
                    ),
                    _buildDivider(),

                    _buildRatingRow(
                      label:
                          '3. Pangkalahatang kalidad ng\n   payong teknikal',
                      selectedRating: _a3Rating,
                      onRatingSelected: (r) => setState(() => _a3Rating = r),
                      multiline: true,
                    ),

                    const SizedBox(height: 10),

                    // Section B
                    _buildSectionTitle(
                        'B. Pagpapahalaga sa Oras (Timeliness)'),
                    _buildDivider(),

                    _buildRatingRow(
                      label:
                          '1. Bilis ng pagbibigay ng aksyon sa\n   kailangan para sa payong teknikal',
                      selectedRating: _b1Rating,
                      onRatingSelected: (r) => setState(() => _b1Rating = r),
                      multiline: true,
                    ),
                    _buildDivider(),

                    _buildRatingRow(
                      label:
                          '2. Sapat at haba ng inilang oras an\n   sanya kaalaman na dapat\n   matutaran',
                      selectedRating: _b2Rating,
                      onRatingSelected: (r) => setState(() => _b2Rating = r),
                      multiline: true,
                    ),
                    _buildDivider(),

                    _buildRatingRow(
                      label:
                          '3. Pangkalahatang ng obser-ba na\n   na pagpapahalaga sa oras',
                      selectedRating: _b3Rating,
                      onRatingSelected: (r) => setState(() => _b3Rating = r),
                      multiline: true,
                    ),

                    const SizedBox(height: 16),

                    // Section II Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 22, 30, 39),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'II. ILAGAY ANG INYONG PANGKATAHATANG\nEBALWASYON SA PAYONG TEKNIKAL NA ITO',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Pangkatahatang Ebalwasyon',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ✅ Fixed: focusedBorder removed double border on tap
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color(0xFFAAAAAA), width: 1),
                      ),
                      child: TextField(
                        controller: _ebalwasyonController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF222222),
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Pangalan ng Nagtasa(opsyonal)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ✅ Fixed: focusedBorder removed double border on tap
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color(0xFFAAAAAA), width: 1),
                      ),
                      child: TextField(
                        controller: _pangalanController,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF222222),
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Submit Button ───────────────────────────────────────
              Padding(
                padding:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Evaluation submitted successfully!'),
                          backgroundColor: Color.fromARGB(255, 12, 19, 29),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 21, 34),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'SUBMIT EVALUATION',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
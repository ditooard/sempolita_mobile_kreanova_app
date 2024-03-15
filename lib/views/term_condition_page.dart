import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  @override
  State<TermsConditions> createState() => _TermsConditions();
}

class _TermsConditions extends State<TermsConditions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    double tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: lebarLayar,
          height: tinggiLayar,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 37,
                top: 100,
                child: Container(
                  width: 320,
                  height: 600,
                  child: SizedBox(
                    width: 307,
                    height: 1166,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Syarat dan Ketentuan Penggunaan Aplikasi "Sistem Monitoring Balita Posyandu"'
                        '\n\nDengan menggunakan aplikasi "Sistem Monitoring Balita Posyandu" ("Aplikasi"), Anda setuju untuk terikat oleh syarat dan ketentuan berikut ini. Jika Anda tidak setuju dengan syarat dan ketentuan ini, mohon untuk tidak menggunakan Aplikasi.'
                        '\n\n1. Penggunaan Aplikasi'
                        '\n\n1.1. Aplikasi ini bertujuan untuk membantu pemantauan kesehatan balita di Posyandu.'
                        '\n\n1.2. Penggunaan Aplikasi harus sesuai dengan hukum yang berlaku dan tidak boleh melanggar hak pihak ketiga.'
                        '\n\n1.3. Penggunaan Aplikasi tidak boleh digunakan untuk tujuan yang melanggar hukum atau merugikan pihak lain.'
                        '\n\n2. Informasi Pribadi dan Keamanan'
                        '\n\n2.1. Kami menghargai privasi pengguna. Informasi pribadi yang diberikan oleh pengguna akan dijaga kerahasiaannya sesuai dengan Kebijakan Privasi yang berlaku.'
                        '\n\n2.2. Pengguna bertanggung jawab atas keamanan informasi pribadi yang diberikan, termasuk username dan password.'
                        '\n\n3. Ketergantungan dan Responsabilitas'
                        '\n\n3.1. Penggunaan Aplikasi sepenuhnya menjadi tanggung jawab pengguna.'
                        '\n\n3.2. Kami tidak bertanggung jawab atas kerugian atau kerusakan yang disebabkan oleh penggunaan Aplikasi, termasuk tetapi tidak terbatas pada kehilangan data atau ketidaktersediaan layanan.'
                        '\n\n4. Pembaruan dan Perubahan'
                        '\n\n4.1. Kami berhak untuk melakukan pembaruan atau perubahan pada Aplikasi tanpa pemberitahuan sebelumnya.'
                        '\n\n4.2. Pengguna diharapkan untuk memeriksa pembaruan Aplikasi secara berkala.'
                        '\n\n5. Pembatasan dan Hak Kekayaan Intelektual'
                        '\n\n5.1. Pengguna dilarang melakukan tindakan yang melanggar hak kekayaan intelektual terkait Aplikasi.'
                        '\n\n5.2. Hak kekayaan intelektual atas Aplikasi, termasuk tetapi tidak terbatas pada hak cipta, tetap menjadi milik kami.'
                        '\n\n6. Pembatalan dan Penghentian Layanan'
                        '\n\n6.1. Kami berhak untuk membatalkan atau menghentikan layanan Aplikasi tanpa pemberitahuan jika ditemukan pelanggaran terhadap syarat dan ketentuan ini.'
                        '\n\n6.2. Pengguna dapat menghentikan penggunaan Aplikasi kapan saja dengan menghapus Aplikasi dari perangkat mereka.'
                        '\n\n7. Perubahan pada Syarat dan Ketentuan'
                        '\n\n7.1. Kami berhak untuk mengubah syarat dan ketentuan ini setiap saat.'
                        '\n\n7.2. Perubahan tersebut akan efektif setelah diberitahukan kepada pengguna melalui pembaruan Aplikasi atau pemberitahuan lainnya.'
                        '\n\nDengan menggunakan Aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan ini. Syarat dan ketentuan ini dapat berubah sewaktu-waktu, dan pengguna disarankan untuk membacanya secara berkala.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.2800000011920929),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 25,
                child: Container(
                  width: 393,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 48,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/login');
                                          },
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
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
                      const SizedBox(width: 12),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedung/app/routes/app_pages.dart';
import 'package:tedung/app/theme/color.dart';
import 'package:tedung/app/widgets/card_article.dart';

import '../controllers/home_content_controller.dart';

class HomeContentView extends GetView<HomeContentController> {
  const HomeContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pengaduan",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: Divider(
                    height: 5,
                    color: Color(ColorTheme.PRIMARY_600),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(
                        ColorTheme.PRIMARY_200,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Sistem ini mempermudah karyawan melaporkan bullying secara rahasia, aman, dan terpantau.",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_COMPLAINT);
                        },
                        icon: Icon(Icons.add),
                        label: Text(
                          "Tambah Pengaduan",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(
                            Color(ColorTheme.PRIMARY_800),
                          ),
                          iconColor: WidgetStatePropertyAll(
                            Color(ColorTheme.PRIMARY_800),
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Artikel",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                CardArticle(
                  onTap: () {
                    Get.toNamed(Routes.ARTICLE_DETAIL, parameters: {
                      "article_image":
                          "https://images.hukumonline.com/frontend/lt5da91547d777f/lt5de4c3ac71063.jpg",
                      "article_title":
                          "Perlindungan Hukum bagi Karyawan dari Bullying di Tempat Kerja",
                      "article_content":
                          "Apa yang dimaksud dengan perundungan? Perlu diketahui terlebih dahulu bahwa perundungan atau bullying berasal dari kata merundung yang dalam KBBI berarti menyakiti orang lain, baik secara fisik maupun psikis, dalam bentuk kekerasan verbal, sosial, atau fisik berulang kali dan dari waktu ke waktu, seperti memanggil nama seseorang dengan julukan yang tidak disukai, memukul, mendorong, menyebarkan rumor, mengancam, atau merongrong. Selain itu, bullying juga dapat didefinisikan sebagai perilaku agresif dan menekan, baik dalam bentuk tindakan fisik secara langsung atau menyerang melalui perkataan.[1] Bentuk-bentuk dari bullying ini berubah seiring berjalannya usia seseorang. Mulai dari bullying di taman bermain (playground bullying), kekerasan seksual, penyerangan secara berkelompok, dating violence, marital violence, child abuse, bullying di tempat kerja (workplace bullying), dan berbagai jenis kekerasan lain.[2] Adapun bentuk bullying yang terjadi pada idol K-Pop pada pertanyaan Anda termasuk ke dalam perundungan di tempat kerja (workplace bullying). Menurut Nurul Hidayati dan Idha Rahayuningsih dalam jurnal yang berjudul Bentuk dan Dampak Kekerasan di Tempat Kerja (Workplace Bullying) pada Buruh Pabrik di Gresik (hal. 126) yang mengutip Matthiensen, mengartikan workplace bullying sebagai tindakan negatif yang dilakukan di tempat kerja secara berulang-ulang oleh pihak-pihak tertentu yang melibatkan ketidakseimbangan kekuasaan, dan dapat berbentuk pelecehan, kekerasan, dan perbuatan yang tidak menyenangkan yang mengakibatkan korban bullying merasa inferior dan tidak mampu membela diri mereka.",
                    });
                  },
                  image:
                      "https://images.hukumonline.com/frontend/lt5da91547d777f/lt5de4c3ac71063.jpg",
                  title:
                      "Perlindungan Hukum bagi Karyawan dari Bullying di Tempat Kerja",
                  description:
                      "Apa yang dimaksud dengan perundungan? Perlu diketahui terlebih dahulu bahwa perundungan atau bullying berasal dari kata merundung yang dalam KBBI berarti menyakiti orang lain, baik secara fisik maupun psikis, dalam bentuk kekerasan verbal, sosial, atau fisik berulang kali dan dari waktu ke waktu, seperti memanggil nama seseorang dengan julukan yang tidak disukai, memukul, mendorong, menyebarkan rumor, mengancam, atau merongrong.",
                ),
                SizedBox(
                  height: 8,
                ),
                CardArticle(
                  onTap: () {
                    Get.toNamed(Routes.ARTICLE_DETAIL, parameters: {
                      "article_image":
                          "https://wartapemeriksa.bpk.go.id/wp-content/uploads/2023/04/bully.jpg",
                      "article_title":
                          "WASPADAI PERUNDUNGAN DI TEMPAT KERJA: DARI SINDIRAN HALUS HINGGA INTIMIDASI DIGITAL",
                      "article_content":
                          """Perundungan di tempat kerja telah menjadi momok yang mengancam kesehatan mental dan produktivitas karyawan. Fenomena ini tidak hanya terjadi dalam bentuk kekerasan fisik yang kasat mata, tetapi juga melalui berbagai bentuk perilaku yang lebih halus dan terselubung.

"Banyak karyawan tidak menyadari bahwa mereka sedang mengalami perundungan karena perilaku tersebut sering dinormalisasi atau dianggap sebagai bagian dari budaya kerja," ungkap Dr. Sarah Nielsen, peneliti senior bidang psikologi organisasi dari University of Bergen, dalam sebuah studi yang dipublikasikan di Work & Stress tahun 2021.

Bentuk perundungan yang paling umum adalah perundungan verbal, seperti sindiran halus dalam rapat, kritik yang tidak konstruktif, atau gosip yang merusak reputasi. Seorang karyawan bernama Maya (bukan nama sebenarnya) berbagi pengalamannya: "Awalnya saya pikir itu hanya bercanda, tapi lama-kelamaan sindiran itu semakin menyakitkan dan mempengaruhi kepercayaan diri saya dalam bekerja."

Di era digital, perundungan juga telah berevolusi ke platform online. Pengucilan dari grup chat penting, penyebaran tangkapan layar percakapan pribadi, hingga komentar merendahkan di platform kerja digital menjadi bentuk baru intimidasi yang perlu diwaspadai.

Professor Ståle Einarsen dari University of Bergen menekankan pentingnya sistem pencegahan yang komprehensif. "Organisasi perlu membangun mekanisme pelaporan yang aman dan menjamin perlindungan bagi pelapor. Tanpa sistem yang memadai, banyak kasus akan tetap tidak terungkap," jelasnya dalam artikel yang diterbitkan International Journal of Environmental Research and Public Health.

Dampak perundungan tidak bisa dianggap remeh. Studi menunjukkan bahwa korban dapat mengalami gangguan kesehatan mental, stres berkepanjangan, hingga penurunan produktivitas yang signifikan. Lebih mengkhawatirkan lagi, banyak korban memilih mengundurkan diri daripada melaporkan kejadian yang dialami.

Lantas, apa yang bisa dilakukan? Dr. Nielsen menyarankan agar karyawan mulai mendokumentasikan setiap kejadian yang mencurigakan. "Simpan bukti komunikasi, catat tanggal dan waktu kejadian, serta laporkan ke atasan atau HR jika situasi semakin memburuk," tegasnya.

Dari sisi organisasi, implementasi kebijakan anti-perundungan yang jelas dan tegas menjadi kunci. Pelatihan kesadaran anti-perundungan bagi seluruh karyawan, termasuk jajaran manajemen, juga diperlukan untuk menciptakan lingkungan kerja yang sehat dan saling menghargai.

"Yang terpenting adalah membangun budaya kerja yang tidak mentolerir segala bentuk perundungan," tutup Dr. Nielsen. "Setiap orang berhak merasa aman dan dihargai di tempat kerjanya."

Untuk informasi lebih lanjut tentang pencegahan dan penanganan perundungan di tempat kerja, karyawan dapat menghubungi departemen HR atau mencari bantuan profesional melalui layanan konseling yang disediakan perusahaan.
""",
                    });
                  },
                  image:
                      "https://wartapemeriksa.bpk.go.id/wp-content/uploads/2023/04/bully.jpg",
                  title:
                      "WASPADAI PERUNDUNGAN DI TEMPAT KERJA: DARI SINDIRAN HALUS HINGGA INTIMIDASI DIGITAL",
                  description:
                      "Perundungan di tempat kerja telah menjadi momok yang mengancam kesehatan mental dan produktivitas karyawan. Fenomena ini tidak hanya terjadi dalam bentuk kekerasan fisik yang kasat mata, tetapi juga melalui berbagai bentuk perilaku yang lebih halus dan terselubung.",
                ),
                SizedBox(
                  height: 8,
                ),
                CardArticle(
                  onTap: () {
                    Get.toNamed(Routes.ARTICLE_DETAIL, parameters: {
                      "article_image":
                          "https://lh4.googleusercontent.com/CrNaJcpm5EGNa-ox3GBMqTZoKd9_rc1GDIA5TVdd6uKuZPc6V3t7IZKOi90kA_EimE7A7dAquYXverSjmL_BVdtVymN0ZiqWthw5VZ31iFXcwZmVcAFs_h3neoUnKJ4ki-kUvQPq_qAS5ANhgEVRxdE",
                      "article_title":
                          "TIPS MENGHADAPI PERUNDUNGAN DI TEMPAT KERJA: KENALI, DOKUMENTASIKAN, DAN AMBIL TINDAKAN",
                      "article_content":
                          """Perundungan di tempat kerja bukan hanya mengganggu kenyamanan, tetapi juga dapat berdampak serius pada kesehatan mental dan produktivitas. Menghadapi situasi ini membutuhkan strategi yang tepat dan dukungan yang memadai. Berikut adalah panduan praktis untuk menghadapi perundungan di tempat kerja.

Kenali Tanda-tanda Perundungan
"Langkah pertama dalam mengatasi perundungan adalah mengenali bahwa itu sedang terjadi," ujar Dr. Helen Nielsen, peneliti senior bidang psikologi kerja dari University of Copenhagen, dalam jurnal Work & Stress (2021). Beberapa tanda yang perlu diwaspadai termasuk kritik berlebihan, pengucilan sosial, pemberian tugas yang tidak masuk akal, atau intimidasi digital.

Dokumentasikan Setiap Kejadian
Profesor Michael West dari King's College London menekankan pentingnya dokumentasi dalam artikel yang dipublikasikan di Journal of Occupational Health Psychology (2022). "Catat setiap kejadian secara detail, termasuk tanggal, waktu, lokasi, dan saksi yang hadir. Simpan bukti komunikasi seperti email, pesan, atau tangkapan layar. Dokumentasi yang baik sangat penting jika kasus perlu dibawa ke tingkat yang lebih tinggi," jelasnya.

Langkah-langkah Menghadapi Perundungan:
1.	Jaga Profesionalisme
•	Tetap tenang dan profesional dalam merespons
•	Fokus pada pekerjaan dan kualitas kerja
•	Hindari konfrontasi emosional
2.	Bangun Sistem Pendukung
•	Cari dukungan dari rekan kerja terpercaya
•	Diskusikan situasi dengan keluarga atau teman
•	Pertimbangkan konsultasi dengan profesional kesehatan mental
3.	Manfaatkan Jalur Formal
•	Pelajari kebijakan anti-perundungan perusahaan
•	Laporkan ke HR atau atasan yang berwenang
•	Ikuti prosedur pelaporan yang ditetapkan
4.	Jaga Kesehatan Mental "Kesehatan mental harus menjadi prioritas saat menghadapi perundungan," tegas Dr. Sarah Thompson dalam Workplace Health & Safety (2021). Beberapa tips yang disarankan:
•	Praktikkan teknik manajemen stres
•	Jaga keseimbangan hidup-kerja
•	Tetap terhubung dengan jaringan pendukung
5.	Pertimbangkan Opsi Hukum Jika perundungan berlanjut dan perusahaan tidak mengambil tindakan memadai, pertimbangkan untuk:
•	Konsultasi dengan ahli hukum ketenagakerjaan
•	Dokumentasikan semua upaya yang telah dilakukan
•	Kenali hak-hak hukum Anda sebagai karyawan

Pencegahan dan Pemulihan
Dr. Thompson juga menekankan pentingnya langkah pencegahan dan pemulihan:
•	Tetapkan batasan yang jelas dalam interaksi profesional
•	Bangun kepercayaan diri dan assertivitas
•	Ikuti pelatihan pengembangan diri
•	Cari dukungan profesional jika diperlukan

Sumber bantuan tersedia melalui
•	Departemen HR perusahaan
•	Layanan konseling karyawan
•	Hotline bantuan kesehatan mental
•	Organisasi pendampingan korban perundungan


                          """,
                    });
                  },
                  image:
                      "https://lh4.googleusercontent.com/CrNaJcpm5EGNa-ox3GBMqTZoKd9_rc1GDIA5TVdd6uKuZPc6V3t7IZKOi90kA_EimE7A7dAquYXverSjmL_BVdtVymN0ZiqWthw5VZ31iFXcwZmVcAFs_h3neoUnKJ4ki-kUvQPq_qAS5ANhgEVRxdE",
                  title:
                      "TIPS MENGHADAPI PERUNDUNGAN DI TEMPAT KERJA: KENALI, DOKUMENTASIKAN, DAN AMBIL TINDAKAN",
                  description:
                      "Perundungan di tempat kerja bukan hanya mengganggu kenyamanan, tetapi juga dapat berdampak serius pada kesehatan mental dan produktivitas. Menghadapi situasi ini membutuhkan strategi yang tepat dan dukungan yang memadai. Berikut adalah panduan praktis untuk menghadapi perundungan di tempat kerja.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

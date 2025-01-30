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
                      "article_source":
                          "https://www.hukumonline.com/klinik/a/perlindungan-karyawan-dari-ancaman-iharassment-i-lt5da91547d777f/"
                    });
                  },
                  image:
                      "https://images.hukumonline.com/frontend/lt5da91547d777f/lt5de4c3ac71063.jpg",
                  title:
                      "Perlindungan Hukum bagi Karyawan dari Bullying di Tempat Kerja",
                  description:
                      "Apa yang dimaksud dengan perundungan? Perlu diketahui terlebih dahulu bahwa perundungan atau bullying berasal dari kata merundung yang dalam KBBI berarti menyakiti orang lain, baik secara fisik maupun psikis, dalam bentuk kekerasan verbal, sosial, atau fisik berulang kali dan dari waktu ke waktu, seperti memanggil nama seseorang dengan julukan yang tidak disukai, memukul, mendorong, menyebarkan rumor, mengancam, atau merongrong.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

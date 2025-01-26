import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  const ArticleDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Perlindungan Hukum bagi Karyawan dari Bullying di Tempat Kerja",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Image.network(
                  controller.image,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Sumber : ${controller.image}",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  controller.content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

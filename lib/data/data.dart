import 'package:flutter/material.dart';
import 'package:spending_app/models/tutorial_model.dart';

import '../enum/category_type.dart';
import '../models/category_model.dart';

final List<String> categoryTypeList = [
  getCategoryTypeString(CategoryType.primer),
  getCategoryTypeString(CategoryType.sekunder),
  getCategoryTypeString(CategoryType.tersier),
];

final List<CategoryModel> expenseCategoryList = [
  CategoryModel(
    title: "Primer",
    color: Colors.blue.shade400,
    description:
        "Kebutuhan primer yaitu kebutuhan pokok yang mutlak dipenuhi oleh semua manusia yaitu pakaian, makanan, dan tempat tinggal. Kebutuhan primer ini merupakan hal yang paling penting untuk dipenuhi guna melanjutkan keberlangsungan hidup.",
  ),
  CategoryModel(
    title: "Sekunder",
    color: Colors.orange.shade400,
    description:
        "Kebutuhan sekunder merupakan pelengkap agar dapat menjalankan kehidupan yang lebih baik. Gaya hidup manusia merupakan salah satu hal kebutuhan sekunder.",
  ),
  CategoryModel(
    title: "Tersier",
    color: Colors.red.shade400,
    description:
        "Kebutuhan tersier merupakan kebutuhan yang sering sebagian orang disebut kebutuhan akan sesuatu yang bersifat mewah. Tujuan dari pemenuhan kebutuhan tersier ialah untuk kesenangan pribadi.",
  ),
];

final List<TutorialModel> tutorialList = [
  TutorialModel(
    title: "Menambahkan Pengeluaran",
    subtitle: "Buka halaman utama/Spending App, kemudian tekan tombol plus.",
    color: Colors.blue.shade400,
  ),
  TutorialModel(
    title: "Mengedit Pengeluaran",
    subtitle:
        "Buka halaman utama/Spending App, kemudian tap/tekan pengeluaran yang akan diedit.",
    color: Colors.orange.shade400,
  ),
  TutorialModel(
    title: "Menghapus Pengeluaran",
    subtitle:
        "Buka halaman utama/Spending App, kemudian long press pada pengeluaran yang akan dihapus.",
    color: Colors.red.shade400,
  ),
];

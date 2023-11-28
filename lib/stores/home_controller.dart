import 'package:dio/dio.dart';
import 'package:universal_app/config/Import.dart';
import 'package:universal_app/pages/PrayerTime.dart';

class HomeContoller extends GetxController {
  //https://cbu.uz/ru/arkhiv-kursov-valyut/json/
  Dio http = Dio();

  List currensies = []; // korobkacha ochib quydik

  bool loading = false;

  // Metodlar
  //! get bu becceddan ma'lumotlarni olib kelishda ishlatiladi
  //! post bu metod backendga ma'lumotlarni junatadi
  //! put bu metod backendagi ma'lumotni tahrirlab beradi
  //! delete bu metod backendagi ma'lumotlarni o'chirib beradi

  fetchCurrensies() async {
    try {
      loading = true;
      update();
      // await Future.delayed(Duration(seconds: 5));
      var res = await http.get('https://cbu.uz/ru/arkhiv-kursov-valyut/json/');
      currensies = res.data;
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  List<String> cities = [
    "Toshkent",
    "Farg'ona",
    "Andijon",
    "Namangan",
    "Guliston",
    "Jizzax",
    "Samarqand",
    "Buxoro",
    "Qarshi",
    "Nukus",
    "Navoiy",
    "Xiva"
  ];

  Map<String, dynamic> prayerTime =
      {}; // Map bu obye'kt Ikkita xusiyat berilyapti String = kaliti va dynamic = qiymati
  String selectCity = '';
  fetchPrayerTimes() async {
    try {
      loading = true;
      update();
      var res = await http.get(
          "https://islomapi.uz/api/present/day?region=$selectCity"); // await da ma'lumot kelib kutib turadi, agar kelmasa errorga berib yuboriladi.
      prayerTime = res.data;
      Get.to(
          () => const PrayerTime()); // Shu page ga o'tish ya'ni Prayer timega
    } catch (err) {
      Get.snackbar("Xatolik", "Ma'lumot topilmadi");
    } finally {
      loading = false;
      update();
    }
  }
}

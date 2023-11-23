import 'package:dio/dio.dart';
import 'package:universal_app/config/Import.dart';

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
}

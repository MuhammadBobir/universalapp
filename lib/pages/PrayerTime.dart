import 'package:universal_app/config/Import.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeContoller controller = Get.put(HomeContoller());

  List times =
      []; // times bu bo'sh massiv yaratilgani, qiymatlarni o'zlashtirvolish uchun
  // bu funksiya obyektni listga aylantirib beradi
  filterTime(data) {
    data.forEach((key, value) {
      // forEach obyekt ichini aylanib chiqish
      times.add({"vaqt": key, "soat": value});
    });
  }

  // page ishga tushishi bilan ishlatib yuboradi
  @override
  void initState() {
    filterTime(controller.prayerTime["times"]);
    super.initState();
  }

  // bu funksiya filter qilib beradi ya'ni textni o'zgartirib beradi
  /*
  String filterText(String key) {
    switch (key) {
      case "tong_saharlik":
        return ("Bomdod namozi");
      case "quyosh":
        return ("Quyosh");
      case "peshin":
        return ("Peshin namozi");
      case "asr":
        return ("Asr namozi");
      case "shom_iftor":
        return ("Shom namozi");
      case "hufton":
        return ("Hufton namozi");
      default:
        return "";
    }
  } */

  Map<String, dynamic> keys = {
    "tong_saharlik": "Bomdod namozi",
    "quyosh": "Quyosh",
    "peshin": "Peshin namozi",
    "asr": "Asr namozi",
    "shom_iftor": "Shom namozi",
    "hufton": "Hufton namozi",
  };
  filterText(String key) {
    return keys[key] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${controller.selectCity} vaqti bilan"), // String stringga o'shishdaham plus ishlatilrovladi
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.prayerTime["date"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                Text(controller.prayerTime["weekday"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            const Divider(),
            Column(
              children: List.generate(times.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filterText(times[index]["vaqt"]),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        times[index]["soat"],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

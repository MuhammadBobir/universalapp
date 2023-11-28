import 'package:universal_app/config/Import.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  HomeContoller contoller = Get.put(HomeContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hududni tanlang")),
      body: Column(
        children: List.generate(contoller.cities.length, (index) {
          return ListTile(
            title: Text(contoller.cities[index]),
            leading: const Icon(Icons.location_city),
            trailing: const Icon(Icons.arrow_right, size: 30),
            onTap: () {
              contoller.selectCity = contoller.cities[index];
              contoller.fetchPrayerTimes();
            },
          );
        }),
      ),
    );
  }
}

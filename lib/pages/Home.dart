import 'package:universal_app/config/Import.dart';
import 'package:universal_app/pages/Currensies.dart';
import 'package:universal_app/stores/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeContoller contoller = Get.put(HomeContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Bobur Universal App",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                HomeButton(
                  icon: Icons.attach_money,
                  text: "Valyutalar kursi",
                  onTap: () {
                    contoller.fetchCurrensies();
                    Get.to(Currensies());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

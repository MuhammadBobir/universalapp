import 'package:universal_app/config/Import.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeContoller contoller = Get.put(HomeContoller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    "Hammasi bittada",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 24),
                  HomeButton(
                    icon: Icons.attach_money,
                    text: "Valyutalar kursi",
                    subtitle:
                        "Real vaqt davomida valyuta kurslaridan habardor bo'ling",
                    image: AppImages.money,
                    colors: [AppColors.violet, AppColors.pink],
                    textColor: Colors.white,
                    onTap: () {
                      contoller.fetchCurrensies();
                      Get.to(const Currensies());
                    },
                  ),
                  HomeButton(
                    icon: Icons.attach_money,
                    text: "Namoz vaqtlari",
                    subtitle: "Namoz vaqtlarini bilsh",
                    image: AppImages.money,
                    colors: [AppColors.blue, AppColors.red],
                    textColor: Colors.white,
                    onTap: () {
                      contoller.fetchCurrensies();
                      Get.to(const Currensies());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

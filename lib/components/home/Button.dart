import 'package:universal_app/config/Import.dart';

class HomeButton extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  HomeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(icon, size: 30),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(Icons.arrow_right_sharp, size: 40)
          ],
        ),
      ),
    );
  }
}

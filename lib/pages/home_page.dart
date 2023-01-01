import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik/controllers/home_controller.dart';
import 'package:komik/router/route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final homeCtrl = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    // homeCtrl.playAudio();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      homeCtrl.pauseAudio();
    }
    if (state == AppLifecycleState.resumed) {
      homeCtrl.resumeAudio();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Komik Digital Siap Nikah Anti Stunting"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "Pilih Komik",
                  style: TextStyle(fontSize: 22),
                )),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(4),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: homeCtrl.sizeWidth(context),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.view);
                  },
                  child: Card(
                      child: Column(
                    children: [
                      Image.network(
                        'https://www.cakrawalapersada.com/wp-content/uploads/2021/02/SIAP-NIKAH-1024x730.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "Genta dan Rare belajar hidup sehat ${currentWidth}",
                            style: const TextStyle(fontSize: 13),
                          ))
                    ],
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

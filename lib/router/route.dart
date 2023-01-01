import 'package:get/route_manager.dart';
import 'package:komik/bindings/home_binding.dart';
import 'package:komik/pages/home_page.dart';
import 'package:komik/pages/view_page.dart';

part 'app_router.dart';

class Routes {
  static List<GetPage>? getPages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.view,
      page: () => const ViewPage(),
    )
  ];
}

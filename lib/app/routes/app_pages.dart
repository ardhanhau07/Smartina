import 'package:get/get.dart';

import '../modules/alQuran/bindings/al_quran_binding.dart';
import '../modules/alQuran/views/al_quran_view.dart';
import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/community_view.dart';
import '../modules/destination/bindings/destination_binding.dart';
import '../modules/destination/views/destination_view.dart';
import '../modules/event/bindings/event_binding.dart';
import '../modules/event/views/event_view.dart';
import '../modules/foods/bindings/foods_binding.dart';
import '../modules/foods/views/foods_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel/bindings/hotel_binding.dart';
import '../modules/hotel/views/hotel_view.dart';
import '../modules/mountain/bindings/mountain_binding.dart';
import '../modules/mountain/views/mountain_view.dart';
import '../modules/pengaturanSholat/bindings/pengaturan_sholat_binding.dart';
import '../modules/pengaturanSholat/views/pengaturan_sholat_view.dart';
import '../modules/profileUser/bindings/profile_user_binding.dart';
import '../modules/profileUser/views/profile_user_view.dart';
import '../modules/qiblat/bindings/qiblat_binding.dart';
import '../modules/qiblat/views/qiblat_view.dart';
import '../modules/rootUser/bindings/root_user_binding.dart';
import '../modules/rootUser/views/root_user_view.dart';
import '../modules/sholat/bindings/sholat_binding.dart';
import '../modules/sholat/views/sholat_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';
import '../modules/transport/bindings/transport_binding.dart';
import '../modules/transport/views/transport_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ROOT_USER,
      page: () => const RootUserView(),
      binding: RootUserBinding(),
    ),
    GetPage(
      name: _Paths.SHOLAT,
      page: () => const SholatView(),
      binding: SholatBinding(),
    ),
    GetPage(
      name: _Paths.TRANSPORT,
      page: () => const TransportView(),
      binding: TransportBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL,
      page: () => const HotelView(),
      binding: HotelBinding(),
    ),
    GetPage(
      name: _Paths.FOODS,
      page: () => const FoodsView(),
      binding: FoodsBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATION,
      page: () => const DestinationView(),
      binding: DestinationBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const CommunityView(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.AL_QURAN,
      page: () => const AlQuranView(),
      binding: AlQuranBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.QIBLAT,
      page: () => const QiblatView(),
      binding: QiblatBinding(),
    ),
    GetPage(
      name: _Paths.MOUNTAIN,
      page: () => const MountainView(),
      binding: MountainBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN_SHOLAT,
      page: () => const PengaturanSholatView(),
      binding: PengaturanSholatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_USER,
      page: () => const ProfileUserView(),
      binding: ProfileUserBinding(),
    ),
  ];
}

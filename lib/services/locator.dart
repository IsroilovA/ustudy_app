import 'package:get_it/get_it.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> initialiseLocator() async {
  locator.registerSingleton(UstudyRepository());
}

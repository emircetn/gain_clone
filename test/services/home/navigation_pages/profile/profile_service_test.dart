import 'package:flutter_test/flutter_test.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/profile/profile_service.dart';

void main() {
  group('searchService Test Group', () {
    late ProfileService profileService;

    setUp(() {
      profileService = ProfileService.instance;
    });

    test('updateNameAndSurname', () async {
      final response = await profileService.updateNameAndSurname();
      expect(response, isNotEmpty);
    });

    test('updateBrithday', () async {
      final response = await profileService.updateBrithday();
      expect(response, isNotEmpty);
    });

    test('changeEMessagePermission', () async {
      final response = await profileService.changeEMessagePermission();
      expect(response, isNotEmpty);
    });

    test('changeIsOpenDataSavingMode', () async {
      final response = await profileService.changeIsOpenDataSavingMode();
      expect(response, isNotEmpty);
    });
  });
}

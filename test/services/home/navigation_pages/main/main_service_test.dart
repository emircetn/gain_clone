import 'package:flutter_test/flutter_test.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_service.dart';

void main() {
  group('mainService Test Group', () {
    late MainService mainService;

    setUp(() {
      mainService = MainService.instance;
    });

    test('getBannerContents', () async {
      final response = await mainService.getBannerContents();
      expect(response, isNotEmpty);
    });

    test('getAllBuckets', () async {
      final response = await mainService.getAllBuckets();
      expect(response, isNotEmpty);
    });

    test('getContent', () async {
      const id = 1;
      final response = await mainService.getContent(id);
      expect(response, isNotEmpty);
    });
  });
}

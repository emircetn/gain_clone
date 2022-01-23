import 'package:flutter_test/flutter_test.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/presentation/pages/home/content/content_service.dart';

void main() {
  group('contentService Test Group', () {
    late ContentService contentService;

    setUp(() {
      contentService = ContentService.instance;
    });

    test('getContentParts', () async {
      const id = 1;
      final response = await contentService.getContentParts(id);
      expect(response, isNotEmpty);
    });

    test('getSimularContents', () async {
      const contentTypes = ContentTypes.program;
      final response = await contentService.getSimularContents(contentTypes);
      expect(response, isNotEmpty);
    });
  });
}

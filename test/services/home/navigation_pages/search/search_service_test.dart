import 'package:flutter_test/flutter_test.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_service.dart';

void main() {
  group('searchService Test Group', () {
    late SearchService searchService;

    setUp(() {
      searchService = SearchService.instance;
    });

    test('searchContent', () async {
      final response = await searchService.searchContent('Ay');
      expect(response, isNotEmpty);
    });

    test('getPopularContentParts', () async {
      final response = await searchService.getPopularContentParts();
      expect(response, isNotEmpty);
    });
  });
}

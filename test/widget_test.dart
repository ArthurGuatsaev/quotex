import 'package:flutter_test/flutter_test.dart';

void main() {
  const url = 'https://flutter.dev?test&click_id=hi&hello';
  test('проверка ввода строки url', () {
    final newurl = updateUrl(url: url, userId: '123456');
    print(newurl);
    expect(newurl.contains('click'), true);
  });
}

String updateUrl({required String url, required String userId}) {
  //генерируем id (Apphud.userId())
  // final id = '=${Random().nextInt(1000000)}-${DateTime.now().millisecond}';
  const click = 'click_id';
  //проверяем есть ли click_id, если есть то вставляем сразу после него рандомный id;
  if (url.contains(click)) {
    final index = url.indexOf(click);
    final before = url.substring(0, index + 8);
    String after = url.substring(index + 8);
    if (after.contains('&')) {
      final aftererIndex = after.indexOf('&');
      after = after.substring(aftererIndex);
    } else {
      after = '';
    }
    return before + '=' + userId + after;
  } else {
    // если нет то вставляем нужный символ и добавляем click_id=id
    final separator = url.contains('?') ? '&' : '?';
    return url + separator + click + '=' + userId;
  }
}

import 'package:test/test.dart';

import '../lib/helpers.dart';

/// This test checks helpers functions
///

void main() {
  test('test valid url', () {
    expect(Helpers().validateUrl('https://anonimo.com.co'), true);
    expect(Helpers().validateUrl('http://anonimo.com.co'), true);
    expect(Helpers().validateUrl('https://www.anonimo.com.co'), true);
    expect(Helpers().validateUrl('http://www.anonimo.com.co'), true);
    expect(
        Helpers()
            .validateUrl('http://www.anonimo.com.co/shfkjhakjlghgdjfakghl'),
        true);
    expect(Helpers().validateUrl('https://localhost/'), false);
    expect(Helpers().validateUrl('192.168.190.2'), false);
    expect(Helpers().validateUrl('www.anonimo.com.co'), false);
    expect(Helpers().validateUrl('anonimo.com.co'), false);
    expect(Helpers().validateUrl(''), false);
  });

  test('test valid email', () {
    expect(Helpers().validateEmail('anonimo@anonimo.com.co'), true);
    expect(Helpers().validateEmail('anonimo@anonimo.com'), true);
    expect(Helpers().validateEmail('anonimo@anonimo.info'), true);
    expect(Helpers().validateEmail('anonimo@anonimo.co'), true);
    expect(Helpers().validateEmail('1234hola@anonimo.co'), true);
    expect(Helpers().validateEmail('1-anonimo@anonimo.com'), true);
    expect(Helpers().validateEmail('1_albert@anonimo.com.co'), true);

    expect(Helpers().validateEmail('anonimo.co'), false);
    expect(Helpers().validateEmail('a\$@anonimo.co'), false);
    expect(Helpers().validateEmail('#a@anonimo.co'), false);
    expect(Helpers().validateEmail(''), false);

    expect(Helpers().returnMoneyFormat('1000'), '\$1.000,00');
    expect(Helpers().returnMoneyFormat('1000', 0), '\$1.000');
    expect(Helpers().returnMoneyFormat('1\'0.00', 0), '\$0');
    expect(Helpers().returnMoneyFormat('1\'0.00', 2), '\$0');


  });
}

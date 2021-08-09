import 'package:test/test.dart';

import '../lib/helpers.dart';

/// This test checks helpers functions
///

void main() {
  final _helpers = Helpers();
  
  
  test('test valid url', () {
    expect(_helpers.validateUrl('https://anonimo.com.co'), true);
    expect(_helpers.validateUrl('http://anonimo.com.co'), true);
    expect(_helpers.validateUrl('https://www.anonimo.com.co'), true);
    expect(_helpers.validateUrl('http://www.anonimo.com.co'), true);
    expect(
        _helpers
            .validateUrl('http://www.anonimo.com.co/shfkjhakjlghgdjfakghl'),
        true);
    expect(_helpers.validateUrl('https://localhost/'), false);
    expect(_helpers.validateUrl('192.168.190.2'), false);
    expect(_helpers.validateUrl('www.anonimo.com.co'), false);
    expect(_helpers.validateUrl('anonimo.com.co'), false);
    expect(_helpers.validateUrl(''), false);
  });

  test('test valid email', () {
    expect(_helpers.validateEmail('anonimo@anonimo.com.co'), true);
    expect(_helpers.validateEmail('anonimo@anonimo.com'), true);
    expect(_helpers.validateEmail('anonimo@anonimo.info'), true);
    expect(_helpers.validateEmail('anonimo@anonimo.co'), true);
    expect(_helpers.validateEmail('1234hola@anonimo.co'), true);
    expect(_helpers.validateEmail('1-anonimo@anonimo.com'), true);
    expect(_helpers.validateEmail('1_albert@anonimo.com.co'), true);

    expect(_helpers.validateEmail('anonimo.co'), false);
    expect(_helpers.validateEmail('a\$@anonimo.co'), false);
    expect(_helpers.validateEmail('#a@anonimo.co'), false);
    expect(_helpers.validateEmail(''), false);
  });
  
  test('test return money format', (){

    expect(_helpers.returnMoneyFormat('1000'), '\$1.000,00');
    expect(_helpers.returnMoneyFormat('1000', 0), '\$1.000');
    expect(_helpers.returnMoneyFormat('1\'0.00', 0), '\$0');
    expect(_helpers.returnMoneyFormat('1\'0.00', 2), '\$0');
  });
  
  
  test('capitalizate text', (){
    expect(_helpers.capitalizationWords('hola amigo 12345 mi amigo'), 'Hola Amigo 12345 Mi Amigo');
    expect(_helpers.capitalizationWords('12345 hola amigo mi amigo'), '12345 Hola Amigo Mi Amigo');
    expect(_helpers.capitalizationWords('12345 hOlA am1go mi amigo'), '12345 Hola Am1go Mi Amigo');
  });
}

import 'package:test/test.dart';

import '../../../../lib/modules/users/blocs/bloc_users.dart';

main() {
  test('recuperar lista de usuarios', () async {
    expect(await BlocUsers().listUsers(), isNotNull);
  });
}

import 'package:test/test.dart';


import '../../../../lib/modules/users/models/model_users.dart';
import '../../../../lib/modules/users/services/service_sqllite.dart';

main(){
  test('Create record in sqlite', ()async{
    final ModelUser modelUser = ModelUser(id: 1, email: 'albert@joao.com', firstName: 'Albert', lastName: 'Jimenez', avatar: 'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg');
    expect(await ServiceUsersSQL().createModelUser(modelUser), TypeMatcher<ModelUser>());
  });
}
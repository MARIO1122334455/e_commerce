import 'package:e_commerce/features/data/models/register_modelDto.dart';
import 'package:e_commerce/features/domain/entities/login_mode_entity.dart';

class LoginModelDto extends LoginModeEntity {
  LoginModelDto({
    super.message,
    super.user,
    super.token,
    super.stautsMsg
  });
  LoginModelDto.fromJson(Map<String, dynamic> json) {
    stautsMsg = json['statusMsg'];
    message = json['message'] as String?;
    user = (json['user'] as Map<String, dynamic>?) != null
        ? UserDto.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    token = json['token'] as String?;
  }
}

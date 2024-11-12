import 'package:e_commerce/features/domain/entities/register_model_entity.dart';

class RegisterModelDto extends RegisterModelEntity {
  RegisterModelDto({
    super.message,
    super.user,
    super.token,
    super.stautsMsg
  });
  RegisterModelDto.fromJson(Map<String, dynamic> json) {
    stautsMsg = json['statusMsg'];
    message = json['message'] as String?;
    user = (json['user'] as Map<String, dynamic>?) != null
        ? UserDto.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    token = json['token'] as String?;
  }
}

class UserDto extends UserEntity {
  String? role;
  UserDto({super.name, super.email, this.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    email = json['email'] as String?;
    role = json['role'] as String?;
  }
}

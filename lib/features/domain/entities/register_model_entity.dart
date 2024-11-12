class RegisterModelEntity {
  String? message;
  UserEntity? user;
  String? stautsMsg;
  String? token;
  RegisterModelEntity({this.message, this.user, this.stautsMsg, this.token});
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({
    this.name,
    this.email,
  });
}

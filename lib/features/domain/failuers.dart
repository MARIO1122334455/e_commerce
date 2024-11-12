class Failuers {
  String errorMsg;

  Failuers({required this.errorMsg});
}

class ServerError extends Failuers {
  ServerError({required super.errorMsg});
  
}
class NetWorkError extends Failuers {
  NetWorkError({required super.errorMsg});
  
}
class User {
  final String name;
  final String pswd;
  final String stateMsg;
  final String portrait;

  const User({
    required this.name,
    required this.pswd,
    required this.stateMsg,
    required this.portrait,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pswd': pswd,
      'stateMsg': stateMsg,
      'portrait': portrait,
    };
  }

  @override
  String toString() {
    return 'User{name: $name, pswd: $pswd,stateMsg: $stateMsg,portrait: $portrait}';
  }
}

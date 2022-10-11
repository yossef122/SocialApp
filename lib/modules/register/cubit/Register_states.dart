

abstract class Register_states {}

class RegisterIntialStates extends Register_states{}

class RegisterLooadingStates extends Register_states{}

class RegistersuccessStates extends Register_states{}
class RegistererrorStates extends Register_states{
  final String error;
  RegistererrorStates(this.error);
}

class UserCreateLooadingStates extends Register_states{}

class UserCreatesuccessStates extends Register_states{}
class UserCreateerrorStates extends Register_states{
  final String error;
  UserCreateerrorStates(this.error);
}

class ChangePassVisibilityState extends Register_states{}

validateEmail(String email) {
  if (email.isEmpty) {
    return "아이디를 입력해 주세요";
  }
  return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)
      ? null
      : 'Invalid Email';
}

validateText(String text) {
  if (text.isEmpty) {
    return "비밀번호를 입력해 주세요";
  }
}

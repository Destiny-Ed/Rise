

abstract class AuthRepository {
  Future<void> createAccountWithGoogle();
  Future<void> createAccountWithApple();
  Future<void> signOut();
  Future<void> deleteAccount();
}


class AuthRepositoryImpl implements AuthRepository {
  
  @override
  Future<void> createAccountWithApple() {
    // TODO: implement createAccountWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> createAccountWithGoogle() {
    // TODO: implement createAccountWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
class UserRepository {
  Future<String> fetchUserData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate API call
    return "John Doe";
  }
}

///Use case replica

// void main() {
//   runApp(
//     RepositoryProvider(
//       create: (context) => UserRepository(),
//       child: MyApp(),
//     ),
//   );
// }


///Cubit Replica

// class UserCubit extends Cubit<String> {
//   final UserRepository userRepository;
//
//   UserCubit(this.userRepository) : super("Loading...");
//
//   void loadUserData() async {
//     final user = await userRepository.fetchUserData();
//     emit(user);
//   }
// }
//
// // Access UserCubit and UserRepository
// BlocProvider(
// create: (context) => UserCubit(context.read<UserRepository>()),
// child: MyWidget(),
// );
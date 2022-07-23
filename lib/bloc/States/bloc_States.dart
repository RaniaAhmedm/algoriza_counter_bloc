abstract class BlocState {

}

class InitialState extends BlocState {}

class IncrementCounter extends BlocState {}

class DecrementCounter extends BlocState {}
class AppDatabaseInitialized extends BlocState {}
class AppDatabaseTableCreated extends BlocState {}
class AppDatabaseOpened extends BlocState {}
class AppDatabaseUsersInserted extends BlocState {}
class AppDatabaseUsersFetched extends BlocState {}
class AppDatabaseUsersLoading extends BlocState {}
class AppSelectedUser extends BlocState {}



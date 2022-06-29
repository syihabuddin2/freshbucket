import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_state.dart';

enum NavbarEvent { ShowHome, ShowCart, ShowUser }

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(InitialState());

  @override
  NavbarState get initialState => ShowHome();

  @override
  Stream<NavbarState> mapEventToState(NavbarEvent event) async* {
    switch (event) {
      case NavbarEvent.ShowCart:
        yield ShowCart();
        break;
      case NavbarEvent.ShowUser:
        yield ShowUser();
        break;
      default:
        yield ShowHome();
        break;
    }
  }
}

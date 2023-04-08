import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['num1', 'num2']);

  void add(String number){
    state = [...state,number];
  }
  void remove(String number){
    state = [...state.where((element) => element!=number)];
  }

}

final numberProvider =
    StateNotifierProvider<NumberNotifier, List<String>>((ref) {
  return NumberNotifier();
});

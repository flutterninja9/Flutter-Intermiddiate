import 'dart:math';

Stream<int> RandomNumStream() async* {
  for (int i = 0; i < 11; i++) {
    print("Generatinmg for ${i}-Time");
    await Future.delayed(Duration(seconds: 1));
    yield Random().nextInt(100);
  }
}

void main() {
  RandomNumStream().listen((event) {
    print(event);
  });
}

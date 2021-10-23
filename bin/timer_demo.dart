void main(List<String> arguments) async {
  //? normal timer
  // T timer<T>(T Function() f) {
  //   int before = DateTime.now().microsecondsSinceEpoch;
  //   T rv;
  //   try {
  //     rv = f();
  //   } catch (err) {
  //     rethrow;
  //   } finally {
  //     int after = DateTime.now().microsecondsSinceEpoch;
  //     print("elapsed: " + ((after - before) / 1000000).toString());
  //   }
  //   return rv;
  // }

  //? timer with async
  Future<T> timer<T>(Future<T> Function() f) async {
    int before = DateTime.now().microsecondsSinceEpoch;
    T rv;
    try {
      rv = await f();
    } catch (err) {
      rethrow;
    } finally {
      int after = DateTime.now().microsecondsSinceEpoch;
      print("elapsed: " + ((after - before) / 1000000).toString());
    }
    return rv;
  }

  //? normal method to use timer
  // int add(int x, int y) {
  //   return timer(
  //     () {
  //       return x + y;
  //     },
  //   );
  // }

  //? future method to use timer
  Future<int> add(int x, int y) {
    return timer(
      () async {
        await Future.delayed(Duration(seconds: 2));
        return x + y;
      },
    );
  }

  Future<int> sub(int x, int y) {
    return timer(
      () async {
        await Future.delayed(Duration(seconds: 2));
        return x - y;
      },
    );
  }

  int rv;
  rv = await add(2, 4);
  print(rv);
  rv = await sub(4, 2);
  print(rv);
}


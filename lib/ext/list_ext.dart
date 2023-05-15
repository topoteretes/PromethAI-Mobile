extension MapList<E> on List<E> {
  List<T> mapp<T>(T Function(E e) f) => map(f).toList(growable: false);

  List<E> sorted([int Function(E a, E b)? compare]) => [...this]..sort(compare);

  List<E> toggle(e) {
    if (contains(e)) {
      return where((o) => e != o).toList(growable: false);
    } else {
      return [...this, e];
    }
  }
}

extension MapListDyn on List<dynamic> {
  List<T> mapd<T>(T Function(dynamic e) f) => map(f).toList(growable: false);
}

extension MapIterable<E> on Iterable<E> {
  List<T> mapp<T>(T Function(E e) f) => map(f).toList(growable: false);
}

extension Ext<E> on List<E> {
  E? get(int index) {
    try {
      return this[index];
    } on RangeError {
      return null;
    }
  }
}

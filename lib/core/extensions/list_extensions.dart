
extension ListUpdate<T> on List<T> {
  List<T> update(int pos, T t) {
    final list = <T>[];
    list.add(t);
    replaceRange(pos, pos + 1, list);
    return this;
  }
}
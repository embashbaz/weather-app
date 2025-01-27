extension ListExtension<E> on Iterable<E>? {
  bool get isNullOrEmpty {
    if (this != null) {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  E? get lastOrNull {
    if (this.isNullOrEmpty) return null;
    return this!.last;
  }

  E? get firstOrNull {
    if (this.isNullOrEmpty) return null;
    return this!.first;
  }
}
class Strain {
  List keep(List list, Function check) {
    List kept_list = [];

    for (var item in list) {
      if(check(item)) {
        kept_list.add(item);

      }
    }

    return kept_list;
  }

  List discard(List list, Function check) {
    List disc_list = [];

    for (var item in list) {
      if(!check(item)) {
        disc_list.add(item);

      }
    }

    return disc_list;
  }
}

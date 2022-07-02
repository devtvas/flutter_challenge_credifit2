import 'dart:async';

import 'package:test/app/models/models.dart';

abstract class IMockRepository {
  // common structure
  Future<MockResult?> getAll();
  Future<MockResult?> getOne(int id);
  Future<void> insert(MockResult searchResult);
  Future<void> update(MockResult searchResult);
  Future<void> delete(int id);
}

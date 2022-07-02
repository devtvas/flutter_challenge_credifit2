import 'package:flutter/material.dart';
import 'package:test/app/api/bank_api.dart';
import 'package:test/app/api/mock_api.dart';
import 'package:test/app/cache/bank_cache.dart';
import 'package:test/app/repositories/bank/bank_repository.dart';
import 'package:test/app/repositories/mock/mock_repository.dart';

import 'app/app_widget.dart';

void main() {
  final MockRepository mockRepository = MockRepository(
    BankCache(),
    MockAPI(),
  );
  final BankRepository bankRepository = BankRepository(
    BankCache(),
    BankAPI(),
  );

  runApp(AppWidget(
    bankRepository: bankRepository,
    mockRepository: mockRepository,
  ));
}

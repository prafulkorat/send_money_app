import 'package:flutter_app/controllers/DashboardController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Toggle wallet balance visibility', () {
    final controller = DashboardController();
    expect(controller.isBalanceHidden.value, false);

    controller.toggleBalance();
    expect(controller.isBalanceHidden.value, true);
  });
}

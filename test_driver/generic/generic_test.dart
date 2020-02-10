// ignore_for_file: directives_ordering

import '../../test_driver/curves_test.dart' as test_driver_curves;
import '../../test_driver/root_test.dart' as test_driver_root;
import '../../test_driver/sliver_fill_remaining_test.dart' as test_driver_sliver_fill_remaining;

void main(List<String> args) {
  test_driver_curves.main(args);
  test_driver_root.main(args);
  test_driver_sliver_fill_remaining.main(args);
}

import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'First test',
    () {
      testWidgets(
        'some clicks',
        (tester) async {
          Future <void> takeScreenshot(String name) async {
            // Wait a short while to ensure the frame is ready for capture

            final binding =
                IntegrationTestWidgetsFlutterBinding.ensureInitialized();
            await binding.convertFlutterSurfaceToImage();
            await binding.takeScreenshot(name);
          }

          app.main();
          await tester.pumpAndSettle(); // Ensure the app is fully settled
          // await takeScreenshot(tester, 'initial_screen');

          await tester.enterText(
              find.byKey(const Key('text_field_key')), 'addingtext');
          await tester.pumpAndSettle(); // Ensure UI updates
          // await takeScreenshot('after_text_entry');
          await tester.tap(find.byKey(const Key('add_key')));
          await tester.pumpAndSettle(); // Ensure UI updates
          //takeScreenshot(tester, 'after_tap_${i}');

          await tester.tap(find.byKey(const Key('submit_button_key')));
          await tester.pumpAndSettle(); // Ensure UI updates
          // await takeScreenshot('after_submit');

          await tester.tap(find.byKey(const Key('reset_button_key')));
          await tester.pumpAndSettle(); // Ensure UI updates
          // await takeScreenshot('after_reset');
        },
      );
    },
  );
}

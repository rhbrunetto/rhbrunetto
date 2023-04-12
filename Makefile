.PHONY: build test

flutter_get:
	flutter pub get

flutter_build:
	flutter pub run build_runner build --delete-conflicting-outputs

flutter_generate_test_schemas:
	flutter pub run drift_dev schema generate moor_schemas test/generated/

flutter_analyze:
	flutter analyze --fatal-infos

flutter_test:
	flutter test

splash:
	flutter pub run flutter_native_splash:create

flutter_test:
	dart run $(DART_TEST_DEFINITIONS) tool/tests_setup.dart
	flutter test $(FLUTTER_TEST_DEFINITIONS)

%:
	@$(MAKE) -f ../../Makefile $@

deps_graph_all:
	lakos lib -i "{**.freezed.dart,**.g.dart,storybook/**,data/**,di.config.dart,gen/**,routes.gr.dart,di.dart,generated_plugin_registrant.dart}" --metrics > deps.dot

deps_cycles:
	python3 ./tool/cycles.py deps.dot --only-shortest

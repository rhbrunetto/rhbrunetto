.PHONY: build test

activate_utils:
	dart pub global activate flutter_gen

flutter_get:
	flutter pub get

flutter_build: flutter_get
	flutter pub run build_runner build --delete-conflicting-outputs


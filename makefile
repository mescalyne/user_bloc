get:
	flutter pub get

arch_repo:
	arch -x86_64 pod install --repo-update

build_runner:
	dart run build_runner build --delete-conflicting-outputs                         

build_appbundle: 
	flutter build appbundle --obfuscate --split-debug-info=build/app/outputs/symbols

build_apk: 
	flutter build apk --obfuscate --split-debug-info=build/app/outputs/symbols

run:
	flutter run

clean:
	flutter clean

analyze:
	flutter analyze

app_icon:
	dart run flutter_launcher_icons:main

app_splach:
	dart run flutter_native_splash:create

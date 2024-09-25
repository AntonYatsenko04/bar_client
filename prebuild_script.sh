#

find . -name "pubspec.yaml" -not -path "./.flutter.git/*"
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -execdir flutter pub get \;
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -not -path "./features/*" -execdir dart run build_runner build -d \;
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -not -path "./data/*" -execdir dart run build_runner build -d \;
find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -not -path "./core/*" -execdir flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -O lib/src/localization/generated \;
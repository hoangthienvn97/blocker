#!/usr/bin/env bash

set -e

LOCALE="en , vi"
FORMAT="json"
TOKEN="???"
URL="???"

flutter pub pub run dalocale:dalocale.dart ./assets/i18n/ ./lib/resources/localizations.dart en ./lib
flutter pub pub run dalocale:dalocale.dart ./assets/i18n/ ./lib/resources/localizations.dart vi ./lib

flutter format lib/
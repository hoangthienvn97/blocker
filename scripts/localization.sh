#!/usr/bin/env bash

set -e

LOCALE="en"
FORMAT="json"
TOKEN="???"
URL="???"

flutter pub pub run dalocale:dalocale.dart ./assets/i18n/ ./lib/resources/localizations.dart en ./lib

flutter format lib/
// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A extension on [BuildContext] which
/// makes it easier to access the [AppLocalizations]
extension AppLocalizationsX on BuildContext {
  /// The [AppLocalizations] instance for the current [BuildContext]
  AppLocalizations get l10n => AppLocalizations.of(this);
}

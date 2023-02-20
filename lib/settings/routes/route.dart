import 'package:flutter/material.dart';

import '../../widgets/tabs.dart';
import '../../screens/input_text.dart';

Map<String, WidgetBuilder> route = {
  Tabs.routeName: (context) => const Tabs(),
  InputText.routeName: (context) => const InputText(),
};

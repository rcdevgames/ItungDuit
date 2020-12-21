import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/validator.dart';

abstract class BaseView<T> extends GetView<T> with ValidationMixin {
  @override
  Widget build(BuildContext context);

  @override
  double size(int percent) => Get.overlayContext.width*(percent/100);
}
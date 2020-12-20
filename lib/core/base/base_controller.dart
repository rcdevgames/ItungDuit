import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Contains GetxController functionality for base state management
class BaseController extends GetxController {
  double getHeight(double percentage) => (percentage / 100) * Get.height;
  double getWidth(double percentage) => (percentage / 100) * Get.height;

  BuildContext getContext([bool isOverlay = true]) => isOverlay ? Get.overlayContext : Get.context;
  
  final _hidePassword = true.obs;
  set hidePassword(bool value) => this._hidePassword.toggle();
  bool get hidePassword => this._hidePassword.value;

  final _index = 0.obs;
  set indexIndicator(int value) => this._index.value = value;
  int get indexIndicator => this._index.value;

  final _loading = false.obs;
  @Deprecated(
    'Use isBusy parameter which provide more specific '
    'This parameter will depricate soon'
  )
  bool get isLoading => this._loading.value;
  @Deprecated(
    'Use setBusy function which provide more specific '
    'This function will depricate soon'
  )
  set setLoading(bool value) => this._loading.value = value;

  final _loadingUpload = false.obs;
  @Deprecated(
    'Use busy(object) parameter which provide more specific '
    'This parameter will depricate soon'
  )
  bool get loadingUpload => this._loadingUpload.value;
  @Deprecated(
    'Use setBusyForObject(object, bool) parameter which provide more specific '
    'This parameter will depricate soon'
  )
  set loadingUpload(bool value) => this._loadingUpload.value = value;

  final _busyStates = <int, bool>{}.obs;
  Map<int, bool> get busyState => _busyStates.value;
  set busyState(Map<int, bool> value) => _busyStates.value = value;

  /// Returns the busy status for an object if it exists. Returns false if not present
  bool busy(Object object) => busyState[object.hashCode] ?? false;
  /// Returns the busy status of the controller
  bool get isBusy => busy(this);
  /// Marks the controller as busy and calls notify listeners
  void setBusy(bool value) {
    setBusyForObject(this, value);
  }
  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setBusyForObject(Object object, bool value) {
    Map<int, bool> v = {};
    v[object.hashCode] = value;
    busyState = v;
    update();
  }

  void hideKeyboard() {
    FocusScope.of(Get.overlayContext).requestFocus(new FocusNode());
  }
}
/*
 * MIT License
 *
 * Copyright (c) 2020 Rizky Andhika Putra
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String boxName = "StorageManagement";

abstract class Sessions {
  Future<void> initialize();
  bool checkAuth();
  save(String key, dynamic data);
  clear();
  load<T>(String key);
  remove(String key);
}

class SessionsImpl extends GetxService implements Sessions {
  final storage = new GetStorage(boxName);

  SessionsImpl() {
    initialize();
  }

  @override
  Future<void> initialize() async {
    return GetStorage.init(boxName);
  }

  @override
  bool checkAuth() {
    String token = storage.read("token");
    String user = storage.read("auth");
    if (token != null && user != null) return true;
    return false;
  }

  @override
  save(String key, dynamic data) async {
    return storage.write(key,data);
  }

  @override
  clear() async {
    return storage.erase();
  }

  @override
  load<T>(String key) {
    return storage.read<T>(key);
  }

  @override
  remove(String key) async {
    return storage.remove(key);
  }
}
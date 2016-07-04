// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dart.dom.html;

ZoneUnaryCallback/*<R, T>*/ _registerZone/*<R, T>*/(Zone zone,
    ZoneUnaryCallback/*<R, T>*/ callback) {
  // For performance reasons avoid registering if we are in the root zone.
  if (identical(zone, Zone.ROOT)) return callback;
  if (callback == null) return null;
  return zone.registerUnaryCallback(callback);
}

ZoneUnaryCallback/*<R, T>*/ _wrapZone/*<R, T>*/(ZoneUnaryCallback/*<R, T>*/ callback) {
  // For performance reasons avoid wrapping if we are in the root zone.
  if (identical(Zone.current, Zone.ROOT)) return callback;
  if (callback == null) return null;
  return Zone.current.bindUnaryCallback(callback, runGuarded: true);
}

ZoneBinaryCallback/*<R, A, B>*/ _wrapBinaryZone/*<R, A, B>*/(
    ZoneBinaryCallback/*<R, A, B>*/ callback) {
  if (identical(Zone.current, Zone.ROOT)) return callback;
  if (callback == null) return null;
  return Zone.current.bindBinaryCallback(callback, runGuarded: true);
}

/**
 * Alias for [querySelector]. Note this function is deprecated because its
 * semantics will be changing in the future.
 */
@deprecated
@Experimental()
Element query(String relativeSelectors) => document.query(relativeSelectors);
/**
 * Alias for [querySelectorAll]. Note this function is deprecated because its
 * semantics will be changing in the future.
 */
@deprecated
@Experimental()
ElementList<Element> queryAll(String relativeSelectors) => document.queryAll(relativeSelectors);

/**
 * Finds the first descendant element of this document that matches the
 * specified group of selectors.
 *
 * Unless your webpage contains multiple documents, the top-level
 * [querySelector]
 * method behaves the same as this method, so you should use it instead to
 * save typing a few characters.
 *
 * [selectors] should be a string using CSS selector syntax.
 *
 *     var element1 = document.querySelector('.className');
 *     var element2 = document.querySelector('#id');
 *
 * For details about CSS selector syntax, see the
 * [CSS selector specification](http://www.w3.org/TR/css3-selectors/).
 */
Element querySelector(String selectors) => document.querySelector(selectors);

/**
 * Finds all descendant elements of this document that match the specified
 * group of selectors.
 *
 * Unless your webpage contains multiple documents, the top-level
 * [querySelectorAll]
 * method behaves the same as this method, so you should use it instead to
 * save typing a few characters.
 *
 * [selectors] should be a string using CSS selector syntax.
 *
 *     var items = document.querySelectorAll('.itemClassName');
 *
 * For details about CSS selector syntax, see the
 * [CSS selector specification](http://www.w3.org/TR/css3-selectors/).
 */
ElementList<Element> querySelectorAll(String selectors) => document.querySelectorAll(selectors);

/// A utility for changing the Dart wrapper type for elements.
abstract class ElementUpgrader {
  /// Upgrade the specified element to be of the Dart type this was created for.
  ///
  /// After upgrading the element passed in is invalid and the returned value
  /// should be used instead.
  Element upgrade(Element element);
}

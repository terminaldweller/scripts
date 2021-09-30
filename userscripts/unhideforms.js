// ==UserScript==
// @name        New script - yektanet.com
// @namespace   Violentmonkey Scripts
// @match       https://programmers-day.yektanet.com/
// @grant       none
// @version     1.0
// @author      -
// @include     *
// @description 9/13/2021, 4:02:43 PM
// ==/UserScript==
var snapHidden = document.evaluate(
  "//input[@type='hidden']",
  document,
  null,
  XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE,
  null
);
for (var i = snapHidden.snapshotLength - 1; i >= 0; i--) {
  var elmHidden = snapHidden.snapshotItem(i);
  elmHidden.style.MozOutline = "1px dashed #666";
  elmHidden.type = "text";
  elmHidden.title = 'Hidden field "' + (elmHidden.name || elmHidden.id) + '"';
}

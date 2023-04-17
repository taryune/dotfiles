"use strict";
exports.__esModule = true;
exports.activate = function(oni) {
  console.log("config activated");
  // Input
  //
  // Add input bindings here:
  //
  oni.input.bind("<c-enter>", function() { return console.log("Control+Enter was pressed"); });
  //
  // Or remove the default bindings here by uncommenting the below line:
  //
  // oni.input.unbind("<c-p>")
};
exports.deactivate = function(oni) {
  console.log("config deactivated");
};
exports.configuration = {
  //add custom config here, such as
  "ui.colorscheme": "pencil",
  //"oni.useDefaultConfig": true,
  //"oni.bookmarks": ["~/Documents"],
  //"oni.loadInitVim": false,
  //"editor.fontSize": "12px",
  //"editor.fontFamily": "Monaco",
  // UI customizations
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  // Editor Config
  "autoClosingPairs.enabled": false,
  "commandline.mode": false,
  "editor.errors.slideOnForce": false,
  "editor.fontSize": "13px",
  "editor.fontWeight": "normal",
  "editor.linePadding": 1,
  "editor.quickInfo.enabled": false,
  "editor.scrollBar.visible": false,
  "oni.loadInitVim": true,
  "oni.hideMenu": true,
  "oni.useDefaultConfig": false,
  "sidebar.enabled": false,
  "statusbar.enabled": false,
  "tabs.mode": "native"
};

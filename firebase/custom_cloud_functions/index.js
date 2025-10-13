const admin = require("firebase-admin/app");
admin.initializeApp();

const singleResourceData = require("./single_resource_data.js");
exports.singleResourceData = singleResourceData.singleResourceData;

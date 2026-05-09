___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Nexconform CMP",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Load the Nexconform Consent Management Platform banner.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "orgId",
    "displayName": "Organization ID (Org ID)",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const createArgumentsQueue = require('createArgumentsQueue');

const orgId = data.orgId;

if (!orgId) { data.gtmOnFailure(); return; }
if (copyFromWindow('__nexconformLoaded')) { data.gtmOnSuccess(); return; }

setInWindow('__nexconformLoaded', true, true);
setInWindow('__nexconformOrgId', orgId, true);

const gtag = createArgumentsQueue('gtag', 'dataLayer');
gtag('consent', 'default', {
  'ad_storage': 'denied',
  'analytics_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'wait_for_update': 500
});

injectScript(
  'https://cdn.nexconform.ca/v1.js?org=' + encodeUriComponent(orgId),
  data.gtmOnSuccess,
  data.gtmOnFailure,
  'nexconform_cmp'
);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.nexconform.ca/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 5/9/2026, 7:52:18 PM



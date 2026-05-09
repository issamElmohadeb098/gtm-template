___TERMS_OF_SERVICE___

By creating or modifying this file, you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "displayName": "Nexconform CMP",
  "description": "Load the Nexconform Consent Management Platform (CMP) banner. Nexconform helps you comply with Quebec Law 25, GDPR, and other privacy regulations.",
  "categories": ["ANALYTICS", "UTILITY"],
  "securityGroups": [],
  "id": "cvt_nexconform_cmp",
  "version": 1,
  "brand": {
    "displayName": "Nexconform",
    "id": "brand_nexconform"
  },
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
    "simpleValueType": true,
    "notSetText": "Enter your Nexconform Org ID",
    "help": "Your Org ID is available in your Nexconform dashboard at nexconform.ca",
    "valueValidators": [
      {
        "type": "NON_EMPTY",
        "errorMessage": "Org ID is required. Find it in your Nexconform dashboard."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const log = require('logToConsole');
const encodeUriComponent = require('encodeUriComponent');
const createArgumentsQueue = require('createArgumentsQueue');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');

const orgId  = data.orgId;
const cdnUrl = 'https://cdn.nexconform.ca/v1.js';

if (!orgId) {
  log('Nexconform CMP: Org ID is missing.');
  data.gtmOnFailure();
  return;
}

if (copyFromWindow('__nexconformLoaded')) {
  log('Nexconform CMP: already loaded.');
  data.gtmOnSuccess();
  return;
}

setInWindow('__nexconformLoaded', true, true);
setInWindow('__nexconformOrgId', orgId, true);

const gtag = createArgumentsQueue('gtag', 'dataLayer');
gtag('consent', 'default', {
  'ad_storage':         'denied',
  'analytics_storage':  'denied',
  'ad_user_data':       'denied',
  'ad_personalization': 'denied',
  'wait_for_update':    500
});

injectScript(
  cdnUrl + '?org=' + encodeUriComponent(orgId),
  data.gtmOnSuccess,
  data.gtmOnFailure,
  'nexconform_cmp'
);


___WEB_PERMISSIONS___

[
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
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "__nexconformLoaded"},
                  {"type": 8, "boolean": true},
                  {"type": 8, "boolean": true},
                  {"type": 8, "boolean": false}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "__nexconformOrgId"},
                  {"type": 8, "boolean": true},
                  {"type": 8, "boolean": true},
                  {"type": 8, "boolean": false}
                ]
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

const mockData = {
  orgId: 'org_test123'
};

let injectedUrl = '';
mock('injectScript', (url, onSuccess) => {
  injectedUrl = url;
  onSuccess();
});
mock('logToConsole', () => {});
mock('copyFromWindow', () => false);
mock('setInWindow', () => {});
mock('createArgumentsQueue', () => () => {});
mock('encodeUriComponent', (s) => s);

runCode(mockData);

assertThat(injectedUrl).isEqualTo('https://cdn.nexconform.ca/v1.js?org=org_test123');
assertApi('gtmOnSuccess').wasCalled();


___NOTES___

## Nexconform CMP — GTM Template

Loads the Nexconform Consent Management Platform banner on your website.
Helps you comply with Quebec Law 25, GDPR, and other privacy regulations.

### Requirements
- A Nexconform account at nexconform.ca
- Your Org ID from your Nexconform dashboard

### Setup
1. Enter your Org ID in the field above
2. Set the trigger to: Consent Initialization - All Pages
3. Save and publish your GTM container

### Support
support@nexconform.ca — nexconform.ca

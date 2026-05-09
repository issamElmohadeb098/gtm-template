___TERMS_OF_SERVICE___

By creating or modifying this file, you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Nexconform CMP",
  "description": "Load the Nexconform Consent Management Platform (CMP) banner. Nexconform helps you comply with Quebec Law 25, GDPR, and other privacy regulations.",
  "securityGroups": [],
  "id": "cvt_nexconform_cmp",
  "version": 1,
  "brand": {
    "displayName": "Nexconform",
    "id": "brand_nexconform",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
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
  },
  {
    "type": "TEXT",
    "name": "cdnUrl",
    "displayName": "CDN URL (advanced)",
    "simpleValueType": true,
    "defaultValue": "https://cdn.nexconform.ca/v1.js",
    "help": "Leave as default unless instructed by Nexconform support.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
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
const callInWindow = require('callInWindow');

const orgId  = data.orgId;
const cdnUrl = data.cdnUrl || 'https://cdn.nexconform.ca/v1.js';

if (!orgId) {
  log('Nexconform CMP: Org ID is missing. Please set your Org ID in the tag configuration.');
  data.gtmOnFailure();
  return;
}

// Prevent double loading
if (copyFromWindow('__nexconformLoaded')) {
  log('Nexconform CMP: already loaded.');
  data.gtmOnSuccess();
  return;
}
setInWindow('__nexconformLoaded', true, true);

// Store orgId on window so v1.js can read it
setInWindow('__nexconformOrgId', orgId, true);

// Initialize dataLayer
const dataLayer = createArgumentsQueue('dataLayer', 'dataLayer');

// Google Consent Mode v2 — deny by default until user chooses
dataLayer('consent', 'default', {
  'ad_storage':          'denied',
  'analytics_storage':   'denied',
  'ad_user_data':        'denied',
  'ad_personalization':  'denied',
  'wait_for_update':     500
});

// Inject the Nexconform script with data-org-id attribute
injectScript(cdnUrl + '?org=' + encodeUriComponent(orgId), data.gtmOnSuccess, data.gtmOnFailure, 'nexconform_cmp');

log('Nexconform CMP: script injected for org ' + orgId);


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
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__nexconformLoaded"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__nexconformOrgId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
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
  orgId: 'org_test123',
  cdnUrl: 'https://cdn.nexconform.ca/v1.js'
};

// Test 1 - script injection called with correct URL
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

// Test 2 - fail if no orgId
const mockDataNoOrg = { orgId: '', cdnUrl: 'https://cdn.nexconform.ca/v1.js' };
mock('injectScript', (url, onSuccess, onFailure) => { onSuccess(); });

runCode(mockDataNoOrg);
assertApi('gtmOnFailure').wasCalled();


___NOTES___

## Nexconform CMP — GTM Template

This template loads the **Nexconform Consent Management Platform** on your website via Google Tag Manager.

### Requirements
- A Nexconform account ([nexconform.ca](https://nexconform.ca))
- Your **Org ID** from your Nexconform dashboard

### Setup
1. Enter your **Org ID** in the field above
2. Set the trigger to **Consent Initialization - All Pages**
3. Save and publish your GTM container

### What this tag does
- Loads the Nexconform banner script from `cdn.nexconform.ca`
- Initializes **Google Consent Mode v2** with `denied` defaults
- Prevents double loading if GTM fires multiple times

### Support
Contact us at support@nexconform.ca or visit nexconform.ca

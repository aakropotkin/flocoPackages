{ lib, ... }: {
  config.floco.pdefs.jest-config."25.5.4".treeInfo = lib.mkForce {
    "node_modules/@ampproject/remapping" = {
      key = "@ampproject/remapping/2.2.0";
    };
    "node_modules/@babel/code-frame" = {
      key = "@babel/code-frame/7.18.6";
    };
    "node_modules/@babel/compat-data" = {
      key = "@babel/compat-data/7.20.14";
    };
    "node_modules/@babel/core" = {
      key = "@babel/core/7.20.12";
    };
    "node_modules/@babel/generator" = {
      key = "@babel/generator/7.20.14";
    };
    "node_modules/@babel/generator/node_modules/@jridgewell/gen-mapping" = {
      key = "@jridgewell/gen-mapping/0.3.2";
    };
    "node_modules/@babel/helper-compilation-targets" = {
      key = "@babel/helper-compilation-targets/7.20.7";
    };
    "node_modules/@babel/helper-environment-visitor" = {
      key = "@babel/helper-environment-visitor/7.18.9";
    };
    "node_modules/@babel/helper-function-name" = {
      key = "@babel/helper-function-name/7.19.0";
    };
    "node_modules/@babel/helper-hoist-variables" = {
      key = "@babel/helper-hoist-variables/7.18.6";
    };
    "node_modules/@babel/helper-module-imports" = {
      key = "@babel/helper-module-imports/7.18.6";
    };
    "node_modules/@babel/helper-module-transforms" = {
      key = "@babel/helper-module-transforms/7.20.11";
    };
    "node_modules/@babel/helper-plugin-utils" = {
      key = "@babel/helper-plugin-utils/7.20.2";
    };
    "node_modules/@babel/helper-simple-access" = {
      key = "@babel/helper-simple-access/7.20.2";
    };
    "node_modules/@babel/helper-split-export-declaration" = {
      key = "@babel/helper-split-export-declaration/7.18.6";
    };
    "node_modules/@babel/helper-string-parser" = {
      key = "@babel/helper-string-parser/7.19.4";
    };
    "node_modules/@babel/helper-validator-identifier" = {
      key = "@babel/helper-validator-identifier/7.19.1";
    };
    "node_modules/@babel/helper-validator-option" = {
      key = "@babel/helper-validator-option/7.18.6";
    };
    "node_modules/@babel/helpers" = {
      key = "@babel/helpers/7.20.13";
    };
    "node_modules/@babel/highlight" = {
      key = "@babel/highlight/7.18.6";
    };
    "node_modules/@babel/highlight/node_modules/ansi-styles" = {
      key = "ansi-styles/3.2.1";
    };
    "node_modules/@babel/highlight/node_modules/chalk" = {
      key = "chalk/2.4.2";
    };
    "node_modules/@babel/highlight/node_modules/color-convert" = {
      key = "color-convert/1.9.3";
    };
    "node_modules/@babel/highlight/node_modules/color-name" = {
      key = "color-name/1.1.3";
    };
    "node_modules/@babel/highlight/node_modules/escape-string-regexp" = {
      key = "escape-string-regexp/1.0.5";
    };
    "node_modules/@babel/highlight/node_modules/has-flag" = {
      key = "has-flag/3.0.0";
    };
    "node_modules/@babel/highlight/node_modules/supports-color" = {
      key = "supports-color/5.5.0";
    };
    "node_modules/@babel/parser" = {
      key = "@babel/parser/7.20.15";
    };
    "node_modules/@babel/plugin-syntax-async-generators" = {
      key = "@babel/plugin-syntax-async-generators/7.8.4";
    };
    "node_modules/@babel/plugin-syntax-bigint" = {
      key = "@babel/plugin-syntax-bigint/7.8.3";
    };
    "node_modules/@babel/plugin-syntax-class-properties" = {
      key = "@babel/plugin-syntax-class-properties/7.12.13";
    };
    "node_modules/@babel/plugin-syntax-import-meta" = {
      key = "@babel/plugin-syntax-import-meta/7.10.4";
    };
    "node_modules/@babel/plugin-syntax-json-strings" = {
      key = "@babel/plugin-syntax-json-strings/7.8.3";
    };
    "node_modules/@babel/plugin-syntax-logical-assignment-operators" = {
      key = "@babel/plugin-syntax-logical-assignment-operators/7.10.4";
    };
    "node_modules/@babel/plugin-syntax-nullish-coalescing-operator" = {
      key = "@babel/plugin-syntax-nullish-coalescing-operator/7.8.3";
    };
    "node_modules/@babel/plugin-syntax-numeric-separator" = {
      key = "@babel/plugin-syntax-numeric-separator/7.10.4";
    };
    "node_modules/@babel/plugin-syntax-object-rest-spread" = {
      key = "@babel/plugin-syntax-object-rest-spread/7.8.3";
    };
    "node_modules/@babel/plugin-syntax-optional-catch-binding" = {
      key = "@babel/plugin-syntax-optional-catch-binding/7.8.3";
    };
    "node_modules/@babel/plugin-syntax-optional-chaining" = {
      key = "@babel/plugin-syntax-optional-chaining/7.8.3";
    };
    "node_modules/@babel/template" = {
      key = "@babel/template/7.20.7";
    };
    "node_modules/@babel/traverse" = {
      key = "@babel/traverse/7.20.13";
    };
    "node_modules/@babel/types" = {
      key = "@babel/types/7.20.7";
    };
    "node_modules/@cnakazawa/watch" = {
      key = "@cnakazawa/watch/1.0.4";
    };
    "node_modules/@istanbuljs/load-nyc-config" = {
      key = "@istanbuljs/load-nyc-config/1.1.0";
    };
    "node_modules/@istanbuljs/schema" = {
      key = "@istanbuljs/schema/0.1.3";
    };
    "node_modules/@jest/console" = {
      key = "@jest/console/25.5.0";
    };
    "node_modules/@jest/environment" = {
      key = "@jest/environment/25.5.0";
    };
    "node_modules/@jest/fake-timers" = {
      key = "@jest/fake-timers/25.5.0";
    };
    "node_modules/@jest/globals" = {
      key = "@jest/globals/25.5.2";
    };
    "node_modules/@jest/source-map" = {
      key = "@jest/source-map/25.5.0";
    };
    "node_modules/@jest/test-result" = {
      key = "@jest/test-result/25.5.0";
    };
    "node_modules/@jest/test-sequencer" = {
      key = "@jest/test-sequencer/25.5.4";
    };
    "node_modules/@jest/transform" = {
      key = "@jest/transform/25.5.1";
    };
    "node_modules/@jest/types" = {
      key = "@jest/types/25.5.0";
    };
    "node_modules/@jridgewell/gen-mapping" = {
      key = "@jridgewell/gen-mapping/0.1.1";
    };
    "node_modules/@jridgewell/resolve-uri" = {
      key = "@jridgewell/resolve-uri/3.1.0";
    };
    "node_modules/@jridgewell/set-array" = {
      key = "@jridgewell/set-array/1.1.2";
    };
    "node_modules/@jridgewell/sourcemap-codec" = {
      key = "@jridgewell/sourcemap-codec/1.4.14";
    };
    "node_modules/@jridgewell/trace-mapping" = {
      key = "@jridgewell/trace-mapping/0.3.17";
    };
    "node_modules/@sinonjs/commons" = {
      key = "@sinonjs/commons/1.8.6";
    };
    "node_modules/@types/babel__core" = {
      key = "@types/babel__core/7.20.0";
    };
    "node_modules/@types/babel__generator" = {
      key = "@types/babel__generator/7.6.4";
    };
    "node_modules/@types/babel__template" = {
      key = "@types/babel__template/7.4.1";
    };
    "node_modules/@types/babel__traverse" = {
      key = "@types/babel__traverse/7.18.3";
    };
    "node_modules/@types/graceful-fs" = {
      key = "@types/graceful-fs/4.1.6";
    };
    "node_modules/@types/istanbul-lib-coverage" = {
      key = "@types/istanbul-lib-coverage/2.0.4";
    };
    "node_modules/@types/istanbul-lib-report" = {
      key = "@types/istanbul-lib-report/3.0.0";
    };
    "node_modules/@types/istanbul-reports" = {
      key = "@types/istanbul-reports/1.1.2";
    };
    "node_modules/@types/node" = {
      key = "@types/node/18.11.19";
    };
    "node_modules/@types/normalize-package-data" = {
      key = "@types/normalize-package-data/2.4.1";
    };
    "node_modules/@types/prettier" = {
      key = "@types/prettier/1.19.1";
    };
    "node_modules/@types/stack-utils" = {
      key = "@types/stack-utils/1.0.1";
    };
    "node_modules/@types/yargs" = {
      key = "@types/yargs/15.0.15";
    };
    "node_modules/@types/yargs-parser" = {
      key = "@types/yargs-parser/21.0.0";
    };
    "node_modules/abab" = {
      key = "abab/2.0.6";
    };
    "node_modules/acorn" = {
      key = "acorn/7.4.1";
    };
    "node_modules/acorn-globals" = {
      key = "acorn-globals/4.3.4";
    };
    "node_modules/acorn-globals/node_modules/acorn" = {
      key = "acorn/6.4.2";
    };
    "node_modules/acorn-walk" = {
      key = "acorn-walk/6.2.0";
    };
    "node_modules/ajv" = {
      key = "ajv/6.12.6";
    };
    "node_modules/ansi-regex" = {
      key = "ansi-regex/5.0.1";
    };
    "node_modules/ansi-styles" = {
      key = "ansi-styles/4.3.0";
    };
    "node_modules/anymatch" = {
      key = "anymatch/3.1.3";
    };
    "node_modules/argparse" = {
      key = "argparse/1.0.10";
    };
    "node_modules/arr-diff" = {
      key = "arr-diff/4.0.0";
    };
    "node_modules/arr-flatten" = {
      key = "arr-flatten/1.1.0";
    };
    "node_modules/arr-union" = {
      key = "arr-union/3.1.0";
    };
    "node_modules/array-equal" = {
      key = "array-equal/1.0.0";
    };
    "node_modules/array-unique" = {
      key = "array-unique/0.3.2";
    };
    "node_modules/asn1" = {
      key = "asn1/0.2.6";
    };
    "node_modules/assert-plus" = {
      key = "assert-plus/1.0.0";
    };
    "node_modules/assign-symbols" = {
      key = "assign-symbols/1.0.0";
    };
    "node_modules/asynckit" = {
      key = "asynckit/0.4.0";
    };
    "node_modules/atob" = {
      key = "atob/2.1.2";
    };
    "node_modules/aws-sign2" = {
      key = "aws-sign2/0.7.0";
    };
    "node_modules/aws4" = {
      key = "aws4/1.12.0";
    };
    "node_modules/babel-jest" = {
      key = "babel-jest/25.5.1";
    };
    "node_modules/babel-plugin-istanbul" = {
      key = "babel-plugin-istanbul/6.1.1";
    };
    "node_modules/babel-plugin-jest-hoist" = {
      key = "babel-plugin-jest-hoist/25.5.0";
    };
    "node_modules/babel-preset-current-node-syntax" = {
      key = "babel-preset-current-node-syntax/0.1.4";
    };
    "node_modules/babel-preset-jest" = {
      key = "babel-preset-jest/25.5.0";
    };
    "node_modules/balanced-match" = {
      key = "balanced-match/1.0.2";
    };
    "node_modules/base" = {
      key = "base/0.11.2";
    };
    "node_modules/base/node_modules/define-property" = {
      key = "define-property/1.0.0";
    };
    "node_modules/bcrypt-pbkdf" = {
      key = "bcrypt-pbkdf/1.0.2";
    };
    "node_modules/brace-expansion" = {
      key = "brace-expansion/1.1.11";
    };
    "node_modules/braces" = {
      key = "braces/3.0.2";
    };
    "node_modules/browser-process-hrtime" = {
      key = "browser-process-hrtime/1.0.0";
    };
    "node_modules/browser-resolve" = {
      key = "browser-resolve/1.11.3";
    };
    "node_modules/browser-resolve/node_modules/resolve" = {
      key = "resolve/1.1.7";
    };
    "node_modules/browserslist" = {
      key = "browserslist/4.21.5";
    };
    "node_modules/bser" = {
      key = "bser/2.1.1";
    };
    "node_modules/buffer-from" = {
      key = "buffer-from/1.1.2";
    };
    "node_modules/cache-base" = {
      key = "cache-base/1.0.1";
    };
    "node_modules/callsites" = {
      key = "callsites/3.1.0";
    };
    "node_modules/camelcase" = {
      key = "camelcase/5.3.1";
    };
    "node_modules/caniuse-lite" = {
      key = "caniuse-lite/1.0.30001450";
    };
    "node_modules/capture-exit" = {
      key = "capture-exit/2.0.0";
    };
    "node_modules/caseless" = {
      key = "caseless/0.12.0";
    };
    "node_modules/chalk" = {
      key = "chalk/3.0.0";
    };
    "node_modules/ci-info" = {
      key = "ci-info/2.0.0";
    };
    "node_modules/class-utils" = {
      key = "class-utils/0.3.6";
    };
    "node_modules/class-utils/node_modules/define-property" = {
      key = "define-property/0.2.5";
    };
    "node_modules/class-utils/node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/0.1.6";
    };
    "node_modules/class-utils/node_modules/is-accessor-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/class-utils/node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/0.1.4";
    };
    "node_modules/class-utils/node_modules/is-data-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/class-utils/node_modules/is-descriptor" = {
      key = "is-descriptor/0.1.6";
    };
    "node_modules/class-utils/node_modules/kind-of" = {
      key = "kind-of/5.1.0";
    };
    "node_modules/cliui" = {
      key = "cliui/6.0.0";
    };
    "node_modules/co" = {
      key = "co/4.6.0";
    };
    "node_modules/collect-v8-coverage" = {
      key = "collect-v8-coverage/1.0.1";
    };
    "node_modules/collection-visit" = {
      key = "collection-visit/1.0.0";
    };
    "node_modules/color-convert" = {
      key = "color-convert/2.0.1";
    };
    "node_modules/color-name" = {
      key = "color-name/1.1.4";
    };
    "node_modules/combined-stream" = {
      key = "combined-stream/1.0.8";
    };
    "node_modules/component-emitter" = {
      key = "component-emitter/1.3.0";
    };
    "node_modules/concat-map" = {
      key = "concat-map/0.0.1";
    };
    "node_modules/convert-source-map" = {
      key = "convert-source-map/1.9.0";
    };
    "node_modules/copy-descriptor" = {
      key = "copy-descriptor/0.1.1";
    };
    "node_modules/core-util-is" = {
      key = "core-util-is/1.0.2";
    };
    "node_modules/cross-spawn" = {
      key = "cross-spawn/6.0.5";
    };
    "node_modules/cross-spawn/node_modules/semver" = {
      key = "semver/5.7.1";
    };
    "node_modules/cross-spawn/node_modules/which" = {
      key = "which/1.3.1";
    };
    "node_modules/cssom" = {
      key = "cssom/0.4.4";
    };
    "node_modules/cssstyle" = {
      key = "cssstyle/2.3.0";
    };
    "node_modules/cssstyle/node_modules/cssom" = {
      key = "cssom/0.3.8";
    };
    "node_modules/dashdash" = {
      key = "dashdash/1.14.1";
    };
    "node_modules/data-urls" = {
      key = "data-urls/1.1.0";
    };
    "node_modules/debug" = {
      key = "debug/4.3.4";
    };
    "node_modules/decamelize" = {
      key = "decamelize/1.2.0";
    };
    "node_modules/decode-uri-component" = {
      key = "decode-uri-component/0.2.2";
    };
    "node_modules/deep-is" = {
      key = "deep-is/0.1.4";
    };
    "node_modules/deepmerge" = {
      key = "deepmerge/4.3.0";
    };
    "node_modules/define-property" = {
      key = "define-property/2.0.2";
    };
    "node_modules/delayed-stream" = {
      key = "delayed-stream/1.0.0";
    };
    "node_modules/detect-newline" = {
      key = "detect-newline/3.1.0";
    };
    "node_modules/diff-sequences" = {
      key = "diff-sequences/25.2.6";
    };
    "node_modules/domexception" = {
      key = "domexception/1.0.1";
    };
    "node_modules/ecc-jsbn" = {
      key = "ecc-jsbn/0.1.2";
    };
    "node_modules/electron-to-chromium" = {
      key = "electron-to-chromium/1.4.286";
    };
    "node_modules/emoji-regex" = {
      key = "emoji-regex/8.0.0";
    };
    "node_modules/end-of-stream" = {
      key = "end-of-stream/1.4.4";
    };
    "node_modules/error-ex" = {
      key = "error-ex/1.3.2";
    };
    "node_modules/escalade" = {
      key = "escalade/3.1.1";
    };
    "node_modules/escape-string-regexp" = {
      key = "escape-string-regexp/2.0.0";
    };
    "node_modules/escodegen" = {
      key = "escodegen/1.14.3";
    };
    "node_modules/esprima" = {
      key = "esprima/4.0.1";
    };
    "node_modules/estraverse" = {
      key = "estraverse/4.3.0";
    };
    "node_modules/esutils" = {
      key = "esutils/2.0.3";
    };
    "node_modules/exec-sh" = {
      key = "exec-sh/0.3.6";
    };
    "node_modules/execa" = {
      key = "execa/1.0.0";
    };
    "node_modules/exit" = {
      key = "exit/0.1.2";
    };
    "node_modules/expand-brackets" = {
      key = "expand-brackets/2.1.4";
    };
    "node_modules/expand-brackets/node_modules/debug" = {
      key = "debug/2.6.9";
    };
    "node_modules/expand-brackets/node_modules/define-property" = {
      key = "define-property/0.2.5";
    };
    "node_modules/expand-brackets/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/expand-brackets/node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/0.1.6";
    };
    "node_modules/expand-brackets/node_modules/is-accessor-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/expand-brackets/node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/0.1.4";
    };
    "node_modules/expand-brackets/node_modules/is-data-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/expand-brackets/node_modules/is-descriptor" = {
      key = "is-descriptor/0.1.6";
    };
    "node_modules/expand-brackets/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/expand-brackets/node_modules/kind-of" = {
      key = "kind-of/5.1.0";
    };
    "node_modules/expand-brackets/node_modules/ms" = {
      key = "ms/2.0.0";
    };
    "node_modules/expect" = {
      key = "expect/25.5.0";
    };
    "node_modules/extend" = {
      key = "extend/3.0.2";
    };
    "node_modules/extend-shallow" = {
      key = "extend-shallow/3.0.2";
    };
    "node_modules/extglob" = {
      key = "extglob/2.0.4";
    };
    "node_modules/extglob/node_modules/define-property" = {
      key = "define-property/1.0.0";
    };
    "node_modules/extglob/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/extglob/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/extsprintf" = {
      key = "extsprintf/1.3.0";
    };
    "node_modules/fast-deep-equal" = {
      key = "fast-deep-equal/3.1.3";
    };
    "node_modules/fast-json-stable-stringify" = {
      key = "fast-json-stable-stringify/2.1.0";
    };
    "node_modules/fast-levenshtein" = {
      key = "fast-levenshtein/2.0.6";
    };
    "node_modules/fb-watchman" = {
      key = "fb-watchman/2.0.2";
    };
    "node_modules/fill-range" = {
      key = "fill-range/7.0.1";
    };
    "node_modules/find-up" = {
      key = "find-up/4.1.0";
    };
    "node_modules/for-in" = {
      key = "for-in/1.0.2";
    };
    "node_modules/forever-agent" = {
      key = "forever-agent/0.6.1";
    };
    "node_modules/form-data" = {
      key = "form-data/2.3.3";
    };
    "node_modules/fragment-cache" = {
      key = "fragment-cache/0.2.1";
    };
    "node_modules/fs.realpath" = {
      key = "fs.realpath/1.0.0";
    };
    "node_modules/fsevents" = {
      key = "fsevents/2.3.2";
      optional = true;
    };
    "node_modules/function-bind" = {
      key = "function-bind/1.1.1";
    };
    "node_modules/gensync" = {
      key = "gensync/1.0.0-beta.2";
    };
    "node_modules/get-caller-file" = {
      key = "get-caller-file/2.0.5";
    };
    "node_modules/get-package-type" = {
      key = "get-package-type/0.1.0";
    };
    "node_modules/get-stream" = {
      key = "get-stream/4.1.0";
    };
    "node_modules/get-value" = {
      key = "get-value/2.0.6";
    };
    "node_modules/getpass" = {
      key = "getpass/0.1.7";
    };
    "node_modules/glob" = {
      key = "glob/7.2.3";
    };
    "node_modules/globals" = {
      key = "globals/11.12.0";
    };
    "node_modules/graceful-fs" = {
      key = "graceful-fs/4.2.10";
    };
    "node_modules/har-schema" = {
      key = "har-schema/2.0.0";
    };
    "node_modules/har-validator" = {
      key = "har-validator/5.1.5";
    };
    "node_modules/has" = {
      key = "has/1.0.3";
    };
    "node_modules/has-flag" = {
      key = "has-flag/4.0.0";
    };
    "node_modules/has-value" = {
      key = "has-value/1.0.0";
    };
    "node_modules/has-values" = {
      key = "has-values/1.0.0";
    };
    "node_modules/has-values/node_modules/is-number" = {
      key = "is-number/3.0.0";
    };
    "node_modules/has-values/node_modules/is-number/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/has-values/node_modules/kind-of" = {
      key = "kind-of/4.0.0";
    };
    "node_modules/hosted-git-info" = {
      key = "hosted-git-info/2.8.9";
    };
    "node_modules/html-encoding-sniffer" = {
      key = "html-encoding-sniffer/1.0.2";
    };
    "node_modules/http-signature" = {
      key = "http-signature/1.2.0";
    };
    "node_modules/iconv-lite" = {
      key = "iconv-lite/0.4.24";
    };
    "node_modules/imurmurhash" = {
      key = "imurmurhash/0.1.4";
    };
    "node_modules/inflight" = {
      key = "inflight/1.0.6";
    };
    "node_modules/inherits" = {
      key = "inherits/2.0.4";
    };
    "node_modules/ip-regex" = {
      key = "ip-regex/2.1.0";
    };
    "node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/1.0.0";
    };
    "node_modules/is-arrayish" = {
      key = "is-arrayish/0.2.1";
    };
    "node_modules/is-buffer" = {
      key = "is-buffer/1.1.6";
    };
    "node_modules/is-ci" = {
      key = "is-ci/2.0.0";
    };
    "node_modules/is-core-module" = {
      key = "is-core-module/2.11.0";
    };
    "node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/1.0.0";
    };
    "node_modules/is-descriptor" = {
      key = "is-descriptor/1.0.2";
    };
    "node_modules/is-extendable" = {
      key = "is-extendable/1.0.1";
    };
    "node_modules/is-fullwidth-code-point" = {
      key = "is-fullwidth-code-point/3.0.0";
    };
    "node_modules/is-generator-fn" = {
      key = "is-generator-fn/2.1.0";
    };
    "node_modules/is-number" = {
      key = "is-number/7.0.0";
    };
    "node_modules/is-plain-object" = {
      key = "is-plain-object/2.0.4";
    };
    "node_modules/is-stream" = {
      key = "is-stream/1.1.0";
    };
    "node_modules/is-typedarray" = {
      key = "is-typedarray/1.0.0";
    };
    "node_modules/is-windows" = {
      key = "is-windows/1.0.2";
    };
    "node_modules/isarray" = {
      key = "isarray/1.0.0";
    };
    "node_modules/isexe" = {
      key = "isexe/2.0.0";
    };
    "node_modules/isobject" = {
      key = "isobject/3.0.1";
    };
    "node_modules/isstream" = {
      key = "isstream/0.1.2";
    };
    "node_modules/istanbul-lib-coverage" = {
      key = "istanbul-lib-coverage/3.2.0";
    };
    "node_modules/istanbul-lib-instrument" = {
      key = "istanbul-lib-instrument/5.2.1";
    };
    "node_modules/jest-diff" = {
      key = "jest-diff/25.5.0";
    };
    "node_modules/jest-docblock" = {
      key = "jest-docblock/25.3.0";
    };
    "node_modules/jest-each" = {
      key = "jest-each/25.5.0";
    };
    "node_modules/jest-environment-jsdom" = {
      key = "jest-environment-jsdom/25.5.0";
    };
    "node_modules/jest-environment-node" = {
      key = "jest-environment-node/25.5.0";
    };
    "node_modules/jest-get-type" = {
      key = "jest-get-type/25.2.6";
    };
    "node_modules/jest-haste-map" = {
      key = "jest-haste-map/25.5.1";
    };
    "node_modules/jest-jasmine2" = {
      key = "jest-jasmine2/25.5.4";
    };
    "node_modules/jest-leak-detector" = {
      key = "jest-leak-detector/25.5.0";
    };
    "node_modules/jest-matcher-utils" = {
      key = "jest-matcher-utils/25.5.0";
    };
    "node_modules/jest-message-util" = {
      key = "jest-message-util/25.5.0";
    };
    "node_modules/jest-mock" = {
      key = "jest-mock/25.5.0";
    };
    "node_modules/jest-pnp-resolver" = {
      key = "jest-pnp-resolver/1.2.3";
    };
    "node_modules/jest-regex-util" = {
      key = "jest-regex-util/25.2.6";
    };
    "node_modules/jest-resolve" = {
      key = "jest-resolve/25.5.1";
    };
    "node_modules/jest-runner" = {
      key = "jest-runner/25.5.4";
    };
    "node_modules/jest-runtime" = {
      key = "jest-runtime/25.5.4";
    };
    "node_modules/jest-serializer" = {
      key = "jest-serializer/25.5.0";
    };
    "node_modules/jest-snapshot" = {
      key = "jest-snapshot/25.5.1";
    };
    "node_modules/jest-util" = {
      key = "jest-util/25.5.0";
    };
    "node_modules/jest-validate" = {
      key = "jest-validate/25.5.0";
    };
    "node_modules/jest-worker" = {
      key = "jest-worker/25.5.0";
    };
    "node_modules/js-tokens" = {
      key = "js-tokens/4.0.0";
    };
    "node_modules/js-yaml" = {
      key = "js-yaml/3.14.1";
    };
    "node_modules/jsbn" = {
      key = "jsbn/0.1.1";
    };
    "node_modules/jsdom" = {
      key = "jsdom/15.2.1";
    };
    "node_modules/jsesc" = {
      key = "jsesc/2.5.2";
    };
    "node_modules/json-parse-even-better-errors" = {
      key = "json-parse-even-better-errors/2.3.1";
    };
    "node_modules/json-schema" = {
      key = "json-schema/0.4.0";
    };
    "node_modules/json-schema-traverse" = {
      key = "json-schema-traverse/0.4.1";
    };
    "node_modules/json-stringify-safe" = {
      key = "json-stringify-safe/5.0.1";
    };
    "node_modules/json5" = {
      key = "json5/2.2.3";
    };
    "node_modules/jsprim" = {
      key = "jsprim/1.4.2";
    };
    "node_modules/kind-of" = {
      key = "kind-of/6.0.3";
    };
    "node_modules/leven" = {
      key = "leven/3.1.0";
    };
    "node_modules/levn" = {
      key = "levn/0.3.0";
    };
    "node_modules/lines-and-columns" = {
      key = "lines-and-columns/1.2.4";
    };
    "node_modules/locate-path" = {
      key = "locate-path/5.0.0";
    };
    "node_modules/lodash" = {
      key = "lodash/4.17.21";
    };
    "node_modules/lodash.sortby" = {
      key = "lodash.sortby/4.7.0";
    };
    "node_modules/lolex" = {
      key = "lolex/5.1.2";
    };
    "node_modules/lru-cache" = {
      key = "lru-cache/5.1.1";
    };
    "node_modules/make-dir" = {
      key = "make-dir/3.1.0";
    };
    "node_modules/makeerror" = {
      key = "makeerror/1.0.12";
    };
    "node_modules/map-cache" = {
      key = "map-cache/0.2.2";
    };
    "node_modules/map-visit" = {
      key = "map-visit/1.0.0";
    };
    "node_modules/merge-stream" = {
      key = "merge-stream/2.0.0";
    };
    "node_modules/micromatch" = {
      key = "micromatch/4.0.5";
    };
    "node_modules/mime-db" = {
      key = "mime-db/1.52.0";
    };
    "node_modules/mime-types" = {
      key = "mime-types/2.1.35";
    };
    "node_modules/minimatch" = {
      key = "minimatch/3.1.2";
    };
    "node_modules/minimist" = {
      key = "minimist/1.2.7";
    };
    "node_modules/mixin-deep" = {
      key = "mixin-deep/1.3.2";
    };
    "node_modules/ms" = {
      key = "ms/2.1.2";
    };
    "node_modules/nanomatch" = {
      key = "nanomatch/1.2.13";
    };
    "node_modules/natural-compare" = {
      key = "natural-compare/1.4.0";
    };
    "node_modules/nice-try" = {
      key = "nice-try/1.0.5";
    };
    "node_modules/node-int64" = {
      key = "node-int64/0.4.0";
    };
    "node_modules/node-releases" = {
      key = "node-releases/2.0.10";
    };
    "node_modules/normalize-package-data" = {
      key = "normalize-package-data/2.5.0";
    };
    "node_modules/normalize-package-data/node_modules/semver" = {
      key = "semver/5.7.1";
    };
    "node_modules/normalize-path" = {
      key = "normalize-path/3.0.0";
    };
    "node_modules/npm-run-path" = {
      key = "npm-run-path/2.0.2";
    };
    "node_modules/nwsapi" = {
      key = "nwsapi/2.2.2";
    };
    "node_modules/oauth-sign" = {
      key = "oauth-sign/0.9.0";
    };
    "node_modules/object-copy" = {
      key = "object-copy/0.1.0";
    };
    "node_modules/object-copy/node_modules/define-property" = {
      key = "define-property/0.2.5";
    };
    "node_modules/object-copy/node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/0.1.6";
    };
    "node_modules/object-copy/node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/0.1.4";
    };
    "node_modules/object-copy/node_modules/is-descriptor" = {
      key = "is-descriptor/0.1.6";
    };
    "node_modules/object-copy/node_modules/is-descriptor/node_modules/kind-of" = {
      key = "kind-of/5.1.0";
    };
    "node_modules/object-copy/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/object-visit" = {
      key = "object-visit/1.0.1";
    };
    "node_modules/object.pick" = {
      key = "object.pick/1.3.0";
    };
    "node_modules/once" = {
      key = "once/1.4.0";
    };
    "node_modules/optionator" = {
      key = "optionator/0.8.3";
    };
    "node_modules/p-finally" = {
      key = "p-finally/1.0.0";
    };
    "node_modules/p-limit" = {
      key = "p-limit/2.3.0";
    };
    "node_modules/p-locate" = {
      key = "p-locate/4.1.0";
    };
    "node_modules/p-try" = {
      key = "p-try/2.2.0";
    };
    "node_modules/parse-json" = {
      key = "parse-json/5.2.0";
    };
    "node_modules/parse5" = {
      key = "parse5/5.1.0";
    };
    "node_modules/pascalcase" = {
      key = "pascalcase/0.1.1";
    };
    "node_modules/path-exists" = {
      key = "path-exists/4.0.0";
    };
    "node_modules/path-is-absolute" = {
      key = "path-is-absolute/1.0.1";
    };
    "node_modules/path-key" = {
      key = "path-key/2.0.1";
    };
    "node_modules/path-parse" = {
      key = "path-parse/1.0.7";
    };
    "node_modules/performance-now" = {
      key = "performance-now/2.1.0";
    };
    "node_modules/picocolors" = {
      key = "picocolors/1.0.0";
    };
    "node_modules/picomatch" = {
      key = "picomatch/2.3.1";
    };
    "node_modules/pirates" = {
      key = "pirates/4.0.5";
    };
    "node_modules/pn" = {
      key = "pn/1.1.0";
    };
    "node_modules/posix-character-classes" = {
      key = "posix-character-classes/0.1.1";
    };
    "node_modules/prelude-ls" = {
      key = "prelude-ls/1.1.2";
    };
    "node_modules/pretty-format" = {
      key = "pretty-format/25.5.0";
    };
    "node_modules/psl" = {
      key = "psl/1.9.0";
    };
    "node_modules/pump" = {
      key = "pump/3.0.0";
    };
    "node_modules/punycode" = {
      key = "punycode/2.3.0";
    };
    "node_modules/qs" = {
      key = "qs/6.5.3";
    };
    "node_modules/react-is" = {
      key = "react-is/16.13.1";
    };
    "node_modules/read-pkg" = {
      key = "read-pkg/5.2.0";
    };
    "node_modules/read-pkg-up" = {
      key = "read-pkg-up/7.0.1";
    };
    "node_modules/read-pkg/node_modules/type-fest" = {
      key = "type-fest/0.6.0";
    };
    "node_modules/realpath-native" = {
      key = "realpath-native/2.0.0";
    };
    "node_modules/regex-not" = {
      key = "regex-not/1.0.2";
    };
    "node_modules/remove-trailing-separator" = {
      key = "remove-trailing-separator/1.1.0";
    };
    "node_modules/repeat-element" = {
      key = "repeat-element/1.1.4";
    };
    "node_modules/repeat-string" = {
      key = "repeat-string/1.6.1";
    };
    "node_modules/request" = {
      key = "request/2.88.2";
    };
    "node_modules/request-promise-core" = {
      key = "request-promise-core/1.1.4";
    };
    "node_modules/request-promise-native" = {
      key = "request-promise-native/1.0.9";
    };
    "node_modules/request-promise-native/node_modules/tough-cookie" = {
      key = "tough-cookie/2.5.0";
    };
    "node_modules/request/node_modules/tough-cookie" = {
      key = "tough-cookie/2.5.0";
    };
    "node_modules/require-directory" = {
      key = "require-directory/2.1.1";
    };
    "node_modules/require-main-filename" = {
      key = "require-main-filename/2.0.0";
    };
    "node_modules/resolve" = {
      key = "resolve/1.22.1";
    };
    "node_modules/resolve-from" = {
      key = "resolve-from/5.0.0";
    };
    "node_modules/resolve-url" = {
      key = "resolve-url/0.2.1";
    };
    "node_modules/ret" = {
      key = "ret/0.1.15";
    };
    "node_modules/rsvp" = {
      key = "rsvp/4.8.5";
    };
    "node_modules/safe-buffer" = {
      key = "safe-buffer/5.2.1";
    };
    "node_modules/safe-regex" = {
      key = "safe-regex/1.1.0";
    };
    "node_modules/safer-buffer" = {
      key = "safer-buffer/2.1.2";
    };
    "node_modules/sane" = {
      key = "sane/4.1.0";
    };
    "node_modules/sane/node_modules/anymatch" = {
      key = "anymatch/2.0.0";
    };
    "node_modules/sane/node_modules/braces" = {
      key = "braces/2.3.2";
    };
    "node_modules/sane/node_modules/braces/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/sane/node_modules/fill-range" = {
      key = "fill-range/4.0.0";
    };
    "node_modules/sane/node_modules/fill-range/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/sane/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/sane/node_modules/is-number" = {
      key = "is-number/3.0.0";
    };
    "node_modules/sane/node_modules/is-number/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/sane/node_modules/micromatch" = {
      key = "micromatch/3.1.10";
    };
    "node_modules/sane/node_modules/normalize-path" = {
      key = "normalize-path/2.1.1";
    };
    "node_modules/sane/node_modules/to-regex-range" = {
      key = "to-regex-range/2.1.1";
    };
    "node_modules/saxes" = {
      key = "saxes/3.1.11";
    };
    "node_modules/semver" = {
      key = "semver/6.3.0";
    };
    "node_modules/set-blocking" = {
      key = "set-blocking/2.0.0";
    };
    "node_modules/set-value" = {
      key = "set-value/2.0.1";
    };
    "node_modules/set-value/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/set-value/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/shebang-command" = {
      key = "shebang-command/1.2.0";
    };
    "node_modules/shebang-regex" = {
      key = "shebang-regex/1.0.0";
    };
    "node_modules/signal-exit" = {
      key = "signal-exit/3.0.7";
    };
    "node_modules/slash" = {
      key = "slash/3.0.0";
    };
    "node_modules/snapdragon" = {
      key = "snapdragon/0.8.2";
    };
    "node_modules/snapdragon-node" = {
      key = "snapdragon-node/2.1.1";
    };
    "node_modules/snapdragon-node/node_modules/define-property" = {
      key = "define-property/1.0.0";
    };
    "node_modules/snapdragon-util" = {
      key = "snapdragon-util/3.0.1";
    };
    "node_modules/snapdragon-util/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/snapdragon/node_modules/debug" = {
      key = "debug/2.6.9";
    };
    "node_modules/snapdragon/node_modules/define-property" = {
      key = "define-property/0.2.5";
    };
    "node_modules/snapdragon/node_modules/extend-shallow" = {
      key = "extend-shallow/2.0.1";
    };
    "node_modules/snapdragon/node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/0.1.6";
    };
    "node_modules/snapdragon/node_modules/is-accessor-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/snapdragon/node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/0.1.4";
    };
    "node_modules/snapdragon/node_modules/is-data-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/snapdragon/node_modules/is-descriptor" = {
      key = "is-descriptor/0.1.6";
    };
    "node_modules/snapdragon/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/snapdragon/node_modules/kind-of" = {
      key = "kind-of/5.1.0";
    };
    "node_modules/snapdragon/node_modules/ms" = {
      key = "ms/2.0.0";
    };
    "node_modules/snapdragon/node_modules/source-map" = {
      key = "source-map/0.5.7";
    };
    "node_modules/source-map" = {
      key = "source-map/0.6.1";
    };
    "node_modules/source-map-resolve" = {
      key = "source-map-resolve/0.5.3";
    };
    "node_modules/source-map-support" = {
      key = "source-map-support/0.5.21";
    };
    "node_modules/source-map-url" = {
      key = "source-map-url/0.4.1";
    };
    "node_modules/spdx-correct" = {
      key = "spdx-correct/3.1.1";
    };
    "node_modules/spdx-exceptions" = {
      key = "spdx-exceptions/2.3.0";
    };
    "node_modules/spdx-expression-parse" = {
      key = "spdx-expression-parse/3.0.1";
    };
    "node_modules/spdx-license-ids" = {
      key = "spdx-license-ids/3.0.12";
    };
    "node_modules/split-string" = {
      key = "split-string/3.1.0";
    };
    "node_modules/sprintf-js" = {
      key = "sprintf-js/1.0.3";
    };
    "node_modules/sshpk" = {
      key = "sshpk/1.17.0";
    };
    "node_modules/stack-utils" = {
      key = "stack-utils/1.0.5";
    };
    "node_modules/static-extend" = {
      key = "static-extend/0.1.2";
    };
    "node_modules/static-extend/node_modules/define-property" = {
      key = "define-property/0.2.5";
    };
    "node_modules/static-extend/node_modules/is-accessor-descriptor" = {
      key = "is-accessor-descriptor/0.1.6";
    };
    "node_modules/static-extend/node_modules/is-accessor-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/static-extend/node_modules/is-data-descriptor" = {
      key = "is-data-descriptor/0.1.4";
    };
    "node_modules/static-extend/node_modules/is-data-descriptor/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/static-extend/node_modules/is-descriptor" = {
      key = "is-descriptor/0.1.6";
    };
    "node_modules/static-extend/node_modules/kind-of" = {
      key = "kind-of/5.1.0";
    };
    "node_modules/stealthy-require" = {
      key = "stealthy-require/1.1.1";
    };
    "node_modules/string-width" = {
      key = "string-width/4.2.3";
    };
    "node_modules/strip-ansi" = {
      key = "strip-ansi/6.0.1";
    };
    "node_modules/strip-bom" = {
      key = "strip-bom/4.0.0";
    };
    "node_modules/strip-eof" = {
      key = "strip-eof/1.0.0";
    };
    "node_modules/supports-color" = {
      key = "supports-color/7.2.0";
    };
    "node_modules/supports-preserve-symlinks-flag" = {
      key = "supports-preserve-symlinks-flag/1.0.0";
    };
    "node_modules/symbol-tree" = {
      key = "symbol-tree/3.2.4";
    };
    "node_modules/test-exclude" = {
      key = "test-exclude/6.0.0";
    };
    "node_modules/throat" = {
      key = "throat/5.0.0";
    };
    "node_modules/tmpl" = {
      key = "tmpl/1.0.5";
    };
    "node_modules/to-fast-properties" = {
      key = "to-fast-properties/2.0.0";
    };
    "node_modules/to-object-path" = {
      key = "to-object-path/0.3.0";
    };
    "node_modules/to-object-path/node_modules/kind-of" = {
      key = "kind-of/3.2.2";
    };
    "node_modules/to-regex" = {
      key = "to-regex/3.0.2";
    };
    "node_modules/to-regex-range" = {
      key = "to-regex-range/5.0.1";
    };
    "node_modules/tough-cookie" = {
      key = "tough-cookie/3.0.1";
    };
    "node_modules/tr46" = {
      key = "tr46/1.0.1";
    };
    "node_modules/tunnel-agent" = {
      key = "tunnel-agent/0.6.0";
    };
    "node_modules/tweetnacl" = {
      key = "tweetnacl/0.14.5";
    };
    "node_modules/type-check" = {
      key = "type-check/0.3.2";
    };
    "node_modules/type-detect" = {
      key = "type-detect/4.0.8";
    };
    "node_modules/type-fest" = {
      key = "type-fest/0.8.1";
    };
    "node_modules/typedarray-to-buffer" = {
      key = "typedarray-to-buffer/3.1.5";
    };
    "node_modules/union-value" = {
      key = "union-value/1.0.1";
    };
    "node_modules/union-value/node_modules/is-extendable" = {
      key = "is-extendable/0.1.1";
    };
    "node_modules/unset-value" = {
      key = "unset-value/1.0.0";
    };
    "node_modules/unset-value/node_modules/has-value" = {
      key = "has-value/0.3.1";
    };
    "node_modules/unset-value/node_modules/has-value/node_modules/isobject" = {
      key = "isobject/2.1.0";
    };
    "node_modules/unset-value/node_modules/has-values" = {
      key = "has-values/0.1.4";
    };
    "node_modules/update-browserslist-db" = {
      key = "update-browserslist-db/1.0.10";
    };
    "node_modules/uri-js" = {
      key = "uri-js/4.4.1";
    };
    "node_modules/urix" = {
      key = "urix/0.1.0";
    };
    "node_modules/use" = {
      key = "use/3.1.1";
    };
    "node_modules/uuid" = {
      key = "uuid/3.4.0";
    };
    "node_modules/validate-npm-package-license" = {
      key = "validate-npm-package-license/3.0.4";
    };
    "node_modules/verror" = {
      key = "verror/1.10.0";
    };
    "node_modules/w3c-hr-time" = {
      key = "w3c-hr-time/1.0.2";
    };
    "node_modules/w3c-xmlserializer" = {
      key = "w3c-xmlserializer/1.1.2";
    };
    "node_modules/walker" = {
      key = "walker/1.0.8";
    };
    "node_modules/webidl-conversions" = {
      key = "webidl-conversions/4.0.2";
    };
    "node_modules/whatwg-encoding" = {
      key = "whatwg-encoding/1.0.5";
    };
    "node_modules/whatwg-mimetype" = {
      key = "whatwg-mimetype/2.3.0";
    };
    "node_modules/whatwg-url" = {
      key = "whatwg-url/7.1.0";
    };
    "node_modules/which" = {
      key = "which/2.0.2";
    };
    "node_modules/which-module" = {
      key = "which-module/2.0.0";
    };
    "node_modules/word-wrap" = {
      key = "word-wrap/1.2.3";
    };
    "node_modules/wrap-ansi" = {
      key = "wrap-ansi/6.2.0";
    };
    "node_modules/wrappy" = {
      key = "wrappy/1.0.2";
    };
    "node_modules/write-file-atomic" = {
      key = "write-file-atomic/3.0.3";
    };
    "node_modules/ws" = {
      key = "ws/7.5.9";
    };
    "node_modules/xml-name-validator" = {
      key = "xml-name-validator/3.0.0";
    };
    "node_modules/xmlchars" = {
      key = "xmlchars/2.2.0";
    };
    "node_modules/y18n" = {
      key = "y18n/4.0.3";
    };
    "node_modules/yallist" = {
      key = "yallist/3.1.1";
    };
    "node_modules/yargs" = {
      key = "yargs/15.4.1";
    };
    "node_modules/yargs-parser" = {
      key = "yargs-parser/18.1.3";
    };
  };
}

{
  floco = {
    pdefs = {
      "@ampproject/remapping" = {
        "2.2.0" = {
          depInfo = {
            "@jridgewell/gen-mapping" = {
              descriptor = "^0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.9";
              pin = "0.3.17";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fqn74UKWiyYk1poPyDIGx+9pH0rpAfjs+6xULBMktFQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.2.0.tgz";
          };
          ident = "@ampproject/remapping";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/gen-mapping" = {
              key = "@jridgewell/gen-mapping/0.1.1";
              link = true;
            };
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
          };
          version = "2.2.0";
        };
      };
      "@babel/code-frame" = {
        "7.18.6" = {
          depInfo = {
            "@babel/highlight" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-b/cq1rWfUNYTk9nGnFNgzIOpCj1MwRNZ4XiQflrV2kA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.18.6.tgz";
          };
          ident = "@babel/code-frame";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/highlight" = {
              key = "@babel/highlight/7.18.6";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/compat-data" = {
        "7.20.14" = {
          fetchInfo = {
            narHash = "sha256-pM7Mnzdt75zYb37WowTDyfWos1FT/7uGgEFYwmdSJ1Q=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.20.14.tgz";
          };
          ident = "@babel/compat-data";
          ltype = "file";
          treeInfo = { };
          version = "7.20.14";
        };
      };
      "@babel/core" = {
        "7.20.12" = {
          depInfo = {
            "@ampproject/remapping" = {
              descriptor = "^2.1.0";
              pin = "2.2.0";
              runtime = true;
            };
            "@babel/code-frame" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/generator" = {
              descriptor = "^7.20.7";
              pin = "7.20.14";
              runtime = true;
            };
            "@babel/helper-compilation-targets" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/helper-module-transforms" = {
              descriptor = "^7.20.11";
              pin = "7.20.11";
              runtime = true;
            };
            "@babel/helpers" = {
              descriptor = "^7.20.7";
              pin = "7.20.13";
              runtime = true;
            };
            "@babel/parser" = {
              descriptor = "^7.20.7";
              pin = "7.20.15";
              runtime = true;
            };
            "@babel/template" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/traverse" = {
              descriptor = "^7.20.12";
              pin = "7.20.13";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            convert-source-map = {
              descriptor = "^1.7.0";
              pin = "1.9.0";
              runtime = true;
            };
            debug = {
              descriptor = "^4.1.0";
              pin = "4.3.4";
              runtime = true;
            };
            gensync = {
              descriptor = "^1.0.0-beta.2";
              pin = "1.0.0-beta.2";
              runtime = true;
            };
            json5 = {
              descriptor = "^2.2.2";
              pin = "2.2.3";
              runtime = true;
            };
            semver = {
              descriptor = "^6.3.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-qt4a/Cy3gmr8dY0H7zrYwPR976CNB1LqixBdmK27fLs=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/core/-/core-7.20.12.tgz";
          };
          ident = "@babel/core";
          ltype = "file";
          treeInfo = {
            "node_modules/@ampproject/remapping" = {
              key = "@ampproject/remapping/2.2.0";
              link = true;
            };
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
              link = true;
            };
            "node_modules/@babel/generator" = {
              key = "@babel/generator/7.20.14";
              link = true;
            };
            "node_modules/@babel/helper-compilation-targets" = {
              key = "@babel/helper-compilation-targets/7.20.7";
              link = true;
            };
            "node_modules/@babel/helper-module-transforms" = {
              key = "@babel/helper-module-transforms/7.20.11";
              link = true;
            };
            "node_modules/@babel/helpers" = {
              key = "@babel/helpers/7.20.13";
              link = true;
            };
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
              link = true;
            };
            "node_modules/@babel/traverse" = {
              key = "@babel/traverse/7.20.13";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/convert-source-map" = {
              key = "convert-source-map/1.9.0";
              link = true;
            };
            "node_modules/debug" = {
              key = "debug/4.3.4";
              link = true;
            };
            "node_modules/gensync" = {
              key = "gensync/1.0.0-beta.2";
              link = true;
            };
            "node_modules/json5" = {
              key = "json5/2.2.3";
              link = true;
            };
            "node_modules/semver" = {
              key = "semver/6.3.0";
              link = true;
            };
          };
          version = "7.20.12";
        };
      };
      "@babel/generator" = {
        "7.20.14" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@jridgewell/gen-mapping" = {
              descriptor = "^0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            jsesc = {
              descriptor = "^2.5.1";
              pin = "2.5.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5t19l4YvMpyAL3fjmgN47CUHwoPYUNm6SlEmYgdRei0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/generator/-/generator-7.20.14.tgz";
          };
          ident = "@babel/generator";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/@jridgewell/gen-mapping" = {
              key = "@jridgewell/gen-mapping/0.3.2";
              link = true;
            };
            "node_modules/jsesc" = {
              key = "jsesc/2.5.2";
              link = true;
            };
          };
          version = "7.20.14";
        };
      };
      "@babel/helper-compilation-targets" = {
        "7.20.7" = {
          depInfo = {
            "@babel/compat-data" = {
              descriptor = "^7.20.5";
              pin = "7.20.14";
              runtime = true;
            };
            "@babel/helper-validator-option" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            browserslist = {
              descriptor = "^4.21.3";
              pin = "4.21.5";
              runtime = true;
            };
            lru-cache = {
              descriptor = "^5.1.1";
              pin = "5.1.1";
              runtime = true;
            };
            semver = {
              descriptor = "^6.3.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5qMz4QgaORNJtXS1rA4HdFfO6V1bAWNZ6H6UaQhnbpI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.20.7.tgz";
          };
          ident = "@babel/helper-compilation-targets";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0"; }; };
          treeInfo = {
            "node_modules/@babel/compat-data" = {
              key = "@babel/compat-data/7.20.14";
              link = true;
            };
            "node_modules/@babel/helper-validator-option" = {
              key = "@babel/helper-validator-option/7.18.6";
              link = true;
            };
            "node_modules/browserslist" = {
              key = "browserslist/4.21.5";
              link = true;
            };
            "node_modules/lru-cache" = {
              key = "lru-cache/5.1.1";
              link = true;
            };
            "node_modules/semver" = {
              key = "semver/6.3.0";
              link = true;
            };
          };
          version = "7.20.7";
        };
      };
      "@babel/helper-environment-visitor" = {
        "7.18.9" = {
          fetchInfo = {
            narHash = "sha256-6CXg+OOoaCu8sOnMIVH5oWqYJ4+0vrvy3WRYqxGu0OM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-environment-visitor/-/helper-environment-visitor-7.18.9.tgz";
          };
          ident = "@babel/helper-environment-visitor";
          ltype = "file";
          treeInfo = { };
          version = "7.18.9";
        };
      };
      "@babel/helper-function-name" = {
        "7.19.0" = {
          depInfo = {
            "@babel/template" = {
              descriptor = "^7.18.10";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.19.0";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-VC+iwlAPre/V+8BAN3BaxhHF4II6G6hYEHJ0Ki+X71w=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-function-name/-/helper-function-name-7.19.0.tgz";
          };
          ident = "@babel/helper-function-name";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.19.0";
        };
      };
      "@babel/helper-hoist-variables" = {
        "7.18.6" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.18.6";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-caTDmWIqhFUaJZTAxWcAP7XEbCr7kIEwKyR7AxRWUrU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-hoist-variables/-/helper-hoist-variables-7.18.6.tgz";
          };
          ident = "@babel/helper-hoist-variables";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/helper-module-imports" = {
        "7.18.6" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.18.6";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-L2sf1oQENZR9yFuq46o604mgt+4srfRF81peciAEL5E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.18.6.tgz";
          };
          ident = "@babel/helper-module-imports";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/helper-module-transforms" = {
        "7.20.11" = {
          depInfo = {
            "@babel/helper-environment-visitor" = {
              descriptor = "^7.18.9";
              pin = "7.18.9";
              runtime = true;
            };
            "@babel/helper-module-imports" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/helper-simple-access" = {
              descriptor = "^7.20.2";
              pin = "7.20.2";
              runtime = true;
            };
            "@babel/helper-split-export-declaration" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/helper-validator-identifier" = {
              descriptor = "^7.19.1";
              pin = "7.19.1";
              runtime = true;
            };
            "@babel/template" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/traverse" = {
              descriptor = "^7.20.10";
              pin = "7.20.13";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vcTyFe299Cko+BGbmLsqP2HmRJK9jKaB10d0TknVGSA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.20.11.tgz";
          };
          ident = "@babel/helper-module-transforms";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/helper-environment-visitor" = {
              key = "@babel/helper-environment-visitor/7.18.9";
              link = true;
            };
            "node_modules/@babel/helper-module-imports" = {
              key = "@babel/helper-module-imports/7.18.6";
              link = true;
            };
            "node_modules/@babel/helper-simple-access" = {
              key = "@babel/helper-simple-access/7.20.2";
              link = true;
            };
            "node_modules/@babel/helper-split-export-declaration" = {
              key = "@babel/helper-split-export-declaration/7.18.6";
              link = true;
            };
            "node_modules/@babel/helper-validator-identifier" = {
              key = "@babel/helper-validator-identifier/7.19.1";
              link = true;
            };
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
              link = true;
            };
            "node_modules/@babel/traverse" = {
              key = "@babel/traverse/7.20.13";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.20.11";
        };
      };
      "@babel/helper-plugin-utils" = {
        "7.20.2" = {
          fetchInfo = {
            narHash = "sha256-7z/gPAcPH95idoeUHVE8AbImHYhNfu5a0SB9gdrosVs=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.20.2.tgz";
          };
          ident = "@babel/helper-plugin-utils";
          ltype = "file";
          treeInfo = { };
          version = "7.20.2";
        };
      };
      "@babel/helper-simple-access" = {
        "7.20.2" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.20.2";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-b392PPfLcHu84mcT9ro39qlbEngz1SiPZ5hEjKNumg4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-simple-access/-/helper-simple-access-7.20.2.tgz";
          };
          ident = "@babel/helper-simple-access";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.20.2";
        };
      };
      "@babel/helper-split-export-declaration" = {
        "7.18.6" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.18.6";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vnaxvlHZtGt2Cf4NVnBQc77EAtWAr9rt/HIkW367bGU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.18.6.tgz";
          };
          ident = "@babel/helper-split-export-declaration";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/helper-string-parser" = {
        "7.19.4" = {
          fetchInfo = {
            narHash = "sha256-kshJlXC/PxL8I4AUvNn+9gQMBscRbgRdSToKh+okk6k=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.19.4.tgz";
          };
          ident = "@babel/helper-string-parser";
          ltype = "file";
          treeInfo = { };
          version = "7.19.4";
        };
      };
      "@babel/helper-validator-identifier" = {
        "7.19.1" = {
          fetchInfo = {
            narHash = "sha256-5i3zktWPaSpLhcTkU8LcCGwORI6ZZeeG8kWf00uPnr8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.19.1.tgz";
          };
          ident = "@babel/helper-validator-identifier";
          ltype = "file";
          treeInfo = { };
          version = "7.19.1";
        };
      };
      "@babel/helper-validator-option" = {
        "7.18.6" = {
          fetchInfo = {
            narHash = "sha256-D3Bv/YqkT8jsf81i2Um1/qB9Fn5IM2PkP6zF1g2Ex3c=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.18.6.tgz";
          };
          ident = "@babel/helper-validator-option";
          ltype = "file";
          treeInfo = { };
          version = "7.18.6";
        };
      };
      "@babel/helpers" = {
        "7.20.13" = {
          depInfo = {
            "@babel/template" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/traverse" = {
              descriptor = "^7.20.13";
              pin = "7.20.13";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-sm4CFqUGSoNVRjEUWacfdAo1Vo7pd5Q+kcMnTSPsIds=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/helpers/-/helpers-7.20.13.tgz";
          };
          ident = "@babel/helpers";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
              link = true;
            };
            "node_modules/@babel/traverse" = {
              key = "@babel/traverse/7.20.13";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.20.13";
        };
      };
      "@babel/highlight" = {
        "7.18.6" = {
          depInfo = {
            "@babel/helper-validator-identifier" = {
              descriptor = "^7.18.6";
              pin = "7.19.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^2.0.0";
              pin = "2.4.2";
              runtime = true;
            };
            js-tokens = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8YM2ZQOKLzibv9H3Y5v4G7TsA5v4Sxz8wD7hsruTrVE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/highlight/-/highlight-7.18.6.tgz";
          };
          ident = "@babel/highlight";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/helper-validator-identifier" = {
              key = "@babel/helper-validator-identifier/7.19.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/2.4.2";
              link = true;
            };
            "node_modules/js-tokens" = {
              key = "js-tokens/4.0.0";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/parser" = {
        "7.20.15" = {
          binInfo = { binPairs = { parser = "bin/babel-parser.js"; }; };
          fetchInfo = {
            narHash = "sha256-lkwhz18Ino5243Fob9tH8SdjekZh7Y2yJRUVJXtSjnA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/parser/-/parser-7.20.15.tgz";
          };
          ident = "@babel/parser";
          ltype = "file";
          treeInfo = { };
          version = "7.20.15";
        };
      };
      "@babel/plugin-syntax-async-generators" = {
        "7.8.4" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-9/emNrhV+VHJcl1CXrJoVXceOnwx/no73gRWZhveXDk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz";
          };
          ident = "@babel/plugin-syntax-async-generators";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.4";
        };
      };
      "@babel/plugin-syntax-bigint" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ZmH+j+SjXgEcl0LDyFRyKTai848EKBCrGUeTwSY37NQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-bigint";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-class-properties" = {
        "7.12.13" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.12.13";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-selgFXein2u4D3gUBeaP5kiMF8Da37HjgeWj8llksQI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz";
          };
          ident = "@babel/plugin-syntax-class-properties";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.12.13";
        };
      };
      "@babel/plugin-syntax-import-meta" = {
        "7.10.4" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.10.4";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-i/fheZDmTxCs3FWlHNF1P1/RqANf8lHVmUNmMMtEo18=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-import-meta";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.10.4";
        };
      };
      "@babel/plugin-syntax-json-strings" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hCT4Qd41T0vYfKWnm6WXAwlJiSaDTETO3mDSgqGkTqM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-json-strings";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-jsx" = {
        "7.18.6" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.18.6";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lUer8+sF925Qk7UdNiFtcQswBLEFj/Zor0XyalkFhZQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.18.6.tgz";
          };
          ident = "@babel/plugin-syntax-jsx";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.18.6";
        };
      };
      "@babel/plugin-syntax-logical-assignment-operators" = {
        "7.10.4" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.10.4";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-VZmA/PePQ+8WJCpUs2HGmsCP8NyCJTypCO2sqKxur58=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-logical-assignment-operators";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.10.4";
        };
      };
      "@babel/plugin-syntax-nullish-coalescing-operator" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-AJypkOls3PPmGzeRCkREGE131yHE9/57DzegYwCDGtM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-nullish-coalescing-operator";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-numeric-separator" = {
        "7.10.4" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.10.4";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-m07GEQy/cmBs4IoKArDhvzx/kiCaA1pBPeg1hn04/X4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-numeric-separator";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.10.4";
        };
      };
      "@babel/plugin-syntax-object-rest-spread" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-mPdxrDeUY0zI2M9QktFNnc7pt/Oh9w7EuoCITATleOc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-object-rest-spread";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-optional-catch-binding" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wJIs2CiVURlzG9RZji8qHd/prYLjuC6IIOis+gk5QMM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-optional-catch-binding";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-optional-chaining" = {
        "7.8.3" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.8.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-pXsH6p12I37CLBfE5ZdcMAXRVHMBCkmKNilvSoAoY+s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-optional-chaining";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.8.3";
        };
      };
      "@babel/plugin-syntax-top-level-await" = {
        "7.14.5" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.14.5";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-rW5bQ6vunS/ONImTJuL1bdJvJLCG0qxPUQTy38EiM18=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz";
          };
          ident = "@babel/plugin-syntax-top-level-await";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.14.5";
        };
      };
      "@babel/plugin-syntax-typescript" = {
        "7.20.0" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.19.0";
              pin = "7.20.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OyOkWRokE1ipCEOU/TV/35OmRvADPUHG94HuHlFiWAI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.20.0.tgz";
          };
          ident = "@babel/plugin-syntax-typescript";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0-0"; }; };
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
          };
          version = "7.20.0";
        };
      };
      "@babel/template" = {
        "7.20.7" = {
          depInfo = {
            "@babel/code-frame" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/parser" = {
              descriptor = "^7.20.7";
              pin = "7.20.15";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-qU8hyHyA9JxmFg1K/mz1NW6ypHDjO9WY/bFuyX9TnkA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/template/-/template-7.20.7.tgz";
          };
          ident = "@babel/template";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
              link = true;
            };
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.20.7";
        };
      };
      "@babel/traverse" = {
        "7.20.13" = {
          depInfo = {
            "@babel/code-frame" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/generator" = {
              descriptor = "^7.20.7";
              pin = "7.20.14";
              runtime = true;
            };
            "@babel/helper-environment-visitor" = {
              descriptor = "^7.18.9";
              pin = "7.18.9";
              runtime = true;
            };
            "@babel/helper-function-name" = {
              descriptor = "^7.19.0";
              pin = "7.19.0";
              runtime = true;
            };
            "@babel/helper-hoist-variables" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/helper-split-export-declaration" = {
              descriptor = "^7.18.6";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/parser" = {
              descriptor = "^7.20.13";
              pin = "7.20.15";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            debug = {
              descriptor = "^4.1.0";
              pin = "4.3.4";
              runtime = true;
            };
            globals = {
              descriptor = "^11.1.0";
              pin = "11.12.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-JHxfDYn7CgDTYjYQmMfVRiT4njMng6T9qrnsYj13EYQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@babel/traverse/-/traverse-7.20.13.tgz";
          };
          ident = "@babel/traverse";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
              link = true;
            };
            "node_modules/@babel/generator" = {
              key = "@babel/generator/7.20.14";
              link = true;
            };
            "node_modules/@babel/helper-environment-visitor" = {
              key = "@babel/helper-environment-visitor/7.18.9";
              link = true;
            };
            "node_modules/@babel/helper-function-name" = {
              key = "@babel/helper-function-name/7.19.0";
              link = true;
            };
            "node_modules/@babel/helper-hoist-variables" = {
              key = "@babel/helper-hoist-variables/7.18.6";
              link = true;
            };
            "node_modules/@babel/helper-split-export-declaration" = {
              key = "@babel/helper-split-export-declaration/7.18.6";
              link = true;
            };
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/debug" = {
              key = "debug/4.3.4";
              link = true;
            };
            "node_modules/globals" = {
              key = "globals/11.12.0";
              link = true;
            };
          };
          version = "7.20.13";
        };
      };
      "@babel/types" = {
        "7.20.7" = {
          depInfo = {
            "@babel/helper-string-parser" = {
              descriptor = "^7.19.4";
              pin = "7.19.4";
              runtime = true;
            };
            "@babel/helper-validator-identifier" = {
              descriptor = "^7.19.1";
              pin = "7.19.1";
              runtime = true;
            };
            to-fast-properties = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-MIl1RErmeb1iT9IPqZKrqva32BcJOzrkDvjp1K1/FEM=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/types/-/types-7.20.7.tgz";
          };
          ident = "@babel/types";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/helper-string-parser" = {
              key = "@babel/helper-string-parser/7.19.4";
              link = true;
            };
            "node_modules/@babel/helper-validator-identifier" = {
              key = "@babel/helper-validator-identifier/7.19.1";
              link = true;
            };
            "node_modules/to-fast-properties" = {
              key = "to-fast-properties/2.0.0";
              link = true;
            };
          };
          version = "7.20.7";
        };
      };
      "@bcoe/v8-coverage" = {
        "0.2.3" = {
          fetchInfo = {
            narHash = "sha256-IEMvAq0Fi3/i/XjNfhU8STSIp/XVGjGWpd+ojpZ1r5s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz";
          };
          ident = "@bcoe/v8-coverage";
          ltype = "file";
          treeInfo = { };
          version = "0.2.3";
        };
      };
      "@istanbuljs/load-nyc-config" = {
        "1.1.0" = {
          depInfo = {
            camelcase = {
              descriptor = "^5.3.1";
              pin = "5.3.1";
              runtime = true;
            };
            find-up = {
              descriptor = "^4.1.0";
              pin = "4.1.0";
              runtime = true;
            };
            get-package-type = {
              descriptor = "^0.1.0";
              pin = "0.1.0";
              runtime = true;
            };
            js-yaml = {
              descriptor = "^3.13.1";
              pin = "3.14.1";
              runtime = true;
            };
            resolve-from = {
              descriptor = "^5.0.0";
              pin = "5.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LWYSi5zbGIqK85x9K09tMl+AfHvqY0dQMqcEZZK7/n4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz";
          };
          ident = "@istanbuljs/load-nyc-config";
          ltype = "file";
          treeInfo = {
            "node_modules/camelcase" = {
              key = "camelcase/5.3.1";
              link = true;
            };
            "node_modules/find-up" = {
              key = "find-up/4.1.0";
              link = true;
            };
            "node_modules/get-package-type" = {
              key = "get-package-type/0.1.0";
              link = true;
            };
            "node_modules/js-yaml" = {
              key = "js-yaml/3.14.1";
              link = true;
            };
            "node_modules/resolve-from" = {
              key = "resolve-from/5.0.0";
              link = true;
            };
          };
          version = "1.1.0";
        };
      };
      "@istanbuljs/schema" = {
        "0.1.3" = {
          fetchInfo = {
            narHash = "sha256-Xqwdgx5lnaVLsBs7+38TSnPd2EzlG1XIwdv0UvRB8No=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@istanbuljs/schema/-/schema-0.1.3.tgz";
          };
          ident = "@istanbuljs/schema";
          ltype = "file";
          treeInfo = { };
          version = "0.1.3";
        };
      };
      "@jest/console" = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-VVx65WNlZ0gLCtA64+J1ztuTeDqwU/6xMA6BCjmZmV0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/console/-/console-29.4.1.tgz";
          };
          ident = "@jest/console";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/core" = {
        "29.4.1" = {
          depInfo = {
            "@jest/console" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/reporters" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            ansi-escapes = {
              descriptor = "^4.2.1";
              pin = "4.3.2";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            ci-info = {
              descriptor = "^3.2.0";
              pin = "3.7.1";
              runtime = true;
            };
            exit = {
              descriptor = "^0.1.2";
              pin = "0.1.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-changed-files = {
              descriptor = "^29.4.0";
              pin = "29.4.0";
              runtime = true;
            };
            jest-config = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-resolve-dependencies = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-runner = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-runtime = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-watcher = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fI7Uh9AVUtA08Slea9iS1CdI0etJswQDbANH6bMDJQg=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/core/-/core-29.4.1.tgz";
          };
          ident = "@jest/core";
          ltype = "file";
          peerInfo = {
            node-notifier = {
              descriptor = "^8.0.1 || ^9.0.0 || ^10.0.0";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/@jest/console" = {
              key = "@jest/console/29.4.1";
              link = true;
            };
            "node_modules/@jest/reporters" = {
              key = "@jest/reporters/29.4.1";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/ansi-escapes" = {
              key = "ansi-escapes/4.3.2";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/ci-info" = {
              key = "ci-info/3.7.1";
              link = true;
            };
            "node_modules/exit" = {
              key = "exit/0.1.2";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-changed-files" = {
              key = "jest-changed-files/29.4.0";
              link = true;
            };
            "node_modules/jest-config" = {
              key = "jest-config/29.4.1";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-resolve" = {
              key = "jest-resolve/29.4.1";
              link = true;
            };
            "node_modules/jest-resolve-dependencies" = {
              key = "jest-resolve-dependencies/29.4.1";
              link = true;
            };
            "node_modules/jest-runner" = {
              key = "jest-runner/29.4.1";
              link = true;
            };
            "node_modules/jest-runtime" = {
              key = "jest-runtime/29.4.1";
              link = true;
            };
            "node_modules/jest-snapshot" = {
              key = "jest-snapshot/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-validate" = {
              key = "jest-validate/29.4.1";
              link = true;
            };
            "node_modules/jest-watcher" = {
              key = "jest-watcher/29.4.1";
              link = true;
            };
            "node_modules/micromatch" = {
              key = "micromatch/4.0.5";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/environment" = {
        "29.4.1" = {
          depInfo = {
            "@jest/fake-timers" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8bd+yQeNmyvB1I3UaDwmb7IwaUO6YZHkhzCUK515/uo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/environment/-/environment-29.4.1.tgz";
          };
          ident = "@jest/environment";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/fake-timers" = {
              key = "@jest/fake-timers/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/jest-mock" = {
              key = "jest-mock/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/expect" = {
        "29.4.1" = {
          depInfo = {
            expect = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-zXfF7GSKqnZYPPcQwCC5n14Q/bGaOI1W9Dw1nbHo5uI=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/expect/-/expect-29.4.1.tgz";
          };
          ident = "@jest/expect";
          ltype = "file";
          treeInfo = {
            "node_modules/expect" = {
              key = "expect/29.4.1";
              link = true;
            };
            "node_modules/jest-snapshot" = {
              key = "jest-snapshot/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/expect-utils" = {
        "29.4.1" = {
          depInfo = {
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HgfQcU7bFT3YwZjhE+dlZpnazpplaJQEk8MgGzhtUyc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/expect-utils/-/expect-utils-29.4.1.tgz";
          };
          ident = "@jest/expect-utils";
          ltype = "file";
          treeInfo = {
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/fake-timers" = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@sinonjs/fake-timers" = {
              descriptor = "^10.0.2";
              pin = "10.0.2";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hA+6fcgOJyHkQ7FXZhxA4kOCli5Q0fBqo/OnIpLlgck=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/fake-timers/-/fake-timers-29.4.1.tgz";
          };
          ident = "@jest/fake-timers";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@sinonjs/fake-timers" = {
              key = "@sinonjs/fake-timers/10.0.2";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-mock" = {
              key = "jest-mock/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/globals" = {
        "29.4.1" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/expect" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-SK75JQYAKw07mV7AsLVurfJwlr5M0vvL8gMpL6u2r0M=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/globals/-/globals-29.4.1.tgz";
          };
          ident = "@jest/globals";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
              link = true;
            };
            "node_modules/@jest/expect" = {
              key = "@jest/expect/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/jest-mock" = {
              key = "jest-mock/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/reporters" = {
        "29.4.1" = {
          depInfo = {
            "@bcoe/v8-coverage" = {
              descriptor = "^0.2.3";
              pin = "0.2.3";
              runtime = true;
            };
            "@jest/console" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.15";
              pin = "0.3.17";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            collect-v8-coverage = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
            exit = {
              descriptor = "^0.1.2";
              pin = "0.1.2";
              runtime = true;
            };
            glob = {
              descriptor = "^7.1.3";
              pin = "7.2.3";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            istanbul-lib-coverage = {
              descriptor = "^3.0.0";
              pin = "3.2.0";
              runtime = true;
            };
            istanbul-lib-instrument = {
              descriptor = "^5.1.0";
              pin = "5.2.1";
              runtime = true;
            };
            istanbul-lib-report = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            istanbul-lib-source-maps = {
              descriptor = "^4.0.0";
              pin = "4.0.1";
              runtime = true;
            };
            istanbul-reports = {
              descriptor = "^3.1.3";
              pin = "3.1.5";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-worker = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            string-length = {
              descriptor = "^4.0.1";
              pin = "4.0.2";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
            v8-to-istanbul = {
              descriptor = "^9.0.1";
              pin = "9.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5kDGb2dR2pQy8Hat97cR1YOf382iMlMF9wV7QrZR/MI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/reporters/-/reporters-29.4.1.tgz";
          };
          ident = "@jest/reporters";
          ltype = "file";
          peerInfo = {
            node-notifier = {
              descriptor = "^8.0.1 || ^9.0.0 || ^10.0.0";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/@bcoe/v8-coverage" = {
              key = "@bcoe/v8-coverage/0.2.3";
              link = true;
            };
            "node_modules/@jest/console" = {
              key = "@jest/console/29.4.1";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/collect-v8-coverage" = {
              key = "collect-v8-coverage/1.0.1";
              link = true;
            };
            "node_modules/exit" = {
              key = "exit/0.1.2";
              link = true;
            };
            "node_modules/glob" = {
              key = "glob/7.2.3";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/istanbul-lib-coverage" = {
              key = "istanbul-lib-coverage/3.2.0";
              link = true;
            };
            "node_modules/istanbul-lib-instrument" = {
              key = "istanbul-lib-instrument/5.2.1";
              link = true;
            };
            "node_modules/istanbul-lib-report" = {
              key = "istanbul-lib-report/3.0.0";
              link = true;
            };
            "node_modules/istanbul-lib-source-maps" = {
              key = "istanbul-lib-source-maps/4.0.1";
              link = true;
            };
            "node_modules/istanbul-reports" = {
              key = "istanbul-reports/3.1.5";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-worker" = {
              key = "jest-worker/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/string-length" = {
              key = "string-length/4.0.2";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
            "node_modules/v8-to-istanbul" = {
              key = "v8-to-istanbul/9.0.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/schemas" = {
        "29.4.0" = {
          depInfo = {
            "@sinclair/typebox" = {
              descriptor = "^0.25.16";
              pin = "0.25.21";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-K/DliXhcKFNyyWCXs5PqVDd4ckupOSbrBLIvA4Hhj38=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/schemas/-/schemas-29.4.0.tgz";
          };
          ident = "@jest/schemas";
          ltype = "file";
          treeInfo = {
            "node_modules/@sinclair/typebox" = {
              key = "@sinclair/typebox/0.25.21";
              link = true;
            };
          };
          version = "29.4.0";
        };
      };
      "@jest/source-map" = {
        "29.2.0" = {
          depInfo = {
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.15";
              pin = "0.3.17";
              runtime = true;
            };
            callsites = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ozGdMQmsPGLEFf8FDhHJuc1YXEnMoJ4yQI5/0zOg9GU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/source-map/-/source-map-29.2.0.tgz";
          };
          ident = "@jest/source-map";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
            "node_modules/callsites" = {
              key = "callsites/3.1.0";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
          };
          version = "29.2.0";
        };
      };
      "@jest/test-result" = {
        "29.4.1" = {
          depInfo = {
            "@jest/console" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/istanbul-lib-coverage" = {
              descriptor = "^2.0.0";
              pin = "2.0.4";
              runtime = true;
            };
            collect-v8-coverage = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OgosX5pwldzGP0nxQA9MwJOtzGw6HunLOvpIHE8D4OU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/test-result/-/test-result-29.4.1.tgz";
          };
          ident = "@jest/test-result";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/console" = {
              key = "@jest/console/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/istanbul-lib-coverage" = {
              key = "@types/istanbul-lib-coverage/2.0.4";
              link = true;
            };
            "node_modules/collect-v8-coverage" = {
              key = "collect-v8-coverage/1.0.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/test-sequencer" = {
        "29.4.1" = {
          depInfo = {
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-d4oXEbhunEv12f5H67p94O8mEkHf0u+AyFdUlRyGL8s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/test-sequencer/-/test-sequencer-29.4.1.tgz";
          };
          ident = "@jest/test-sequencer";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/transform" = {
        "29.4.1" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.11.6";
              pin = "7.20.12";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.15";
              pin = "0.3.17";
              runtime = true;
            };
            babel-plugin-istanbul = {
              descriptor = "^6.1.1";
              pin = "6.1.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            convert-source-map = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            fast-json-stable-stringify = {
              descriptor = "^2.1.0";
              pin = "2.1.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            pirates = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            write-file-atomic = {
              descriptor = "^5.0.0";
              pin = "5.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-BtRRzq6i8plY2ewuELo0ESakmYy8mF4sahPA9n1SpTQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jest/transform/-/transform-29.4.1.tgz";
          };
          ident = "@jest/transform";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/core" = {
              key = "@babel/core/7.20.12";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
            "node_modules/babel-plugin-istanbul" = {
              key = "babel-plugin-istanbul/6.1.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/convert-source-map" = {
              key = "convert-source-map/2.0.0";
              link = true;
            };
            "node_modules/fast-json-stable-stringify" = {
              key = "fast-json-stable-stringify/2.1.0";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/micromatch" = {
              key = "micromatch/4.0.5";
              link = true;
            };
            "node_modules/pirates" = {
              key = "pirates/4.0.5";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/write-file-atomic" = {
              key = "write-file-atomic/5.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jest/types" = {
        "29.4.1" = {
          depInfo = {
            "@jest/schemas" = {
              descriptor = "^29.4.0";
              pin = "29.4.0";
              runtime = true;
            };
            "@types/istanbul-lib-coverage" = {
              descriptor = "^2.0.0";
              pin = "2.0.4";
              runtime = true;
            };
            "@types/istanbul-reports" = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            "@types/yargs" = {
              descriptor = "^17.0.8";
              pin = "17.0.22";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-pqjEawCrKwL+G19Ce5Qk7JYGmBbMBxhd/iPh1X5QE30=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/types/-/types-29.4.1.tgz";
          };
          ident = "@jest/types";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/schemas" = {
              key = "@jest/schemas/29.4.0";
              link = true;
            };
            "node_modules/@types/istanbul-lib-coverage" = {
              key = "@types/istanbul-lib-coverage/2.0.4";
              link = true;
            };
            "node_modules/@types/istanbul-reports" = {
              key = "@types/istanbul-reports/3.0.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/@types/yargs" = {
              key = "@types/yargs/17.0.22";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      "@jridgewell/gen-mapping" = {
        "0.1.1" = {
          depInfo = {
            "@jridgewell/set-array" = {
              descriptor = "^1.0.0";
              pin = "1.1.2";
              runtime = true;
            };
            "@jridgewell/sourcemap-codec" = {
              descriptor = "^1.4.10";
              pin = "1.4.14";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-4s0QHwGuQ7U9seKMKMknmZy0UOJFVSAyuQc5Dm3Ylt0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.1.1.tgz";
          };
          ident = "@jridgewell/gen-mapping";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/set-array" = {
              key = "@jridgewell/set-array/1.1.2";
              link = true;
            };
            "node_modules/@jridgewell/sourcemap-codec" = {
              key = "@jridgewell/sourcemap-codec/1.4.14";
              link = true;
            };
          };
          version = "0.1.1";
        };
        "0.3.2" = {
          depInfo = {
            "@jridgewell/set-array" = {
              descriptor = "^1.0.1";
              pin = "1.1.2";
              runtime = true;
            };
            "@jridgewell/sourcemap-codec" = {
              descriptor = "^1.4.10";
              pin = "1.4.14";
              runtime = true;
            };
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.9";
              pin = "0.3.17";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-KmYeSuSah43dRS1I6Tit9AyhP9MP9jmyhdOGbzLOi8A=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.2.tgz";
          };
          ident = "@jridgewell/gen-mapping";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/set-array" = {
              key = "@jridgewell/set-array/1.1.2";
              link = true;
            };
            "node_modules/@jridgewell/sourcemap-codec" = {
              key = "@jridgewell/sourcemap-codec/1.4.14";
              link = true;
            };
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
          };
          version = "0.3.2";
        };
      };
      "@jridgewell/resolve-uri" = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-hED3kswj5waotVJCd7ougmOL65MmYhoI4YFae3fN2c0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.0.tgz";
          };
          ident = "@jridgewell/resolve-uri";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      "@jridgewell/set-array" = {
        "1.1.2" = {
          fetchInfo = {
            narHash = "sha256-lIY9Ar8hajSi/s4DAlqWj/PD75pWG2HDxJ6x3S3t9bE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/set-array/-/set-array-1.1.2.tgz";
          };
          ident = "@jridgewell/set-array";
          ltype = "file";
          treeInfo = { };
          version = "1.1.2";
        };
      };
      "@jridgewell/sourcemap-codec" = {
        "1.4.14" = {
          fetchInfo = {
            narHash = "sha256-7F2YWRn9nvp2Il2EJvymCsvK2CgVu/MTDTvCL6o0K1I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.14.tgz";
          };
          ident = "@jridgewell/sourcemap-codec";
          ltype = "file";
          treeInfo = { };
          version = "1.4.14";
        };
      };
      "@jridgewell/trace-mapping" = {
        "0.3.17" = {
          depInfo = {
            "@jridgewell/resolve-uri" = {
              descriptor = "3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            "@jridgewell/sourcemap-codec" = {
              descriptor = "1.4.14";
              pin = "1.4.14";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-oWXXA50TXBao93Fsz5ZYrnGAuVNvbw33hRix4Gkz1XQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.17.tgz";
          };
          ident = "@jridgewell/trace-mapping";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/resolve-uri" = {
              key = "@jridgewell/resolve-uri/3.1.0";
              link = true;
            };
            "node_modules/@jridgewell/sourcemap-codec" = {
              key = "@jridgewell/sourcemap-codec/1.4.14";
              link = true;
            };
          };
          version = "0.3.17";
        };
      };
      "@sinclair/typebox" = {
        "0.25.21" = {
          fetchInfo = {
            narHash = "sha256-g4OruB6UKcMlp3h+UFCMPwyV97Zb3WBZ+sKAMFCmxsQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@sinclair/typebox/-/typebox-0.25.21.tgz";
          };
          ident = "@sinclair/typebox";
          ltype = "file";
          treeInfo = { };
          version = "0.25.21";
        };
      };
      "@sinonjs/commons" = {
        "2.0.0" = {
          depInfo = {
            type-detect = {
              descriptor = "4.0.8";
              pin = "4.0.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-WkMtrCPbZuY1i/yhjLZOUKsVnPDOECs7MS9E5ZB66bs=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@sinonjs/commons/-/commons-2.0.0.tgz";
          };
          ident = "@sinonjs/commons";
          ltype = "file";
          treeInfo = {
            "node_modules/type-detect" = {
              key = "type-detect/4.0.8";
              link = true;
            };
          };
          version = "2.0.0";
        };
      };
      "@sinonjs/fake-timers" = {
        "10.0.2" = {
          depInfo = {
            "@sinonjs/commons" = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-PYiCsMF0e/Er2AbjVSF6G0XOnEBCvb+2P7LB7kFLl5E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@sinonjs/fake-timers/-/fake-timers-10.0.2.tgz";
          };
          ident = "@sinonjs/fake-timers";
          ltype = "file";
          treeInfo = {
            "node_modules/@sinonjs/commons" = {
              key = "@sinonjs/commons/2.0.0";
              link = true;
            };
          };
          version = "10.0.2";
        };
      };
      "@types/babel__core" = {
        "7.20.0" = {
          depInfo = {
            "@babel/parser" = {
              descriptor = "^7.20.7";
              pin = "7.20.15";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.20.7";
              pin = "7.20.7";
              runtime = true;
            };
            "@types/babel__generator" = {
              pin = "7.6.4";
              runtime = true;
            };
            "@types/babel__template" = {
              pin = "7.4.1";
              runtime = true;
            };
            "@types/babel__traverse" = {
              pin = "7.18.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-udy9eNlVAh07d3xtHv10u3RZ0umWY/Su4gj15Ndueus=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/babel__core/-/babel__core-7.20.0.tgz";
          };
          ident = "@types/babel__core";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/@types/babel__generator" = {
              key = "@types/babel__generator/7.6.4";
              link = true;
            };
            "node_modules/@types/babel__template" = {
              key = "@types/babel__template/7.4.1";
              link = true;
            };
            "node_modules/@types/babel__traverse" = {
              key = "@types/babel__traverse/7.18.3";
              link = true;
            };
          };
          version = "7.20.0";
        };
      };
      "@types/babel__generator" = {
        "7.6.4" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.0.0";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fA71tEP4XygyE7wTyFIiLZnZf7XirvUI+Sn33Uz6eoo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/babel__generator/-/babel__generator-7.6.4.tgz";
          };
          ident = "@types/babel__generator";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.6.4";
        };
      };
      "@types/babel__template" = {
        "7.4.1" = {
          depInfo = {
            "@babel/parser" = {
              descriptor = "^7.1.0";
              pin = "7.20.15";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.0.0";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vC/9MmlD/VSIjmQ+TTUy7fF5JDsj8f2Act67cMNvGNM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/babel__template/-/babel__template-7.4.1.tgz";
          };
          ident = "@types/babel__template";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.4.1";
        };
      };
      "@types/babel__traverse" = {
        "7.18.3" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.3.0";
              pin = "7.20.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-RnU86biuqwF0TcaOvI036R2R7GQeYS7/EH3A7JZA+c8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/babel__traverse/-/babel__traverse-7.18.3.tgz";
          };
          ident = "@types/babel__traverse";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
          };
          version = "7.18.3";
        };
      };
      "@types/graceful-fs" = {
        "4.1.6" = {
          depInfo = {
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-NeoPlSfrhf23AFZLoGdgj/fGymYh8Gq2+qhnyCi+v6E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/graceful-fs/-/graceful-fs-4.1.6.tgz";
          };
          ident = "@types/graceful-fs";
          ltype = "file";
          treeInfo = {
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
          };
          version = "4.1.6";
        };
      };
      "@types/istanbul-lib-coverage" = {
        "2.0.4" = {
          fetchInfo = {
            narHash = "sha256-DtWhc4JGMhO7O0szwUUUAgO3Qgh8hrmgEygs8bL5Z1Q=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.4.tgz";
          };
          ident = "@types/istanbul-lib-coverage";
          ltype = "file";
          treeInfo = { };
          version = "2.0.4";
        };
      };
      "@types/istanbul-lib-report" = {
        "3.0.0" = {
          depInfo = {
            "@types/istanbul-lib-coverage" = {
              pin = "2.0.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Evql88kR5kuT9nzvOcslOTGjbY9ZZXvClwILFeNmIks=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz";
          };
          ident = "@types/istanbul-lib-report";
          ltype = "file";
          treeInfo = {
            "node_modules/@types/istanbul-lib-coverage" = {
              key = "@types/istanbul-lib-coverage/2.0.4";
              link = true;
            };
          };
          version = "3.0.0";
        };
      };
      "@types/istanbul-reports" = {
        "3.0.1" = {
          depInfo = {
            "@types/istanbul-lib-report" = {
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-4QFiNHjYRB44vWHfJBGOt/Msc/4sM6lvkaXTJUE0jtU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/istanbul-reports/-/istanbul-reports-3.0.1.tgz";
          };
          ident = "@types/istanbul-reports";
          ltype = "file";
          treeInfo = {
            "node_modules/@types/istanbul-lib-report" = {
              key = "@types/istanbul-lib-report/3.0.0";
              link = true;
            };
          };
          version = "3.0.1";
        };
      };
      "@types/node" = {
        "18.11.18" = {
          fetchInfo = {
            narHash = "sha256-8a2AsNx+1PAjuLl0/kfww/u6qY6xwfdgAPQ+CEAPtSU=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/node/-/node-18.11.18.tgz";
          };
          ident = "@types/node";
          ltype = "file";
          treeInfo = { };
          version = "18.11.18";
        };
      };
      "@types/prettier" = {
        "2.7.2" = {
          fetchInfo = {
            narHash = "sha256-2gHIPrk2QP73WftmdeKuwyTkuKu0L6EpZjqsrdEq6W0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/prettier/-/prettier-2.7.2.tgz";
          };
          ident = "@types/prettier";
          ltype = "file";
          treeInfo = { };
          version = "2.7.2";
        };
      };
      "@types/stack-utils" = {
        "2.0.1" = {
          fetchInfo = {
            narHash = "sha256-gr91EFOuHHQwQFZkhLUrR2nuwle/BkVYOhlHQ7z2G3w=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/stack-utils/-/stack-utils-2.0.1.tgz";
          };
          ident = "@types/stack-utils";
          ltype = "file";
          treeInfo = { };
          version = "2.0.1";
        };
      };
      "@types/yargs" = {
        "17.0.22" = {
          depInfo = {
            "@types/yargs-parser" = {
              pin = "21.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-FDKHl8I3oVp+8+hlz6WyGTg8QtNER1RgiOfAk6sA+uk=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/yargs/-/yargs-17.0.22.tgz";
          };
          ident = "@types/yargs";
          ltype = "file";
          treeInfo = {
            "node_modules/@types/yargs-parser" = {
              key = "@types/yargs-parser/21.0.0";
              link = true;
            };
          };
          version = "17.0.22";
        };
      };
      "@types/yargs-parser" = {
        "21.0.0" = {
          fetchInfo = {
            narHash = "sha256-5Eay5eyC90EFhvTlSqGxOTHiYHfZAKJVd58oLhEvv04=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/@types/yargs-parser/-/yargs-parser-21.0.0.tgz";
          };
          ident = "@types/yargs-parser";
          ltype = "file";
          treeInfo = { };
          version = "21.0.0";
        };
      };
      ansi-escapes = {
        "4.3.2" = {
          depInfo = {
            type-fest = {
              descriptor = "^0.21.3";
              pin = "0.21.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-/Ga59tp9WhKsjNVqen5gB0HoC5xxSna5WfnQQA+ocbQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-4.3.2.tgz";
          };
          ident = "ansi-escapes";
          ltype = "file";
          treeInfo = {
            "node_modules/type-fest" = {
              key = "type-fest/0.21.3";
              link = true;
            };
          };
          version = "4.3.2";
        };
      };
      ansi-regex = {
        "5.0.1" = {
          fetchInfo = {
            narHash = "sha256-8FjueDq8OfpA4/cbcsda1vVcNseZPDYf+YqM56zD03Y=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
          };
          ident = "ansi-regex";
          ltype = "file";
          treeInfo = { };
          version = "5.0.1";
        };
      };
      ansi-styles = {
        "3.2.1" = {
          depInfo = {
            color-convert = {
              descriptor = "^1.9.0";
              pin = "1.9.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-3VeRGkKqu2VUHvybLgjuzuTVZIYL6b4bwCEAhRF/Fzw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz";
          };
          ident = "ansi-styles";
          ltype = "file";
          treeInfo = {
            "node_modules/color-convert" = {
              key = "color-convert/1.9.3";
              link = true;
            };
          };
          version = "3.2.1";
        };
        "4.3.0" = {
          depInfo = {
            color-convert = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Kqu6XFQU9/7zx/Nryl7Asi5QsyP1By7Ig4Sn1HbFfdc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
          };
          ident = "ansi-styles";
          ltype = "file";
          treeInfo = {
            "node_modules/color-convert" = {
              key = "color-convert/2.0.1";
              link = true;
            };
          };
          version = "4.3.0";
        };
        "5.2.0" = {
          fetchInfo = {
            narHash = "sha256-5C4MyF0m2ejHxZfO5pEUcVzC/HKj1JpYUuwYsGmf+Yk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/ansi-styles/-/ansi-styles-5.2.0.tgz";
          };
          ident = "ansi-styles";
          ltype = "file";
          treeInfo = { };
          version = "5.2.0";
        };
      };
      anymatch = {
        "3.1.3" = {
          depInfo = {
            normalize-path = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            picomatch = {
              descriptor = "^2.0.4";
              pin = "2.3.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-h1DssnLsJ6TCWFgkMh8DXoVT/2gZaywg0B2sseGv5eU=";
            type = "tarball";
            url = "https://registry.npmjs.org/anymatch/-/anymatch-3.1.3.tgz";
          };
          ident = "anymatch";
          ltype = "file";
          treeInfo = {
            "node_modules/normalize-path" = {
              key = "normalize-path/3.0.0";
              link = true;
            };
            "node_modules/picomatch" = {
              key = "picomatch/2.3.1";
              link = true;
            };
          };
          version = "3.1.3";
        };
      };
      argparse = {
        "1.0.10" = {
          depInfo = {
            sprintf-js = {
              descriptor = "~1.0.2";
              pin = "1.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-6xIfdvWgo7qjBYOsYb2ONE1VoJTC1+6TSooyZlqqhVM=";
            type = "tarball";
            url = "https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz";
          };
          ident = "argparse";
          ltype = "file";
          treeInfo = {
            "node_modules/sprintf-js" = {
              key = "sprintf-js/1.0.3";
              link = true;
            };
          };
          version = "1.0.10";
        };
      };
      babel-jest = {
        "29.4.1" = {
          depInfo = {
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/babel__core" = {
              descriptor = "^7.1.14";
              pin = "7.20.0";
              runtime = true;
            };
            babel-plugin-istanbul = {
              descriptor = "^6.1.1";
              pin = "6.1.1";
              runtime = true;
            };
            babel-preset-jest = {
              descriptor = "^29.4.0";
              pin = "29.4.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-MrByOeHq+5cJq7Ltz93OlhEMZQXv2aXcGL7TK4qMsfM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/babel-jest/-/babel-jest-29.4.1.tgz";
          };
          ident = "babel-jest";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.8.0"; }; };
          treeInfo = {
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@types/babel__core" = {
              key = "@types/babel__core/7.20.0";
              link = true;
            };
            "node_modules/babel-plugin-istanbul" = {
              key = "babel-plugin-istanbul/6.1.1";
              link = true;
            };
            "node_modules/babel-preset-jest" = {
              key = "babel-preset-jest/29.4.0";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      babel-plugin-istanbul = {
        "6.1.1" = {
          depInfo = {
            "@babel/helper-plugin-utils" = {
              descriptor = "^7.0.0";
              pin = "7.20.2";
              runtime = true;
            };
            "@istanbuljs/load-nyc-config" = {
              descriptor = "^1.0.0";
              pin = "1.1.0";
              runtime = true;
            };
            "@istanbuljs/schema" = {
              descriptor = "^0.1.2";
              pin = "0.1.3";
              runtime = true;
            };
            istanbul-lib-instrument = {
              descriptor = "^5.0.4";
              pin = "5.2.1";
              runtime = true;
            };
            test-exclude = {
              descriptor = "^6.0.0";
              pin = "6.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-y3RBDE3reRg/a33qhERIoV4wWLaNTynQV8fxmbQqllo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz";
          };
          ident = "babel-plugin-istanbul";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/helper-plugin-utils" = {
              key = "@babel/helper-plugin-utils/7.20.2";
              link = true;
            };
            "node_modules/@istanbuljs/load-nyc-config" = {
              key = "@istanbuljs/load-nyc-config/1.1.0";
              link = true;
            };
            "node_modules/@istanbuljs/schema" = {
              key = "@istanbuljs/schema/0.1.3";
              link = true;
            };
            "node_modules/istanbul-lib-instrument" = {
              key = "istanbul-lib-instrument/5.2.1";
              link = true;
            };
            "node_modules/test-exclude" = {
              key = "test-exclude/6.0.0";
              link = true;
            };
          };
          version = "6.1.1";
        };
      };
      babel-plugin-jest-hoist = {
        "29.4.0" = {
          depInfo = {
            "@babel/template" = {
              descriptor = "^7.3.3";
              pin = "7.20.7";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.3.3";
              pin = "7.20.7";
              runtime = true;
            };
            "@types/babel__core" = {
              descriptor = "^7.1.14";
              pin = "7.20.0";
              runtime = true;
            };
            "@types/babel__traverse" = {
              descriptor = "^7.0.6";
              pin = "7.18.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lJWeNfdT9dfrOewSYUfH6FGlr9vykDaqlUqO8V4Oo+I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-29.4.0.tgz";
          };
          ident = "babel-plugin-jest-hoist";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/@types/babel__core" = {
              key = "@types/babel__core/7.20.0";
              link = true;
            };
            "node_modules/@types/babel__traverse" = {
              key = "@types/babel__traverse/7.18.3";
              link = true;
            };
          };
          version = "29.4.0";
        };
      };
      babel-preset-current-node-syntax = {
        "1.0.1" = {
          depInfo = {
            "@babel/plugin-syntax-async-generators" = {
              descriptor = "^7.8.4";
              pin = "7.8.4";
              runtime = true;
            };
            "@babel/plugin-syntax-bigint" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-class-properties" = {
              descriptor = "^7.8.3";
              pin = "7.12.13";
              runtime = true;
            };
            "@babel/plugin-syntax-import-meta" = {
              descriptor = "^7.8.3";
              pin = "7.10.4";
              runtime = true;
            };
            "@babel/plugin-syntax-json-strings" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-logical-assignment-operators" = {
              descriptor = "^7.8.3";
              pin = "7.10.4";
              runtime = true;
            };
            "@babel/plugin-syntax-nullish-coalescing-operator" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-numeric-separator" = {
              descriptor = "^7.8.3";
              pin = "7.10.4";
              runtime = true;
            };
            "@babel/plugin-syntax-object-rest-spread" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-optional-catch-binding" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-optional-chaining" = {
              descriptor = "^7.8.3";
              pin = "7.8.3";
              runtime = true;
            };
            "@babel/plugin-syntax-top-level-await" = {
              descriptor = "^7.8.3";
              pin = "7.14.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-2oYEdhZGkjX9v11ChQiBR/r46aZfEQAxmlQ4vUPO18c=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-1.0.1.tgz";
          };
          ident = "babel-preset-current-node-syntax";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0"; }; };
          treeInfo = {
            "node_modules/@babel/plugin-syntax-async-generators" = {
              key = "@babel/plugin-syntax-async-generators/7.8.4";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-bigint" = {
              key = "@babel/plugin-syntax-bigint/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-class-properties" = {
              key = "@babel/plugin-syntax-class-properties/7.12.13";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-import-meta" = {
              key = "@babel/plugin-syntax-import-meta/7.10.4";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-json-strings" = {
              key = "@babel/plugin-syntax-json-strings/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-logical-assignment-operators" = {
              key = "@babel/plugin-syntax-logical-assignment-operators/7.10.4";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-nullish-coalescing-operator" = {
              key = "@babel/plugin-syntax-nullish-coalescing-operator/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-numeric-separator" = {
              key = "@babel/plugin-syntax-numeric-separator/7.10.4";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-object-rest-spread" = {
              key = "@babel/plugin-syntax-object-rest-spread/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-optional-catch-binding" = {
              key = "@babel/plugin-syntax-optional-catch-binding/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-optional-chaining" = {
              key = "@babel/plugin-syntax-optional-chaining/7.8.3";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-top-level-await" = {
              key = "@babel/plugin-syntax-top-level-await/7.14.5";
              link = true;
            };
          };
          version = "1.0.1";
        };
      };
      babel-preset-jest = {
        "29.4.0" = {
          depInfo = {
            babel-plugin-jest-hoist = {
              descriptor = "^29.4.0";
              pin = "29.4.0";
              runtime = true;
            };
            babel-preset-current-node-syntax = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-G+Uct312Y5I3TeqD6X8t8w/fA5wBJfDKpcnntyy/uJo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/babel-preset-jest/-/babel-preset-jest-29.4.0.tgz";
          };
          ident = "babel-preset-jest";
          ltype = "file";
          peerInfo = { "@babel/core" = { descriptor = "^7.0.0"; }; };
          treeInfo = {
            "node_modules/babel-plugin-jest-hoist" = {
              key = "babel-plugin-jest-hoist/29.4.0";
              link = true;
            };
            "node_modules/babel-preset-current-node-syntax" = {
              key = "babel-preset-current-node-syntax/1.0.1";
              link = true;
            };
          };
          version = "29.4.0";
        };
      };
      balanced-match = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-YH1+osaAiJvWUUR4VCe/Hh4eHhXS0gN3Lnr+Xd3cCzg=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
          };
          ident = "balanced-match";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      brace-expansion = {
        "1.1.11" = {
          depInfo = {
            balanced-match = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            concat-map = {
              descriptor = "0.0.1";
              pin = "0.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-3iQ502QjW10IEFOh3qnkAIivIbQ1TO1pgQTi7p9eado=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
          };
          ident = "brace-expansion";
          ltype = "file";
          treeInfo = {
            "node_modules/balanced-match" = {
              key = "balanced-match/1.0.2";
              link = true;
            };
            "node_modules/concat-map" = {
              key = "concat-map/0.0.1";
              link = true;
            };
          };
          version = "1.1.11";
        };
      };
      braces = {
        "3.0.2" = {
          depInfo = {
            fill-range = {
              descriptor = "^7.0.1";
              pin = "7.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-x3Cs+dWp0z2CXH2OaHCHtF2aWMrrV5/kFWM4+JCkcZ4=";
            type = "tarball";
            url = "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz";
          };
          ident = "braces";
          ltype = "file";
          treeInfo = {
            "node_modules/fill-range" = {
              key = "fill-range/7.0.1";
              link = true;
            };
          };
          version = "3.0.2";
        };
      };
      browserslist = {
        "4.21.5" = {
          binInfo = { binPairs = { browserslist = "cli.js"; }; };
          depInfo = {
            caniuse-lite = {
              descriptor = "^1.0.30001449";
              pin = "1.0.30001450";
              runtime = true;
            };
            electron-to-chromium = {
              descriptor = "^1.4.284";
              pin = "1.4.286";
              runtime = true;
            };
            node-releases = {
              descriptor = "^2.0.8";
              pin = "2.0.9";
              runtime = true;
            };
            update-browserslist-db = {
              descriptor = "^1.0.10";
              pin = "1.0.10";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-JL9N0gpt6rGtumzIGQfuVPM5ocz+M871XljyJdpG+TQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/browserslist/-/browserslist-4.21.5.tgz";
          };
          ident = "browserslist";
          ltype = "file";
          treeInfo = {
            "node_modules/caniuse-lite" = {
              key = "caniuse-lite/1.0.30001450";
              link = true;
            };
            "node_modules/electron-to-chromium" = {
              key = "electron-to-chromium/1.4.286";
              link = true;
            };
            "node_modules/node-releases" = {
              key = "node-releases/2.0.9";
              link = true;
            };
            "node_modules/update-browserslist-db" = {
              key = "update-browserslist-db/1.0.10";
              link = true;
            };
          };
          version = "4.21.5";
        };
      };
      bser = {
        "2.1.1" = {
          depInfo = {
            node-int64 = {
              descriptor = "^0.4.0";
              pin = "0.4.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8jmp769FFc+RUwtnH56s0sdBOeUnLA2Sh2gyM9QZ/oc=";
            type = "tarball";
            url = "https://registry.npmjs.org/bser/-/bser-2.1.1.tgz";
          };
          ident = "bser";
          ltype = "file";
          treeInfo = {
            "node_modules/node-int64" = {
              key = "node-int64/0.4.0";
              link = true;
            };
          };
          version = "2.1.1";
        };
      };
      buffer-from = {
        "1.1.2" = {
          fetchInfo = {
            narHash = "sha256-8dpJi5qu37MruotYJ6QBjTJbgWOO4eDu3gOoJ6Mi9H0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz";
          };
          ident = "buffer-from";
          ltype = "file";
          treeInfo = { };
          version = "1.1.2";
        };
      };
      callsites = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-1p0bBJdAZstGAys+wy86rAwOMZr6w8gyM4+dFOe62Ao=";
            type = "tarball";
            url = "https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz";
          };
          ident = "callsites";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      camelcase = {
        "5.3.1" = {
          fetchInfo = {
            narHash = "sha256-SEQ2na3HtClyAEqDAyp5jKNnb4w4Awuf57CZv7D5EOo=";
            type = "tarball";
            url = "https://registry.npmjs.org/camelcase/-/camelcase-5.3.1.tgz";
          };
          ident = "camelcase";
          ltype = "file";
          treeInfo = { };
          version = "5.3.1";
        };
        "6.3.0" = {
          fetchInfo = {
            narHash = "sha256-nIBs7h+GPjWl7L83JokvFCEP7ICrLUwBcyEbtZYRbdw=";
            type = "tarball";
            url = "https://registry.npmjs.org/camelcase/-/camelcase-6.3.0.tgz";
          };
          ident = "camelcase";
          ltype = "file";
          treeInfo = { };
          version = "6.3.0";
        };
      };
      caniuse-lite = {
        "1.0.30001450" = {
          fetchInfo = {
            narHash = "sha256-pMoC10heRp+lTAsejFUjfACgi99nbUPuqdAl7nByXHk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001450.tgz";
          };
          ident = "caniuse-lite";
          ltype = "file";
          treeInfo = { };
          version = "1.0.30001450";
        };
      };
      chalk = {
        "2.4.2" = {
          depInfo = {
            ansi-styles = {
              descriptor = "^3.2.1";
              pin = "3.2.1";
              runtime = true;
            };
            escape-string-regexp = {
              descriptor = "^1.0.5";
              pin = "1.0.5";
              runtime = true;
            };
            supports-color = {
              descriptor = "^5.3.0";
              pin = "5.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-epyiOfJKhuYWuMNymawywjS+lFfsQvbhON+b8du38TQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz";
          };
          ident = "chalk";
          ltype = "file";
          treeInfo = {
            "node_modules/ansi-styles" = {
              key = "ansi-styles/3.2.1";
              link = true;
            };
            "node_modules/escape-string-regexp" = {
              key = "escape-string-regexp/1.0.5";
              link = true;
            };
            "node_modules/supports-color" = {
              key = "supports-color/5.5.0";
              link = true;
            };
          };
          version = "2.4.2";
        };
        "4.1.2" = {
          depInfo = {
            ansi-styles = {
              descriptor = "^4.1.0";
              pin = "4.3.0";
              runtime = true;
            };
            supports-color = {
              descriptor = "^7.1.0";
              pin = "7.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-dxAbdhq8BxCb4ae3E1eYjt6zC/nsq3c18/ZAOIXKiT8=";
            type = "tarball";
            url = "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz";
          };
          ident = "chalk";
          ltype = "file";
          treeInfo = {
            "node_modules/ansi-styles" = {
              key = "ansi-styles/4.3.0";
              link = true;
            };
            "node_modules/supports-color" = {
              key = "supports-color/7.2.0";
              link = true;
            };
          };
          version = "4.1.2";
        };
      };
      char-regex = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-2JafbboJYsmPNxxtZfvU6h7yDapOw1gzeH+J5fd+i+o=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/char-regex/-/char-regex-1.0.2.tgz";
          };
          ident = "char-regex";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      ci-info = {
        "3.7.1" = {
          fetchInfo = {
            narHash = "sha256-Li7O+2Lkjlpo3H+6LPtB4hE/xms9uGOLRxe7z5mOugk=";
            type = "tarball";
            url = "https://registry.npmjs.org/ci-info/-/ci-info-3.7.1.tgz";
          };
          ident = "ci-info";
          ltype = "file";
          treeInfo = { };
          version = "3.7.1";
        };
      };
      cjs-module-lexer = {
        "1.2.2" = {
          fetchInfo = {
            narHash = "sha256-cwkTjCYvxr4BEyytwL1xzu+ugJQqnCexq0v8sxMa6iA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/cjs-module-lexer/-/cjs-module-lexer-1.2.2.tgz";
          };
          ident = "cjs-module-lexer";
          ltype = "file";
          treeInfo = { };
          version = "1.2.2";
        };
      };
      cliui = {
        "8.0.1" = {
          depInfo = {
            string-width = {
              descriptor = "^4.2.0";
              pin = "4.2.3";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.1";
              pin = "6.0.1";
              runtime = true;
            };
            wrap-ansi = {
              descriptor = "^7.0.0";
              pin = "7.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-nVNQ7y2LEDV4luAmcd2ekYXE25Xq85gYPuir9zE/RRw=";
            type = "tarball";
            url = "https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz";
          };
          ident = "cliui";
          ltype = "file";
          treeInfo = {
            "node_modules/string-width" = {
              key = "string-width/4.2.3";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
            "node_modules/wrap-ansi" = {
              key = "wrap-ansi/7.0.0";
              link = true;
            };
          };
          version = "8.0.1";
        };
      };
      co = {
        "4.6.0" = {
          fetchInfo = {
            narHash = "sha256-V7nTU9Dn18RVsbO0BXeDsr1xuhsaPR466RYnvWF71jY=";
            type = "tarball";
            url = "https://registry.npmjs.org/co/-/co-4.6.0.tgz";
          };
          ident = "co";
          ltype = "file";
          treeInfo = { };
          version = "4.6.0";
        };
      };
      collect-v8-coverage = {
        "1.0.1" = {
          fetchInfo = {
            narHash = "sha256-1kj5xVDQCtGnP8trV/GfFmJkXFCOWSnHSV4PkQitouM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/collect-v8-coverage/-/collect-v8-coverage-1.0.1.tgz";
          };
          ident = "collect-v8-coverage";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      color-convert = {
        "1.9.3" = {
          depInfo = {
            color-name = {
              descriptor = "1.1.3";
              pin = "1.1.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-o/p0tqrXMvGg2VduYwUNx05gEWI11GuHgyq9nrd6khM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz";
          };
          ident = "color-convert";
          ltype = "file";
          treeInfo = {
            "node_modules/color-name" = {
              key = "color-name/1.1.3";
              link = true;
            };
          };
          version = "1.9.3";
        };
        "2.0.1" = {
          depInfo = {
            color-name = {
              descriptor = "~1.1.4";
              pin = "1.1.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-EU7d3q55UXpfbMmk+wu8nYaxXGBK3Pwu2pIe5TVZiwc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
          };
          ident = "color-convert";
          ltype = "file";
          treeInfo = {
            "node_modules/color-name" = {
              key = "color-name/1.1.4";
              link = true;
            };
          };
          version = "2.0.1";
        };
      };
      color-name = {
        "1.1.3" = {
          fetchInfo = {
            narHash = "sha256-Z7+qlowBfxZNeitMCENEfKBRnaxqLWi4+ms5SIKafc0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz";
          };
          ident = "color-name";
          ltype = "file";
          treeInfo = { };
          version = "1.1.3";
        };
        "1.1.4" = {
          fetchInfo = {
            narHash = "sha256-mAOvtcDAZ05q6KP5tRgaO5D4jeb+/AcbIE1Z2nBG1uk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
          };
          ident = "color-name";
          ltype = "file";
          treeInfo = { };
          version = "1.1.4";
        };
      };
      concat-map = {
        "0.0.1" = {
          fetchInfo = {
            narHash = "sha256-ZY5/rMtzNK56p81EGaPcoIRr+J9j7yWh4szGxIOFYFA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
          };
          ident = "concat-map";
          ltype = "file";
          treeInfo = { };
          version = "0.0.1";
        };
      };
      convert-source-map = {
        "1.9.0" = {
          fetchInfo = {
            narHash = "sha256-9zjFbAgTFN8PnaoIBuarc6354vYjJomgtng2vak3ERQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/convert-source-map/-/convert-source-map-1.9.0.tgz";
          };
          ident = "convert-source-map";
          ltype = "file";
          treeInfo = { };
          version = "1.9.0";
        };
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-ygRy8nFjyNppUpu8cEnJ3SIud6Qjg9vHd86S8rX8nug=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/convert-source-map/-/convert-source-map-2.0.0.tgz";
          };
          ident = "convert-source-map";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      cross-spawn = {
        "7.0.3" = {
          depInfo = {
            path-key = {
              descriptor = "^3.1.0";
              pin = "3.1.1";
              runtime = true;
            };
            shebang-command = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            which = {
              descriptor = "^2.0.1";
              pin = "2.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-JZEEsKxB3BAGF+e9rlh4d9UUa8JEz4dSjfAvIXrerzY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz";
          };
          ident = "cross-spawn";
          ltype = "file";
          treeInfo = {
            "node_modules/path-key" = {
              key = "path-key/3.1.1";
              link = true;
            };
            "node_modules/shebang-command" = {
              key = "shebang-command/2.0.0";
              link = true;
            };
            "node_modules/which" = {
              key = "which/2.0.2";
              link = true;
            };
          };
          version = "7.0.3";
        };
      };
      debug = {
        "4.3.4" = {
          depInfo = {
            ms = {
              descriptor = "2.1.2";
              pin = "2.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-S6cB3bQG4QiKORndkECqPyzcgJwPgetsh/AcbjSrW3I=";
            type = "tarball";
            url = "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz";
          };
          ident = "debug";
          ltype = "file";
          peerInfo = {
            supports-color = {
              descriptor = "*";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/ms" = {
              key = "ms/2.1.2";
              link = true;
            };
          };
          version = "4.3.4";
        };
      };
      dedent = {
        "0.7.0" = {
          fetchInfo = {
            narHash = "sha256-RJaMQA5CODyoemzKwNAw/T5f4r26gg7bE2t9iLCQA3E=";
            type = "tarball";
            url = "https://registry.npmjs.org/dedent/-/dedent-0.7.0.tgz";
          };
          ident = "dedent";
          ltype = "file";
          treeInfo = { };
          version = "0.7.0";
        };
      };
      deepmerge = {
        "4.3.0" = {
          fetchInfo = {
            narHash = "sha256-ODvGskPpF9OkBRpuqOjA4i1vU1M8ifsECyOzGS2IFZg=";
            type = "tarball";
            url = "https://registry.npmjs.org/deepmerge/-/deepmerge-4.3.0.tgz";
          };
          ident = "deepmerge";
          ltype = "file";
          treeInfo = { };
          version = "4.3.0";
        };
      };
      detect-newline = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-jKiYmQrz4YjKevdQlDPu2iPBzjoNtNMcYGiqhKhmrW8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/detect-newline/-/detect-newline-3.1.0.tgz";
          };
          ident = "detect-newline";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      diff-sequences = {
        "29.3.1" = {
          fetchInfo = {
            narHash = "sha256-enxUbYdrGuvypdk6Nnh5wIO4zVX+V2agfJP0G1oUu3w=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/diff-sequences/-/diff-sequences-29.3.1.tgz";
          };
          ident = "diff-sequences";
          ltype = "file";
          treeInfo = { };
          version = "29.3.1";
        };
      };
      electron-to-chromium = {
        "1.4.286" = {
          fetchInfo = {
            narHash = "sha256-0Qr9+GqYRyYkCjDiFK8ojC7jtlm3v8QfW/wZHYjWVbY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.4.286.tgz";
          };
          ident = "electron-to-chromium";
          ltype = "file";
          treeInfo = { };
          version = "1.4.286";
        };
      };
      emittery = {
        "0.13.1" = {
          fetchInfo = {
            narHash = "sha256-d68vhC4wKZVcSFA8JgzkNYFzSFZE12DYKZCIX+uVveU=";
            type = "tarball";
            url = "https://registry.npmjs.org/emittery/-/emittery-0.13.1.tgz";
          };
          ident = "emittery";
          ltype = "file";
          treeInfo = { };
          version = "0.13.1";
        };
      };
      emoji-regex = {
        "8.0.0" = {
          fetchInfo = {
            narHash = "sha256-WRW3MHslwJkKGL+xt09TThHNLeRiKIcUGIk1j+ewTpc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
          };
          ident = "emoji-regex";
          ltype = "file";
          treeInfo = { };
          version = "8.0.0";
        };
      };
      error-ex = {
        "1.3.2" = {
          depInfo = {
            is-arrayish = {
              descriptor = "^0.2.1";
              pin = "0.2.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-daqjq1BAM46eXv0Nt+56+SGe+PTSy7sK4X6E66WwGSw=";
            type = "tarball";
            url = "https://registry.npmjs.org/error-ex/-/error-ex-1.3.2.tgz";
          };
          ident = "error-ex";
          ltype = "file";
          treeInfo = {
            "node_modules/is-arrayish" = {
              key = "is-arrayish/0.2.1";
              link = true;
            };
          };
          version = "1.3.2";
        };
      };
      escalade = {
        "3.1.1" = {
          fetchInfo = {
            narHash = "sha256-5BSRjy0hMk0+ydgMP5t57Y4ea7VnLGGH3YIkNT9a11E=";
            type = "tarball";
            url = "https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz";
          };
          ident = "escalade";
          ltype = "file";
          treeInfo = { };
          version = "3.1.1";
        };
      };
      escape-string-regexp = {
        "1.0.5" = {
          fetchInfo = {
            narHash = "sha256-jI2WTcziWydQXDepnqeq9ZLmmJeODhVO2w1qLvZc90Q=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
          };
          ident = "escape-string-regexp";
          ltype = "file";
          treeInfo = { };
          version = "1.0.5";
        };
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-vkujQT11FXPYPLbtNceSPBwfuFa1FdumSszFaQE48ZA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz";
          };
          ident = "escape-string-regexp";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      esprima = {
        "4.0.1" = {
          binInfo = {
            binPairs = {
              esparse = "bin/esparse.js";
              esvalidate = "bin/esvalidate.js";
            };
          };
          fetchInfo = {
            narHash = "sha256-1+SuAJDLWU9BTTp5ceLHWDAlVfETkd5VW35T9kxNNg0=";
            type = "tarball";
            url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
          };
          ident = "esprima";
          ltype = "file";
          treeInfo = { };
          version = "4.0.1";
        };
      };
      execa = {
        "5.1.1" = {
          depInfo = {
            cross-spawn = {
              descriptor = "^7.0.3";
              pin = "7.0.3";
              runtime = true;
            };
            get-stream = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
            human-signals = {
              descriptor = "^2.1.0";
              pin = "2.1.0";
              runtime = true;
            };
            is-stream = {
              descriptor = "^2.0.0";
              pin = "2.0.1";
              runtime = true;
            };
            merge-stream = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            npm-run-path = {
              descriptor = "^4.0.1";
              pin = "4.0.1";
              runtime = true;
            };
            onetime = {
              descriptor = "^5.1.2";
              pin = "5.1.2";
              runtime = true;
            };
            signal-exit = {
              descriptor = "^3.0.3";
              pin = "3.0.7";
              runtime = true;
            };
            strip-final-newline = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-P5IyUg7KIfSrao+yxAluQcJpF6R2YDzPqoOnmcLbVtQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/execa/-/execa-5.1.1.tgz";
          };
          ident = "execa";
          ltype = "file";
          treeInfo = {
            "node_modules/cross-spawn" = {
              key = "cross-spawn/7.0.3";
              link = true;
            };
            "node_modules/get-stream" = {
              key = "get-stream/6.0.1";
              link = true;
            };
            "node_modules/human-signals" = {
              key = "human-signals/2.1.0";
              link = true;
            };
            "node_modules/is-stream" = {
              key = "is-stream/2.0.1";
              link = true;
            };
            "node_modules/merge-stream" = {
              key = "merge-stream/2.0.0";
              link = true;
            };
            "node_modules/npm-run-path" = {
              key = "npm-run-path/4.0.1";
              link = true;
            };
            "node_modules/onetime" = {
              key = "onetime/5.1.2";
              link = true;
            };
            "node_modules/signal-exit" = {
              key = "signal-exit/3.0.7";
              link = true;
            };
            "node_modules/strip-final-newline" = {
              key = "strip-final-newline/2.0.0";
              link = true;
            };
          };
          version = "5.1.1";
        };
      };
      exit = {
        "0.1.2" = {
          fetchInfo = {
            narHash = "sha256-VTlgbIOOKaE8jGTtOWzOZj+Hv3DEY1J8zSlGa1+fy+M=";
            type = "tarball";
            url = "https://registry.npmjs.org/exit/-/exit-0.1.2.tgz";
          };
          ident = "exit";
          ltype = "file";
          treeInfo = { };
          version = "0.1.2";
        };
      };
      expect = {
        "29.4.1" = {
          depInfo = {
            "@jest/expect-utils" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-gymqtUREcpuLa4nZpJcYKrF1eg6F4BiTp8Q82USUdbA=";
            type = "tarball";
            url = "https://registry.npmjs.org/expect/-/expect-29.4.1.tgz";
          };
          ident = "expect";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/expect-utils" = {
              key = "@jest/expect-utils/29.4.1";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/jest-matcher-utils" = {
              key = "jest-matcher-utils/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      fast-json-stable-stringify = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-nvrcRKamdCbRlzJK0Bh6NkK5zpCoFhkizKEov4yK2oI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
          };
          ident = "fast-json-stable-stringify";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      fb-watchman = {
        "2.0.2" = {
          depInfo = {
            bser = {
              descriptor = "2.1.1";
              pin = "2.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Kj2gr0cIacdte4HN/EIVHEB+ijMg60KZ0yo+Rbo93kE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/fb-watchman/-/fb-watchman-2.0.2.tgz";
          };
          ident = "fb-watchman";
          ltype = "file";
          treeInfo = {
            "node_modules/bser" = {
              key = "bser/2.1.1";
              link = true;
            };
          };
          version = "2.0.2";
        };
      };
      fill-range = {
        "7.0.1" = {
          depInfo = {
            to-regex-range = {
              descriptor = "^5.0.1";
              pin = "5.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-1Cy9dyWlI0TnadlFR9TSryNYjR27SRRWtTT6oDiUHps=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz";
          };
          ident = "fill-range";
          ltype = "file";
          treeInfo = {
            "node_modules/to-regex-range" = {
              key = "to-regex-range/5.0.1";
              link = true;
            };
          };
          version = "7.0.1";
        };
      };
      find-up = {
        "4.1.0" = {
          depInfo = {
            locate-path = {
              descriptor = "^5.0.0";
              pin = "5.0.0";
              runtime = true;
            };
            path-exists = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-RyiU9QrLCztK8HwKvBHafHFAfplrWNbDyDnwDtUbG3U=";
            type = "tarball";
            url = "https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz";
          };
          ident = "find-up";
          ltype = "file";
          treeInfo = {
            "node_modules/locate-path" = {
              key = "locate-path/5.0.0";
              link = true;
            };
            "node_modules/path-exists" = {
              key = "path-exists/4.0.0";
              link = true;
            };
          };
          version = "4.1.0";
        };
      };
      "fs.realpath" = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-oPk2F5VP+ECdKr8qs3h0dziW0mK71uwTUrbgulLI/ks=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
          };
          ident = "fs.realpath";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      fsevents = {
        "2.3.2" = {
          fetchInfo = {
            narHash = "sha256-E3+DvwgglDWVPPUVoggGWI8OFZR0YJ5zk7nYB4+UwLI=";
            type = "tarball";
            url = "https://registry.npmjs.org/fsevents/-/fsevents-2.3.2.tgz";
          };
          ident = "fsevents";
          lifecycle = { install = true; };
          ltype = "file";
          sysInfo = { os = [ "darwin" ]; };
          treeInfo = { };
          version = "2.3.2";
        };
      };
      function-bind = {
        "1.1.1" = {
          fetchInfo = {
            narHash = "sha256-9SZTeDBJ87ogdiEHyC3b2/wr1Bv8qb8rCJeD+OYvf9A=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
          };
          ident = "function-bind";
          ltype = "file";
          treeInfo = { };
          version = "1.1.1";
        };
      };
      gensync = {
        "1.0.0-beta.2" = {
          fetchInfo = {
            narHash = "sha256-fdVyvOEbaT+V2XrtoD05vDFG3++pJ+ugq1V15xJb0vs=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz";
          };
          ident = "gensync";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0-beta.2";
        };
      };
      get-caller-file = {
        "2.0.5" = {
          fetchInfo = {
            narHash = "sha256-6s6ASytSaJ0gB+1O75bM58qa3ql1fpWpA8ayznW3F+I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
          };
          ident = "get-caller-file";
          ltype = "file";
          treeInfo = { };
          version = "2.0.5";
        };
      };
      get-package-type = {
        "0.1.0" = {
          fetchInfo = {
            narHash = "sha256-MyiDnBrXlnwOXPDdIEgp2q+FFKa+unDFXjEingS2kU0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/get-package-type/-/get-package-type-0.1.0.tgz";
          };
          ident = "get-package-type";
          ltype = "file";
          treeInfo = { };
          version = "0.1.0";
        };
      };
      get-stream = {
        "6.0.1" = {
          fetchInfo = {
            narHash = "sha256-NkzeCHoKd73Q37o0O2OT8yyusJPNB3pWuTNPjTHRZN8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/get-stream/-/get-stream-6.0.1.tgz";
          };
          ident = "get-stream";
          ltype = "file";
          treeInfo = { };
          version = "6.0.1";
        };
      };
      glob = {
        "7.2.3" = {
          depInfo = {
            "fs.realpath" = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            inflight = {
              descriptor = "^1.0.4";
              pin = "1.0.6";
              runtime = true;
            };
            inherits = {
              descriptor = "2";
              pin = "2.0.4";
              runtime = true;
            };
            minimatch = {
              descriptor = "^3.1.1";
              pin = "3.1.2";
              runtime = true;
            };
            once = {
              descriptor = "^1.3.0";
              pin = "1.4.0";
              runtime = true;
            };
            path-is-absolute = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-QWp5le1Zd7QYp0SXrWVhX3TLZylTpU48NZ+D04pf6b4=";
            type = "tarball";
            url = "https://registry.npmjs.org/glob/-/glob-7.2.3.tgz";
          };
          ident = "glob";
          ltype = "file";
          treeInfo = {
            "node_modules/fs.realpath" = {
              key = "fs.realpath/1.0.0";
              link = true;
            };
            "node_modules/inflight" = {
              key = "inflight/1.0.6";
              link = true;
            };
            "node_modules/inherits" = {
              key = "inherits/2.0.4";
              link = true;
            };
            "node_modules/minimatch" = {
              key = "minimatch/3.1.2";
              link = true;
            };
            "node_modules/once" = {
              key = "once/1.4.0";
              link = true;
            };
            "node_modules/path-is-absolute" = {
              key = "path-is-absolute/1.0.1";
              link = true;
            };
          };
          version = "7.2.3";
        };
      };
      globals = {
        "11.12.0" = {
          fetchInfo = {
            narHash = "sha256-5yDNgqu+A2qodKACTpd75x7p2A9nYGPPLrpaSQiJg5U=";
            type = "tarball";
            url = "https://registry.npmjs.org/globals/-/globals-11.12.0.tgz";
          };
          ident = "globals";
          ltype = "file";
          treeInfo = { };
          version = "11.12.0";
        };
      };
      graceful-fs = {
        "4.2.10" = {
          fetchInfo = {
            narHash = "sha256-AUh4d+JbA0dSyhYmzx3ijrByR9pa70BABBehjnWiwG0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.10.tgz";
          };
          ident = "graceful-fs";
          ltype = "file";
          treeInfo = { };
          version = "4.2.10";
        };
      };
      has = {
        "1.0.3" = {
          depInfo = {
            function-bind = {
              descriptor = "^1.1.1";
              pin = "1.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-z8QWvFmgxmKtQJ34TpRAZljXFJmXY0WUMPj1K64SHx4=";
            type = "tarball";
            url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
          };
          ident = "has";
          ltype = "file";
          treeInfo = {
            "node_modules/function-bind" = {
              key = "function-bind/1.1.1";
              link = true;
            };
          };
          version = "1.0.3";
        };
      };
      has-flag = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-6FPI3mvzeaWOqNs71lre0tBCY/xdSo+7lBMqw1c9lM4=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz";
          };
          ident = "has-flag";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-vPSUFfMlEN5g/4ID+ZlkxJd2xcrLd2zb1zB0uEfVeKE=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
          };
          ident = "has-flag";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      html-escaper = {
        "2.0.2" = {
          fetchInfo = {
            narHash = "sha256-BbVGi29IKasBEuO7EaQYHa1vTtZfvbw05JhtCAvDhGw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/html-escaper/-/html-escaper-2.0.2.tgz";
          };
          ident = "html-escaper";
          ltype = "file";
          treeInfo = { };
          version = "2.0.2";
        };
      };
      human-signals = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-KRp+zRfFzMRydLkYqjMF4hAY131GmpbWfJB3Lgxiia4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/human-signals/-/human-signals-2.1.0.tgz";
          };
          ident = "human-signals";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      import-local = {
        "3.1.0" = {
          binInfo = {
            binPairs = { import-local-fixture = "fixtures/cli.js"; };
          };
          depInfo = {
            pkg-dir = {
              descriptor = "^4.2.0";
              pin = "4.2.0";
              runtime = true;
            };
            resolve-cwd = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-pItB0MAjJCBTcipME2xzK2VkkjVmtMEQSzklnUUpM+M=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/import-local/-/import-local-3.1.0.tgz";
          };
          ident = "import-local";
          ltype = "file";
          treeInfo = {
            "node_modules/pkg-dir" = {
              key = "pkg-dir/4.2.0";
              link = true;
            };
            "node_modules/resolve-cwd" = {
              key = "resolve-cwd/3.0.0";
              link = true;
            };
          };
          version = "3.1.0";
        };
      };
      imurmurhash = {
        "0.1.4" = {
          fetchInfo = {
            narHash = "sha256-kQg6DzTfAqCJNsP9gs1WygIi03+4/AGeF43p9h4LH30=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz";
          };
          ident = "imurmurhash";
          ltype = "file";
          treeInfo = { };
          version = "0.1.4";
        };
      };
      inflight = {
        "1.0.6" = {
          depInfo = {
            once = {
              descriptor = "^1.3.0";
              pin = "1.4.0";
              runtime = true;
            };
            wrappy = {
              descriptor = "1";
              pin = "1.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-QYcVNxVNod45ft7XJVhWJCKuVPN95a8FwfAefYWKqhg=";
            type = "tarball";
            url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
          };
          ident = "inflight";
          ltype = "file";
          treeInfo = {
            "node_modules/once" = {
              key = "once/1.4.0";
              link = true;
            };
            "node_modules/wrappy" = {
              key = "wrappy/1.0.2";
              link = true;
            };
          };
          version = "1.0.6";
        };
      };
      inherits = {
        "2.0.4" = {
          fetchInfo = {
            narHash = "sha256-EnwyCC7V9GbsUCFpqRNJtPNfbbEqyJTYxbRqR5SgYW0=";
            type = "tarball";
            url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
          };
          ident = "inherits";
          ltype = "file";
          treeInfo = { };
          version = "2.0.4";
        };
      };
      is-arrayish = {
        "0.2.1" = {
          fetchInfo = {
            narHash = "sha256-wvuJg92GZxDL9IffjN5ttz8DRki65ZgZoM3Mr1V9IyM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz";
          };
          ident = "is-arrayish";
          ltype = "file";
          treeInfo = { };
          version = "0.2.1";
        };
      };
      is-core-module = {
        "2.11.0" = {
          depInfo = {
            has = {
              descriptor = "^1.0.3";
              pin = "1.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-/nUASoPE2TWgzP0+HyPY6qEb67Kw1stZTtWMMykFcdY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/is-core-module/-/is-core-module-2.11.0.tgz";
          };
          ident = "is-core-module";
          ltype = "file";
          treeInfo = {
            "node_modules/has" = {
              key = "has/1.0.3";
              link = true;
            };
          };
          version = "2.11.0";
        };
      };
      is-fullwidth-code-point = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-FAwh/1ODBHIw/Tm2EQLvleV6Xkb1qy7AKy6kBEi9ei8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
          };
          ident = "is-fullwidth-code-point";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      is-generator-fn = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-XRFwzB6BOSYOHcqZs42DXlxYEwfjFUQ3X9/g+r69FW8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/is-generator-fn/-/is-generator-fn-2.1.0.tgz";
          };
          ident = "is-generator-fn";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      is-number = {
        "7.0.0" = {
          fetchInfo = {
            narHash = "sha256-sOcAFDhYCindWvE4jW6RNeoCBP4VZEyS7M3dq7cGgNI=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz";
          };
          ident = "is-number";
          ltype = "file";
          treeInfo = { };
          version = "7.0.0";
        };
      };
      is-stream = {
        "2.0.1" = {
          fetchInfo = {
            narHash = "sha256-Fh80EDj5F2Taioq1Q5Q877MARryNTEB3CzpqWiSUlJQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-stream/-/is-stream-2.0.1.tgz";
          };
          ident = "is-stream";
          ltype = "file";
          treeInfo = { };
          version = "2.0.1";
        };
      };
      isexe = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-l3Fv+HpHS6H1TqfC1WSGjsGlX08oDHyHdsEu9JQkvhE=";
            type = "tarball";
            url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
          };
          ident = "isexe";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      istanbul-lib-coverage = {
        "3.2.0" = {
          fetchInfo = {
            narHash = "sha256-SBDQUKLOF5c2ZbzCiUKmwBRjeL6z9bfOEOiZUEQ4nok=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.0.tgz";
          };
          ident = "istanbul-lib-coverage";
          ltype = "file";
          treeInfo = { };
          version = "3.2.0";
        };
      };
      istanbul-lib-instrument = {
        "5.2.1" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.12.3";
              pin = "7.20.12";
              runtime = true;
            };
            "@babel/parser" = {
              descriptor = "^7.14.7";
              pin = "7.20.15";
              runtime = true;
            };
            "@istanbuljs/schema" = {
              descriptor = "^0.1.2";
              pin = "0.1.3";
              runtime = true;
            };
            istanbul-lib-coverage = {
              descriptor = "^3.2.0";
              pin = "3.2.0";
              runtime = true;
            };
            semver = {
              descriptor = "^6.3.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-PS2ATZvRq78EeJLAAtnWYVq5FRvdU8Rl6LSkqUIapwI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/istanbul-lib-instrument/-/istanbul-lib-instrument-5.2.1.tgz";
          };
          ident = "istanbul-lib-instrument";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/core" = {
              key = "@babel/core/7.20.12";
              link = true;
            };
            "node_modules/@babel/parser" = {
              key = "@babel/parser/7.20.15";
              link = true;
            };
            "node_modules/@istanbuljs/schema" = {
              key = "@istanbuljs/schema/0.1.3";
              link = true;
            };
            "node_modules/istanbul-lib-coverage" = {
              key = "istanbul-lib-coverage/3.2.0";
              link = true;
            };
            "node_modules/semver" = {
              key = "semver/6.3.0";
              link = true;
            };
          };
          version = "5.2.1";
        };
      };
      istanbul-lib-report = {
        "3.0.0" = {
          depInfo = {
            istanbul-lib-coverage = {
              descriptor = "^3.0.0";
              pin = "3.2.0";
              runtime = true;
            };
            make-dir = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
            supports-color = {
              descriptor = "^7.1.0";
              pin = "7.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yKHY7rQy7O64fcuZZAEIlfSPyuxhxkrCUy/c8QK/brQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz";
          };
          ident = "istanbul-lib-report";
          ltype = "file";
          treeInfo = {
            "node_modules/istanbul-lib-coverage" = {
              key = "istanbul-lib-coverage/3.2.0";
              link = true;
            };
            "node_modules/make-dir" = {
              key = "make-dir/3.1.0";
              link = true;
            };
            "node_modules/supports-color" = {
              key = "supports-color/7.2.0";
              link = true;
            };
          };
          version = "3.0.0";
        };
      };
      istanbul-lib-source-maps = {
        "4.0.1" = {
          depInfo = {
            debug = {
              descriptor = "^4.1.1";
              pin = "4.3.4";
              runtime = true;
            };
            istanbul-lib-coverage = {
              descriptor = "^3.0.0";
              pin = "3.2.0";
              runtime = true;
            };
            source-map = {
              descriptor = "^0.6.1";
              pin = "0.6.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LzM3eLKblVpcvRRAphG/u8JajQI/2+d2ZudWVJAdtww=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.1.tgz";
          };
          ident = "istanbul-lib-source-maps";
          ltype = "file";
          treeInfo = {
            "node_modules/debug" = {
              key = "debug/4.3.4";
              link = true;
            };
            "node_modules/istanbul-lib-coverage" = {
              key = "istanbul-lib-coverage/3.2.0";
              link = true;
            };
            "node_modules/source-map" = {
              key = "source-map/0.6.1";
              link = true;
            };
          };
          version = "4.0.1";
        };
      };
      istanbul-reports = {
        "3.1.5" = {
          depInfo = {
            html-escaper = {
              descriptor = "^2.0.0";
              pin = "2.0.2";
              runtime = true;
            };
            istanbul-lib-report = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OQeV9DHf3izsuXJaUHQNJT9kJUT5KTmR+dgiJdP59D8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/istanbul-reports/-/istanbul-reports-3.1.5.tgz";
          };
          ident = "istanbul-reports";
          ltype = "file";
          treeInfo = {
            "node_modules/html-escaper" = {
              key = "html-escaper/2.0.2";
              link = true;
            };
            "node_modules/istanbul-lib-report" = {
              key = "istanbul-lib-report/3.0.0";
              link = true;
            };
          };
          version = "3.1.5";
        };
      };
      jest = {
        "29.4.1" = {
          binInfo = { binPairs = { jest = "bin/jest.js"; }; };
          depInfo = {
            "@jest/core" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            import-local = {
              descriptor = "^3.0.2";
              pin = "3.1.0";
              runtime = true;
            };
            jest-cli = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Ku5tjkZjYVqVjgvS+IyVWBEYQ+yQzkOcLFsdUckSZQ0=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest/-/jest-29.4.1.tgz";
          };
          ident = "jest";
          ltype = "file";
          peerInfo = {
            node-notifier = {
              descriptor = "^8.0.1 || ^9.0.0 || ^10.0.0";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/@ampproject/remapping" = {
              key = "@ampproject/remapping/2.2.0";
            };
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
            };
            "node_modules/@babel/compat-data" = {
              key = "@babel/compat-data/7.20.14";
            };
            "node_modules/@babel/core" = { key = "@babel/core/7.20.12"; };
            "node_modules/@babel/core/node_modules/convert-source-map" = {
              key = "convert-source-map/1.9.0";
            };
            "node_modules/@babel/generator" = {
              key = "@babel/generator/7.20.14";
            };
            "node_modules/@babel/generator/node_modules/@jridgewell/gen-mapping" =
              {
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
            "node_modules/@babel/helpers" = { key = "@babel/helpers/7.20.13"; };
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
            "node_modules/@babel/highlight/node_modules/escape-string-regexp" =
              {
                key = "escape-string-regexp/1.0.5";
              };
            "node_modules/@babel/highlight/node_modules/has-flag" = {
              key = "has-flag/3.0.0";
            };
            "node_modules/@babel/highlight/node_modules/supports-color" = {
              key = "supports-color/5.5.0";
            };
            "node_modules/@babel/parser" = { key = "@babel/parser/7.20.15"; };
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
            "node_modules/@babel/plugin-syntax-jsx" = {
              key = "@babel/plugin-syntax-jsx/7.18.6";
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
            "node_modules/@babel/plugin-syntax-top-level-await" = {
              key = "@babel/plugin-syntax-top-level-await/7.14.5";
            };
            "node_modules/@babel/plugin-syntax-typescript" = {
              key = "@babel/plugin-syntax-typescript/7.20.0";
            };
            "node_modules/@babel/template" = {
              key = "@babel/template/7.20.7";
            };
            "node_modules/@babel/traverse" = {
              key = "@babel/traverse/7.20.13";
            };
            "node_modules/@babel/types" = { key = "@babel/types/7.20.7"; };
            "node_modules/@bcoe/v8-coverage" = {
              key = "@bcoe/v8-coverage/0.2.3";
            };
            "node_modules/@istanbuljs/load-nyc-config" = {
              key = "@istanbuljs/load-nyc-config/1.1.0";
            };
            "node_modules/@istanbuljs/schema" = {
              key = "@istanbuljs/schema/0.1.3";
            };
            "node_modules/@jest/console" = { key = "@jest/console/29.4.1"; };
            "node_modules/@jest/core" = { key = "@jest/core/29.4.1"; };
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
            };
            "node_modules/@jest/expect" = { key = "@jest/expect/29.4.1"; };
            "node_modules/@jest/expect-utils" = {
              key = "@jest/expect-utils/29.4.1";
            };
            "node_modules/@jest/fake-timers" = {
              key = "@jest/fake-timers/29.4.1";
            };
            "node_modules/@jest/globals" = { key = "@jest/globals/29.4.1"; };
            "node_modules/@jest/reporters" = {
              key = "@jest/reporters/29.4.1";
            };
            "node_modules/@jest/schemas" = { key = "@jest/schemas/29.4.0"; };
            "node_modules/@jest/source-map" = {
              key = "@jest/source-map/29.2.0";
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
            };
            "node_modules/@jest/test-sequencer" = {
              key = "@jest/test-sequencer/29.4.1";
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
            };
            "node_modules/@jest/types" = { key = "@jest/types/29.4.1"; };
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
            "node_modules/@sinclair/typebox" = {
              key = "@sinclair/typebox/0.25.21";
            };
            "node_modules/@sinonjs/commons" = {
              key = "@sinonjs/commons/2.0.0";
            };
            "node_modules/@sinonjs/fake-timers" = {
              key = "@sinonjs/fake-timers/10.0.2";
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
              key = "@types/istanbul-reports/3.0.1";
            };
            "node_modules/@types/node" = { key = "@types/node/18.11.18"; };
            "node_modules/@types/prettier" = { key = "@types/prettier/2.7.2"; };
            "node_modules/@types/stack-utils" = {
              key = "@types/stack-utils/2.0.1";
            };
            "node_modules/@types/yargs" = { key = "@types/yargs/17.0.22"; };
            "node_modules/@types/yargs-parser" = {
              key = "@types/yargs-parser/21.0.0";
            };
            "node_modules/ansi-escapes" = { key = "ansi-escapes/4.3.2"; };
            "node_modules/ansi-regex" = { key = "ansi-regex/5.0.1"; };
            "node_modules/ansi-styles" = { key = "ansi-styles/4.3.0"; };
            "node_modules/anymatch" = { key = "anymatch/3.1.3"; };
            "node_modules/argparse" = { key = "argparse/1.0.10"; };
            "node_modules/babel-jest" = { key = "babel-jest/29.4.1"; };
            "node_modules/babel-plugin-istanbul" = {
              key = "babel-plugin-istanbul/6.1.1";
            };
            "node_modules/babel-plugin-jest-hoist" = {
              key = "babel-plugin-jest-hoist/29.4.0";
            };
            "node_modules/babel-preset-current-node-syntax" = {
              key = "babel-preset-current-node-syntax/1.0.1";
            };
            "node_modules/babel-preset-jest" = {
              key = "babel-preset-jest/29.4.0";
            };
            "node_modules/balanced-match" = { key = "balanced-match/1.0.2"; };
            "node_modules/brace-expansion" = {
              key = "brace-expansion/1.1.11";
            };
            "node_modules/braces" = { key = "braces/3.0.2"; };
            "node_modules/browserslist" = { key = "browserslist/4.21.5"; };
            "node_modules/bser" = { key = "bser/2.1.1"; };
            "node_modules/buffer-from" = { key = "buffer-from/1.1.2"; };
            "node_modules/callsites" = { key = "callsites/3.1.0"; };
            "node_modules/camelcase" = { key = "camelcase/5.3.1"; };
            "node_modules/caniuse-lite" = {
              key = "caniuse-lite/1.0.30001450";
            };
            "node_modules/chalk" = { key = "chalk/4.1.2"; };
            "node_modules/char-regex" = { key = "char-regex/1.0.2"; };
            "node_modules/ci-info" = { key = "ci-info/3.7.1"; };
            "node_modules/cjs-module-lexer" = {
              key = "cjs-module-lexer/1.2.2";
            };
            "node_modules/cliui" = { key = "cliui/8.0.1"; };
            "node_modules/co" = { key = "co/4.6.0"; };
            "node_modules/collect-v8-coverage" = {
              key = "collect-v8-coverage/1.0.1";
            };
            "node_modules/color-convert" = { key = "color-convert/2.0.1"; };
            "node_modules/color-name" = { key = "color-name/1.1.4"; };
            "node_modules/concat-map" = { key = "concat-map/0.0.1"; };
            "node_modules/convert-source-map" = {
              key = "convert-source-map/2.0.0";
            };
            "node_modules/cross-spawn" = { key = "cross-spawn/7.0.3"; };
            "node_modules/debug" = { key = "debug/4.3.4"; };
            "node_modules/dedent" = { key = "dedent/0.7.0"; };
            "node_modules/deepmerge" = { key = "deepmerge/4.3.0"; };
            "node_modules/detect-newline" = { key = "detect-newline/3.1.0"; };
            "node_modules/diff-sequences" = { key = "diff-sequences/29.3.1"; };
            "node_modules/electron-to-chromium" = {
              key = "electron-to-chromium/1.4.286";
            };
            "node_modules/emittery" = { key = "emittery/0.13.1"; };
            "node_modules/emoji-regex" = { key = "emoji-regex/8.0.0"; };
            "node_modules/error-ex" = { key = "error-ex/1.3.2"; };
            "node_modules/escalade" = { key = "escalade/3.1.1"; };
            "node_modules/escape-string-regexp" = {
              key = "escape-string-regexp/2.0.0";
            };
            "node_modules/esprima" = { key = "esprima/4.0.1"; };
            "node_modules/execa" = { key = "execa/5.1.1"; };
            "node_modules/exit" = { key = "exit/0.1.2"; };
            "node_modules/expect" = { key = "expect/29.4.1"; };
            "node_modules/fast-json-stable-stringify" = {
              key = "fast-json-stable-stringify/2.1.0";
            };
            "node_modules/fb-watchman" = { key = "fb-watchman/2.0.2"; };
            "node_modules/fill-range" = { key = "fill-range/7.0.1"; };
            "node_modules/find-up" = { key = "find-up/4.1.0"; };
            "node_modules/fs.realpath" = { key = "fs.realpath/1.0.0"; };
            "node_modules/fsevents" = {
              key = "fsevents/2.3.2";
              optional = true;
            };
            "node_modules/function-bind" = { key = "function-bind/1.1.1"; };
            "node_modules/gensync" = { key = "gensync/1.0.0-beta.2"; };
            "node_modules/get-caller-file" = { key = "get-caller-file/2.0.5"; };
            "node_modules/get-package-type" = {
              key = "get-package-type/0.1.0";
            };
            "node_modules/get-stream" = { key = "get-stream/6.0.1"; };
            "node_modules/glob" = { key = "glob/7.2.3"; };
            "node_modules/globals" = { key = "globals/11.12.0"; };
            "node_modules/graceful-fs" = { key = "graceful-fs/4.2.10"; };
            "node_modules/has" = { key = "has/1.0.3"; };
            "node_modules/has-flag" = { key = "has-flag/4.0.0"; };
            "node_modules/html-escaper" = { key = "html-escaper/2.0.2"; };
            "node_modules/human-signals" = { key = "human-signals/2.1.0"; };
            "node_modules/import-local" = { key = "import-local/3.1.0"; };
            "node_modules/imurmurhash" = { key = "imurmurhash/0.1.4"; };
            "node_modules/inflight" = { key = "inflight/1.0.6"; };
            "node_modules/inherits" = { key = "inherits/2.0.4"; };
            "node_modules/is-arrayish" = { key = "is-arrayish/0.2.1"; };
            "node_modules/is-core-module" = { key = "is-core-module/2.11.0"; };
            "node_modules/is-fullwidth-code-point" = {
              key = "is-fullwidth-code-point/3.0.0";
            };
            "node_modules/is-generator-fn" = { key = "is-generator-fn/2.1.0"; };
            "node_modules/is-number" = { key = "is-number/7.0.0"; };
            "node_modules/is-stream" = { key = "is-stream/2.0.1"; };
            "node_modules/isexe" = { key = "isexe/2.0.0"; };
            "node_modules/istanbul-lib-coverage" = {
              key = "istanbul-lib-coverage/3.2.0";
            };
            "node_modules/istanbul-lib-instrument" = {
              key = "istanbul-lib-instrument/5.2.1";
            };
            "node_modules/istanbul-lib-report" = {
              key = "istanbul-lib-report/3.0.0";
            };
            "node_modules/istanbul-lib-source-maps" = {
              key = "istanbul-lib-source-maps/4.0.1";
            };
            "node_modules/istanbul-reports" = {
              key = "istanbul-reports/3.1.5";
            };
            "node_modules/jest-changed-files" = {
              key = "jest-changed-files/29.4.0";
            };
            "node_modules/jest-circus" = { key = "jest-circus/29.4.1"; };
            "node_modules/jest-cli" = { key = "jest-cli/29.4.1"; };
            "node_modules/jest-config" = { key = "jest-config/29.4.1"; };
            "node_modules/jest-diff" = { key = "jest-diff/29.4.1"; };
            "node_modules/jest-docblock" = { key = "jest-docblock/29.2.0"; };
            "node_modules/jest-each" = { key = "jest-each/29.4.1"; };
            "node_modules/jest-environment-node" = {
              key = "jest-environment-node/29.4.1";
            };
            "node_modules/jest-get-type" = { key = "jest-get-type/29.2.0"; };
            "node_modules/jest-haste-map" = { key = "jest-haste-map/29.4.1"; };
            "node_modules/jest-leak-detector" = {
              key = "jest-leak-detector/29.4.1";
            };
            "node_modules/jest-matcher-utils" = {
              key = "jest-matcher-utils/29.4.1";
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
            };
            "node_modules/jest-mock" = { key = "jest-mock/29.4.1"; };
            "node_modules/jest-pnp-resolver" = {
              key = "jest-pnp-resolver/1.2.3";
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
            };
            "node_modules/jest-resolve" = { key = "jest-resolve/29.4.1"; };
            "node_modules/jest-resolve-dependencies" = {
              key = "jest-resolve-dependencies/29.4.1";
            };
            "node_modules/jest-runner" = { key = "jest-runner/29.4.1"; };
            "node_modules/jest-runtime" = { key = "jest-runtime/29.4.1"; };
            "node_modules/jest-runtime/node_modules/lru-cache" = {
              key = "lru-cache/6.0.0";
            };
            "node_modules/jest-runtime/node_modules/semver" = {
              key = "semver/7.3.8";
            };
            "node_modules/jest-runtime/node_modules/yallist" = {
              key = "yallist/4.0.0";
            };
            "node_modules/jest-snapshot" = { key = "jest-snapshot/29.4.1"; };
            "node_modules/jest-snapshot/node_modules/lru-cache" = {
              key = "lru-cache/6.0.0";
            };
            "node_modules/jest-snapshot/node_modules/semver" = {
              key = "semver/7.3.8";
            };
            "node_modules/jest-snapshot/node_modules/yallist" = {
              key = "yallist/4.0.0";
            };
            "node_modules/jest-util" = { key = "jest-util/29.4.1"; };
            "node_modules/jest-validate" = { key = "jest-validate/29.4.1"; };
            "node_modules/jest-validate/node_modules/camelcase" = {
              key = "camelcase/6.3.0";
            };
            "node_modules/jest-watcher" = { key = "jest-watcher/29.4.1"; };
            "node_modules/jest-worker" = { key = "jest-worker/29.4.1"; };
            "node_modules/jest-worker/node_modules/supports-color" = {
              key = "supports-color/8.1.1";
            };
            "node_modules/js-tokens" = { key = "js-tokens/4.0.0"; };
            "node_modules/js-yaml" = { key = "js-yaml/3.14.1"; };
            "node_modules/jsesc" = { key = "jsesc/2.5.2"; };
            "node_modules/json-parse-even-better-errors" = {
              key = "json-parse-even-better-errors/2.3.1";
            };
            "node_modules/json5" = { key = "json5/2.2.3"; };
            "node_modules/kleur" = { key = "kleur/3.0.3"; };
            "node_modules/leven" = { key = "leven/3.1.0"; };
            "node_modules/lines-and-columns" = {
              key = "lines-and-columns/1.2.4";
            };
            "node_modules/locate-path" = { key = "locate-path/5.0.0"; };
            "node_modules/lru-cache" = { key = "lru-cache/5.1.1"; };
            "node_modules/make-dir" = { key = "make-dir/3.1.0"; };
            "node_modules/makeerror" = { key = "makeerror/1.0.12"; };
            "node_modules/merge-stream" = { key = "merge-stream/2.0.0"; };
            "node_modules/micromatch" = { key = "micromatch/4.0.5"; };
            "node_modules/mimic-fn" = { key = "mimic-fn/2.1.0"; };
            "node_modules/minimatch" = { key = "minimatch/3.1.2"; };
            "node_modules/ms" = { key = "ms/2.1.2"; };
            "node_modules/natural-compare" = { key = "natural-compare/1.4.0"; };
            "node_modules/node-int64" = { key = "node-int64/0.4.0"; };
            "node_modules/node-releases" = { key = "node-releases/2.0.9"; };
            "node_modules/normalize-path" = { key = "normalize-path/3.0.0"; };
            "node_modules/npm-run-path" = { key = "npm-run-path/4.0.1"; };
            "node_modules/once" = { key = "once/1.4.0"; };
            "node_modules/onetime" = { key = "onetime/5.1.2"; };
            "node_modules/p-limit" = { key = "p-limit/3.1.0"; };
            "node_modules/p-locate" = { key = "p-locate/4.1.0"; };
            "node_modules/p-locate/node_modules/p-limit" = {
              key = "p-limit/2.3.0";
            };
            "node_modules/p-try" = { key = "p-try/2.2.0"; };
            "node_modules/parse-json" = { key = "parse-json/5.2.0"; };
            "node_modules/path-exists" = { key = "path-exists/4.0.0"; };
            "node_modules/path-is-absolute" = {
              key = "path-is-absolute/1.0.1";
            };
            "node_modules/path-key" = { key = "path-key/3.1.1"; };
            "node_modules/path-parse" = { key = "path-parse/1.0.7"; };
            "node_modules/picocolors" = { key = "picocolors/1.0.0"; };
            "node_modules/picomatch" = { key = "picomatch/2.3.1"; };
            "node_modules/pirates" = { key = "pirates/4.0.5"; };
            "node_modules/pkg-dir" = { key = "pkg-dir/4.2.0"; };
            "node_modules/pretty-format" = { key = "pretty-format/29.4.1"; };
            "node_modules/pretty-format/node_modules/ansi-styles" = {
              key = "ansi-styles/5.2.0";
            };
            "node_modules/prompts" = { key = "prompts/2.4.2"; };
            "node_modules/react-is" = { key = "react-is/18.2.0"; };
            "node_modules/require-directory" = {
              key = "require-directory/2.1.1";
            };
            "node_modules/resolve" = { key = "resolve/1.22.1"; };
            "node_modules/resolve-cwd" = { key = "resolve-cwd/3.0.0"; };
            "node_modules/resolve-from" = { key = "resolve-from/5.0.0"; };
            "node_modules/resolve.exports" = { key = "resolve.exports/2.0.0"; };
            "node_modules/semver" = { key = "semver/6.3.0"; };
            "node_modules/shebang-command" = { key = "shebang-command/2.0.0"; };
            "node_modules/shebang-regex" = { key = "shebang-regex/3.0.0"; };
            "node_modules/signal-exit" = { key = "signal-exit/3.0.7"; };
            "node_modules/sisteransi" = { key = "sisteransi/1.0.5"; };
            "node_modules/slash" = { key = "slash/3.0.0"; };
            "node_modules/source-map" = { key = "source-map/0.6.1"; };
            "node_modules/source-map-support" = {
              key = "source-map-support/0.5.13";
            };
            "node_modules/sprintf-js" = { key = "sprintf-js/1.0.3"; };
            "node_modules/stack-utils" = { key = "stack-utils/2.0.6"; };
            "node_modules/string-length" = { key = "string-length/4.0.2"; };
            "node_modules/string-width" = { key = "string-width/4.2.3"; };
            "node_modules/strip-ansi" = { key = "strip-ansi/6.0.1"; };
            "node_modules/strip-bom" = { key = "strip-bom/4.0.0"; };
            "node_modules/strip-final-newline" = {
              key = "strip-final-newline/2.0.0";
            };
            "node_modules/strip-json-comments" = {
              key = "strip-json-comments/3.1.1";
            };
            "node_modules/supports-color" = { key = "supports-color/7.2.0"; };
            "node_modules/supports-preserve-symlinks-flag" = {
              key = "supports-preserve-symlinks-flag/1.0.0";
            };
            "node_modules/test-exclude" = { key = "test-exclude/6.0.0"; };
            "node_modules/tmpl" = { key = "tmpl/1.0.5"; };
            "node_modules/to-fast-properties" = {
              key = "to-fast-properties/2.0.0";
            };
            "node_modules/to-regex-range" = { key = "to-regex-range/5.0.1"; };
            "node_modules/type-detect" = { key = "type-detect/4.0.8"; };
            "node_modules/type-fest" = { key = "type-fest/0.21.3"; };
            "node_modules/update-browserslist-db" = {
              key = "update-browserslist-db/1.0.10";
            };
            "node_modules/v8-to-istanbul" = { key = "v8-to-istanbul/9.0.1"; };
            "node_modules/v8-to-istanbul/node_modules/convert-source-map" = {
              key = "convert-source-map/1.9.0";
            };
            "node_modules/walker" = { key = "walker/1.0.8"; };
            "node_modules/which" = { key = "which/2.0.2"; };
            "node_modules/wrap-ansi" = { key = "wrap-ansi/7.0.0"; };
            "node_modules/wrappy" = { key = "wrappy/1.0.2"; };
            "node_modules/write-file-atomic" = {
              key = "write-file-atomic/5.0.0";
            };
            "node_modules/y18n" = { key = "y18n/5.0.8"; };
            "node_modules/yallist" = { key = "yallist/3.1.1"; };
            "node_modules/yargs" = { key = "yargs/17.6.2"; };
            "node_modules/yargs-parser" = { key = "yargs-parser/21.1.1"; };
            "node_modules/yocto-queue" = { key = "yocto-queue/0.1.0"; };
          };
          version = "29.4.1";
        };
      };
      jest-changed-files = {
        "29.4.0" = {
          depInfo = {
            execa = {
              descriptor = "^5.0.0";
              pin = "5.1.1";
              runtime = true;
            };
            p-limit = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5wETae2bJruJ25NgQPGd5njjnygCL2zNy3yneXitSUI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-changed-files/-/jest-changed-files-29.4.0.tgz";
          };
          ident = "jest-changed-files";
          ltype = "file";
          treeInfo = {
            "node_modules/execa" = {
              key = "execa/5.1.1";
              link = true;
            };
            "node_modules/p-limit" = {
              key = "p-limit/3.1.0";
              link = true;
            };
          };
          version = "29.4.0";
        };
      };
      jest-circus = {
        "29.4.1" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/expect" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            co = {
              descriptor = "^4.6.0";
              pin = "4.6.0";
              runtime = true;
            };
            dedent = {
              descriptor = "^0.7.0";
              pin = "0.7.0";
              runtime = true;
            };
            is-generator-fn = {
              descriptor = "^2.0.0";
              pin = "2.1.0";
              runtime = true;
            };
            jest-each = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-runtime = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            p-limit = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            stack-utils = {
              descriptor = "^2.0.3";
              pin = "2.0.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-C9e8UXzdwIKhU2gNt8OhTvAShmOxl6yXC/Xh6b4gPuE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-circus/-/jest-circus-29.4.1.tgz";
          };
          ident = "jest-circus";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
              link = true;
            };
            "node_modules/@jest/expect" = {
              key = "@jest/expect/29.4.1";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/co" = {
              key = "co/4.6.0";
              link = true;
            };
            "node_modules/dedent" = {
              key = "dedent/0.7.0";
              link = true;
            };
            "node_modules/is-generator-fn" = {
              key = "is-generator-fn/2.1.0";
              link = true;
            };
            "node_modules/jest-each" = {
              key = "jest-each/29.4.1";
              link = true;
            };
            "node_modules/jest-matcher-utils" = {
              key = "jest-matcher-utils/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-runtime" = {
              key = "jest-runtime/29.4.1";
              link = true;
            };
            "node_modules/jest-snapshot" = {
              key = "jest-snapshot/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/p-limit" = {
              key = "p-limit/3.1.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/stack-utils" = {
              key = "stack-utils/2.0.6";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-cli = {
        "29.4.1" = {
          binInfo = { binPairs = { jest = "bin/jest.js"; }; };
          depInfo = {
            "@jest/core" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            exit = {
              descriptor = "^0.1.2";
              pin = "0.1.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            import-local = {
              descriptor = "^3.0.2";
              pin = "3.1.0";
              runtime = true;
            };
            jest-config = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            prompts = {
              descriptor = "^2.0.1";
              pin = "2.4.2";
              runtime = true;
            };
            yargs = {
              descriptor = "^17.3.1";
              pin = "17.6.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-iTElFzsW4NlRIWR1fWfPQglhpuMDUrDUCzUIHlx+m9Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-cli/-/jest-cli-29.4.1.tgz";
          };
          ident = "jest-cli";
          ltype = "file";
          peerInfo = {
            node-notifier = {
              descriptor = "^8.0.1 || ^9.0.0 || ^10.0.0";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/@jest/core" = {
              key = "@jest/core/29.4.1";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/exit" = {
              key = "exit/0.1.2";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/import-local" = {
              key = "import-local/3.1.0";
              link = true;
            };
            "node_modules/jest-config" = {
              key = "jest-config/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-validate" = {
              key = "jest-validate/29.4.1";
              link = true;
            };
            "node_modules/prompts" = {
              key = "prompts/2.4.2";
              link = true;
            };
            "node_modules/yargs" = {
              key = "yargs/17.6.2";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-config = {
        "29.4.1" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.11.6";
              pin = "7.20.12";
              runtime = true;
            };
            "@jest/test-sequencer" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            babel-jest = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            ci-info = {
              descriptor = "^3.2.0";
              pin = "3.7.1";
              runtime = true;
            };
            deepmerge = {
              descriptor = "^4.2.2";
              pin = "4.3.0";
              runtime = true;
            };
            glob = {
              descriptor = "^7.1.3";
              pin = "7.2.3";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-circus = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-environment-node = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-runner = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            parse-json = {
              descriptor = "^5.2.0";
              pin = "5.2.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            strip-json-comments = {
              descriptor = "^3.1.1";
              pin = "3.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-NkHp5bGKNVzDMS/telfoGMuevIw4+Rz6vaCtcxcZvXw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-config/-/jest-config-29.4.1.tgz";
          };
          ident = "jest-config";
          ltype = "file";
          peerInfo = {
            "@types/node" = {
              descriptor = "*";
              optional = true;
            };
            ts-node = {
              descriptor = ">=9.0.0";
              optional = true;
            };
          };
          treeInfo = {
            "node_modules/@babel/core" = {
              key = "@babel/core/7.20.12";
              link = true;
            };
            "node_modules/@jest/test-sequencer" = {
              key = "@jest/test-sequencer/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/babel-jest" = {
              key = "babel-jest/29.4.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/ci-info" = {
              key = "ci-info/3.7.1";
              link = true;
            };
            "node_modules/deepmerge" = {
              key = "deepmerge/4.3.0";
              link = true;
            };
            "node_modules/glob" = {
              key = "glob/7.2.3";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-circus" = {
              key = "jest-circus/29.4.1";
              link = true;
            };
            "node_modules/jest-environment-node" = {
              key = "jest-environment-node/29.4.1";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-resolve" = {
              key = "jest-resolve/29.4.1";
              link = true;
            };
            "node_modules/jest-runner" = {
              key = "jest-runner/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-validate" = {
              key = "jest-validate/29.4.1";
              link = true;
            };
            "node_modules/micromatch" = {
              key = "micromatch/4.0.5";
              link = true;
            };
            "node_modules/parse-json" = {
              key = "parse-json/5.2.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/strip-json-comments" = {
              key = "strip-json-comments/3.1.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-diff = {
        "29.4.1" = {
          depInfo = {
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            diff-sequences = {
              descriptor = "^29.3.1";
              pin = "29.3.1";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LgogBQW00j+E8L0+M4Bb4tKWqa850UXTl9qnkvFPaSg=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-diff/-/jest-diff-29.4.1.tgz";
          };
          ident = "jest-diff";
          ltype = "file";
          treeInfo = {
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/diff-sequences" = {
              key = "diff-sequences/29.3.1";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-docblock = {
        "29.2.0" = {
          depInfo = {
            detect-newline = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-dFWMaA3ucMtvSbtxSrxxvIf9yZeS1O9tozGbnOLIJ/Q=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-docblock/-/jest-docblock-29.2.0.tgz";
          };
          ident = "jest-docblock";
          ltype = "file";
          treeInfo = {
            "node_modules/detect-newline" = {
              key = "detect-newline/3.1.0";
              link = true;
            };
          };
          version = "29.2.0";
        };
      };
      jest-each = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-q78mBSfJ1AtXV0uv8PyaErHWdm7B/nt1HWdy3Zb07do=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-each/-/jest-each-29.4.1.tgz";
          };
          ident = "jest-each";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-environment-node = {
        "29.4.1" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/fake-timers" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-H0ByvRcqwjehCwzYE6mGYIjh3H5d6zbSeAdWRX8MtLU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-environment-node/-/jest-environment-node-29.4.1.tgz";
          };
          ident = "jest-environment-node";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
              link = true;
            };
            "node_modules/@jest/fake-timers" = {
              key = "@jest/fake-timers/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/jest-mock" = {
              key = "jest-mock/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-get-type = {
        "29.2.0" = {
          fetchInfo = {
            narHash = "sha256-ZT8Vi4EYJncmeAzQnDev01sIdJwDQGVDamV12G+Z0VI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-get-type/-/jest-get-type-29.2.0.tgz";
          };
          ident = "jest-get-type";
          ltype = "file";
          treeInfo = { };
          version = "29.2.0";
        };
      };
      jest-haste-map = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/graceful-fs" = {
              descriptor = "^4.1.3";
              pin = "4.1.6";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            anymatch = {
              descriptor = "^3.0.3";
              pin = "3.1.3";
              runtime = true;
            };
            fb-watchman = {
              descriptor = "^2.0.0";
              pin = "2.0.2";
              runtime = true;
            };
            fsevents = {
              descriptor = "^2.3.2";
              optional = true;
              pin = "2.3.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-worker = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            walker = {
              descriptor = "^1.0.8";
              pin = "1.0.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-C+H99phSmXLJk45kaTS02sO3pXfo/m5g/6cjp7G8i1E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-haste-map/-/jest-haste-map-29.4.1.tgz";
          };
          ident = "jest-haste-map";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/graceful-fs" = {
              key = "@types/graceful-fs/4.1.6";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/anymatch" = {
              key = "anymatch/3.1.3";
              link = true;
            };
            "node_modules/fb-watchman" = {
              key = "fb-watchman/2.0.2";
              link = true;
            };
            "node_modules/fsevents" = {
              key = "fsevents/2.3.2";
              link = true;
              optional = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-worker" = {
              key = "jest-worker/29.4.1";
              link = true;
            };
            "node_modules/micromatch" = {
              key = "micromatch/4.0.5";
              link = true;
            };
            "node_modules/walker" = {
              key = "walker/1.0.8";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-leak-detector = {
        "29.4.1" = {
          depInfo = {
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fRgCaV/LfaHdoQ36YjZOwOMILIbgyrv3KzjiGfEL5HA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-leak-detector/-/jest-leak-detector-29.4.1.tgz";
          };
          ident = "jest-leak-detector";
          ltype = "file";
          treeInfo = {
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-matcher-utils = {
        "29.4.1" = {
          depInfo = {
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            jest-diff = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8X893hpWYZst9UOuJn0Gb+Z0OHZZxpTTYAMTluB0qsI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-matcher-utils/-/jest-matcher-utils-29.4.1.tgz";
          };
          ident = "jest-matcher-utils";
          ltype = "file";
          treeInfo = {
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/jest-diff" = {
              key = "jest-diff/29.4.1";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-message-util = {
        "29.4.1" = {
          depInfo = {
            "@babel/code-frame" = {
              descriptor = "^7.12.13";
              pin = "7.18.6";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/stack-utils" = {
              descriptor = "^2.0.0";
              pin = "2.0.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.4";
              pin = "4.0.5";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            stack-utils = {
              descriptor = "^2.0.3";
              pin = "2.0.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-KYfi+l4xeY0xMtk3GL09m43gQOSQvpgp353NFD2QlnY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-message-util/-/jest-message-util-29.4.1.tgz";
          };
          ident = "jest-message-util";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/stack-utils" = {
              key = "@types/stack-utils/2.0.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/micromatch" = {
              key = "micromatch/4.0.5";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/stack-utils" = {
              key = "stack-utils/2.0.6";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-mock = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-niQFyu9AE2oucQ0oSybGB2+jVYdULGfnJuwtZRHS098=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-mock/-/jest-mock-29.4.1.tgz";
          };
          ident = "jest-mock";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-pnp-resolver = {
        "1.2.3" = {
          fetchInfo = {
            narHash = "sha256-W/85qiqWwybP98QaAop8DETyZIJyyMwijm7EBZlWKCc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-pnp-resolver/-/jest-pnp-resolver-1.2.3.tgz";
          };
          ident = "jest-pnp-resolver";
          ltype = "file";
          peerInfo = {
            jest-resolve = {
              descriptor = "*";
              optional = true;
            };
          };
          treeInfo = { };
          version = "1.2.3";
        };
      };
      jest-regex-util = {
        "29.2.0" = {
          fetchInfo = {
            narHash = "sha256-f85VXueO5BsWxPQdvNlgsTcKfJ7ZLMDd3O6OhYfWCmI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-regex-util/-/jest-regex-util-29.2.0.tgz";
          };
          ident = "jest-regex-util";
          ltype = "file";
          treeInfo = { };
          version = "29.2.0";
        };
      };
      jest-resolve = {
        "29.4.1" = {
          depInfo = {
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-pnp-resolver = {
              descriptor = "^1.2.2";
              pin = "1.2.3";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            resolve = {
              descriptor = "^1.20.0";
              pin = "1.22.1";
              runtime = true;
            };
            "resolve.exports" = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OOZRNDl7hhaOx7IZbEG/s19nvO0JOlYYa9TIO1b0MLw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-resolve/-/jest-resolve-29.4.1.tgz";
          };
          ident = "jest-resolve";
          ltype = "file";
          treeInfo = {
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-pnp-resolver" = {
              key = "jest-pnp-resolver/1.2.3";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-validate" = {
              key = "jest-validate/29.4.1";
              link = true;
            };
            "node_modules/resolve" = {
              key = "resolve/1.22.1";
              link = true;
            };
            "node_modules/resolve.exports" = {
              key = "resolve.exports/2.0.0";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-resolve-dependencies = {
        "29.4.1" = {
          depInfo = {
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-QyX1CLdzWlJl9gLe97tf4/DhlITkyJF4BfcHk0Ujtic=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-resolve-dependencies/-/jest-resolve-dependencies-29.4.1.tgz";
          };
          ident = "jest-resolve-dependencies";
          ltype = "file";
          treeInfo = {
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-snapshot" = {
              key = "jest-snapshot/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-runner = {
        "29.4.1" = {
          depInfo = {
            "@jest/console" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/environment" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            emittery = {
              descriptor = "^0.13.1";
              pin = "0.13.1";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-docblock = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-environment-node = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-leak-detector = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-runtime = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-watcher = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-worker = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            p-limit = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            source-map-support = {
              descriptor = "0.5.13";
              pin = "0.5.13";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fEqLl5x5WOQOW4CGKgvqNUclBz0rPtankBLXMxxBlwo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-runner/-/jest-runner-29.4.1.tgz";
          };
          ident = "jest-runner";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/console" = {
              key = "@jest/console/29.4.1";
              link = true;
            };
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/emittery" = {
              key = "emittery/0.13.1";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-docblock" = {
              key = "jest-docblock/29.2.0";
              link = true;
            };
            "node_modules/jest-environment-node" = {
              key = "jest-environment-node/29.4.1";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-leak-detector" = {
              key = "jest-leak-detector/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-resolve" = {
              key = "jest-resolve/29.4.1";
              link = true;
            };
            "node_modules/jest-runtime" = {
              key = "jest-runtime/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/jest-watcher" = {
              key = "jest-watcher/29.4.1";
              link = true;
            };
            "node_modules/jest-worker" = {
              key = "jest-worker/29.4.1";
              link = true;
            };
            "node_modules/p-limit" = {
              key = "p-limit/3.1.0";
              link = true;
            };
            "node_modules/source-map-support" = {
              key = "source-map-support/0.5.13";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-runtime = {
        "29.4.1" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/fake-timers" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/globals" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/source-map" = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            cjs-module-lexer = {
              descriptor = "^1.0.0";
              pin = "1.2.2";
              runtime = true;
            };
            collect-v8-coverage = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
            glob = {
              descriptor = "^7.1.3";
              pin = "7.2.3";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            semver = {
              descriptor = "^7.3.5";
              pin = "7.3.8";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            strip-bom = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-oyaHwLWy6RyD2ojVQAY5cgKreR5ArO66Io06pDDMSqY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-runtime/-/jest-runtime-29.4.1.tgz";
          };
          ident = "jest-runtime";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/environment" = {
              key = "@jest/environment/29.4.1";
              link = true;
            };
            "node_modules/@jest/fake-timers" = {
              key = "@jest/fake-timers/29.4.1";
              link = true;
            };
            "node_modules/@jest/globals" = {
              key = "@jest/globals/29.4.1";
              link = true;
            };
            "node_modules/@jest/source-map" = {
              key = "@jest/source-map/29.2.0";
              link = true;
            };
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/cjs-module-lexer" = {
              key = "cjs-module-lexer/1.2.2";
              link = true;
            };
            "node_modules/collect-v8-coverage" = {
              key = "collect-v8-coverage/1.0.1";
              link = true;
            };
            "node_modules/glob" = {
              key = "glob/7.2.3";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-mock" = {
              key = "jest-mock/29.4.1";
              link = true;
            };
            "node_modules/jest-regex-util" = {
              key = "jest-regex-util/29.2.0";
              link = true;
            };
            "node_modules/jest-resolve" = {
              key = "jest-resolve/29.4.1";
              link = true;
            };
            "node_modules/jest-snapshot" = {
              key = "jest-snapshot/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/semver" = {
              key = "semver/7.3.8";
              link = true;
            };
            "node_modules/slash" = {
              key = "slash/3.0.0";
              link = true;
            };
            "node_modules/strip-bom" = {
              key = "strip-bom/4.0.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-snapshot = {
        "29.4.1" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.11.6";
              pin = "7.20.12";
              runtime = true;
            };
            "@babel/generator" = {
              descriptor = "^7.7.2";
              pin = "7.20.14";
              runtime = true;
            };
            "@babel/plugin-syntax-jsx" = {
              descriptor = "^7.7.2";
              pin = "7.18.6";
              runtime = true;
            };
            "@babel/plugin-syntax-typescript" = {
              descriptor = "^7.7.2";
              pin = "7.20.0";
              runtime = true;
            };
            "@babel/traverse" = {
              descriptor = "^7.7.2";
              pin = "7.20.13";
              runtime = true;
            };
            "@babel/types" = {
              descriptor = "^7.3.3";
              pin = "7.20.7";
              runtime = true;
            };
            "@jest/expect-utils" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/babel__traverse" = {
              descriptor = "^7.0.6";
              pin = "7.18.3";
              runtime = true;
            };
            "@types/prettier" = {
              descriptor = "^2.1.5";
              pin = "2.7.2";
              runtime = true;
            };
            babel-preset-current-node-syntax = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            expect = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            jest-diff = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            natural-compare = {
              descriptor = "^1.4.0";
              pin = "1.4.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            semver = {
              descriptor = "^7.3.5";
              pin = "7.3.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-+uWMr8FoTWhwF8+4KQ4SCDWsV9Tp5spnoxFJNQsl/lk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-snapshot/-/jest-snapshot-29.4.1.tgz";
          };
          ident = "jest-snapshot";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/core" = {
              key = "@babel/core/7.20.12";
              link = true;
            };
            "node_modules/@babel/generator" = {
              key = "@babel/generator/7.20.14";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-jsx" = {
              key = "@babel/plugin-syntax-jsx/7.18.6";
              link = true;
            };
            "node_modules/@babel/plugin-syntax-typescript" = {
              key = "@babel/plugin-syntax-typescript/7.20.0";
              link = true;
            };
            "node_modules/@babel/traverse" = {
              key = "@babel/traverse/7.20.13";
              link = true;
            };
            "node_modules/@babel/types" = {
              key = "@babel/types/7.20.7";
              link = true;
            };
            "node_modules/@jest/expect-utils" = {
              key = "@jest/expect-utils/29.4.1";
              link = true;
            };
            "node_modules/@jest/transform" = {
              key = "@jest/transform/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/babel__traverse" = {
              key = "@types/babel__traverse/7.18.3";
              link = true;
            };
            "node_modules/@types/prettier" = {
              key = "@types/prettier/2.7.2";
              link = true;
            };
            "node_modules/babel-preset-current-node-syntax" = {
              key = "babel-preset-current-node-syntax/1.0.1";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/expect" = {
              key = "expect/29.4.1";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/jest-diff" = {
              key = "jest-diff/29.4.1";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/jest-haste-map" = {
              key = "jest-haste-map/29.4.1";
              link = true;
            };
            "node_modules/jest-matcher-utils" = {
              key = "jest-matcher-utils/29.4.1";
              link = true;
            };
            "node_modules/jest-message-util" = {
              key = "jest-message-util/29.4.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/natural-compare" = {
              key = "natural-compare/1.4.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
            "node_modules/semver" = {
              key = "semver/7.3.8";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-util = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            ci-info = {
              descriptor = "^3.2.0";
              pin = "3.7.1";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.9";
              pin = "4.2.10";
              runtime = true;
            };
            picomatch = {
              descriptor = "^2.2.3";
              pin = "2.3.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-erQKK2zO7BH22Ieje6wY1HrpL7Xnfi+e7/Cp6IxY0ds=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-util/-/jest-util-29.4.1.tgz";
          };
          ident = "jest-util";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/ci-info" = {
              key = "ci-info/3.7.1";
              link = true;
            };
            "node_modules/graceful-fs" = {
              key = "graceful-fs/4.2.10";
              link = true;
            };
            "node_modules/picomatch" = {
              key = "picomatch/2.3.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-validate = {
        "29.4.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            camelcase = {
              descriptor = "^6.2.0";
              pin = "6.3.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^29.2.0";
              pin = "29.2.0";
              runtime = true;
            };
            leven = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-mVaBJ24bTlbr4ygIUNl32wcY6ZF0jULtxftLkwFo/VM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-validate/-/jest-validate-29.4.1.tgz";
          };
          ident = "jest-validate";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/camelcase" = {
              key = "camelcase/6.3.0";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/jest-get-type" = {
              key = "jest-get-type/29.2.0";
              link = true;
            };
            "node_modules/leven" = {
              key = "leven/3.1.0";
              link = true;
            };
            "node_modules/pretty-format" = {
              key = "pretty-format/29.4.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-watcher = {
        "29.4.1" = {
          depInfo = {
            "@jest/test-result" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            ansi-escapes = {
              descriptor = "^4.2.1";
              pin = "4.3.2";
              runtime = true;
            };
            chalk = {
              descriptor = "^4.0.0";
              pin = "4.1.2";
              runtime = true;
            };
            emittery = {
              descriptor = "^0.13.1";
              pin = "0.13.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            string-length = {
              descriptor = "^4.0.1";
              pin = "4.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wqebpDn6bOfzaSVBsfI+pprrYqiuWqnGBVayzEFkuV4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-watcher/-/jest-watcher-29.4.1.tgz";
          };
          ident = "jest-watcher";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/test-result" = {
              key = "@jest/test-result/29.4.1";
              link = true;
            };
            "node_modules/@jest/types" = {
              key = "@jest/types/29.4.1";
              link = true;
            };
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/ansi-escapes" = {
              key = "ansi-escapes/4.3.2";
              link = true;
            };
            "node_modules/chalk" = {
              key = "chalk/4.1.2";
              link = true;
            };
            "node_modules/emittery" = {
              key = "emittery/0.13.1";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/string-length" = {
              key = "string-length/4.0.2";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      jest-worker = {
        "29.4.1" = {
          depInfo = {
            "@types/node" = {
              pin = "18.11.18";
              runtime = true;
            };
            jest-util = {
              descriptor = "^29.4.1";
              pin = "29.4.1";
              runtime = true;
            };
            merge-stream = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            supports-color = {
              descriptor = "^8.0.0";
              pin = "8.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-G8WPJJilCh5cY1orAIC+lBOEZT1tvmTSQnlUYvfBFQc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/jest-worker/-/jest-worker-29.4.1.tgz";
          };
          ident = "jest-worker";
          ltype = "file";
          treeInfo = {
            "node_modules/@types/node" = {
              key = "@types/node/18.11.18";
              link = true;
            };
            "node_modules/jest-util" = {
              key = "jest-util/29.4.1";
              link = true;
            };
            "node_modules/merge-stream" = {
              key = "merge-stream/2.0.0";
              link = true;
            };
            "node_modules/supports-color" = {
              key = "supports-color/8.1.1";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      js-tokens = {
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-Dc0GyrdV+HX5ZTMTdtFfjh30QurY6nxA8wCQMZsnd6w=";
            type = "tarball";
            url = "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz";
          };
          ident = "js-tokens";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      js-yaml = {
        "3.14.1" = {
          binInfo = { binPairs = { js-yaml = "bin/js-yaml.js"; }; };
          depInfo = {
            argparse = {
              descriptor = "^1.0.7";
              pin = "1.0.10";
              runtime = true;
            };
            esprima = {
              descriptor = "^4.0.0";
              pin = "4.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-77V7kBw4w4mGhwUA3ay8IvZMqBK8XpXCEjaCDhCyuHU=";
            type = "tarball";
            url = "https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.1.tgz";
          };
          ident = "js-yaml";
          ltype = "file";
          treeInfo = {
            "node_modules/argparse" = {
              key = "argparse/1.0.10";
              link = true;
            };
            "node_modules/esprima" = {
              key = "esprima/4.0.1";
              link = true;
            };
          };
          version = "3.14.1";
        };
      };
      jsesc = {
        "2.5.2" = {
          binInfo = { binPairs = { jsesc = "bin/jsesc"; }; };
          fetchInfo = {
            narHash = "sha256-VzeXB9PvqZY9dcodPxeMGHJ9YldUc7jTJQQ8RMZH17A=";
            type = "tarball";
            url = "https://registry.npmjs.org/jsesc/-/jsesc-2.5.2.tgz";
          };
          ident = "jsesc";
          ltype = "file";
          treeInfo = { };
          version = "2.5.2";
        };
      };
      json-parse-even-better-errors = {
        "2.3.1" = {
          fetchInfo = {
            narHash = "sha256-JLmbiGbR2cXNIiFjyKZj8WvbNwUEVpADUgztOocgA1s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz";
          };
          ident = "json-parse-even-better-errors";
          ltype = "file";
          treeInfo = { };
          version = "2.3.1";
        };
      };
      json5 = {
        "2.2.3" = {
          binInfo = { binPairs = { json5 = "lib/cli.js"; }; };
          fetchInfo = {
            narHash = "sha256-fd/IKAbZn9P6pZDVoCd0ltapUy5duUpErs4dZISeItI=";
            type = "tarball";
            url = "https://registry.npmjs.org/json5/-/json5-2.2.3.tgz";
          };
          ident = "json5";
          ltype = "file";
          treeInfo = { };
          version = "2.2.3";
        };
      };
      kleur = {
        "3.0.3" = {
          fetchInfo = {
            narHash = "sha256-331h8iP1Kf/G4bGdKQ1BteYEr9bGbLjpTi7bB0kG0ks=";
            type = "tarball";
            url = "https://registry.npmjs.org/kleur/-/kleur-3.0.3.tgz";
          };
          ident = "kleur";
          ltype = "file";
          treeInfo = { };
          version = "3.0.3";
        };
      };
      leven = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-Lqb1AQUSH/47Zodo4pnzTiJ7YVH/ZJ1KxQDyUOvr3Ok=";
            type = "tarball";
            url = "https://registry.npmjs.org/leven/-/leven-3.1.0.tgz";
          };
          ident = "leven";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      lines-and-columns = {
        "1.2.4" = {
          fetchInfo = {
            narHash = "sha256-WUoaqN7ad2gwBKftukjtNRrFw19fcS7dRRog0pp4OHE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/lines-and-columns/-/lines-and-columns-1.2.4.tgz";
          };
          ident = "lines-and-columns";
          ltype = "file";
          treeInfo = { };
          version = "1.2.4";
        };
      };
      locate-path = {
        "5.0.0" = {
          depInfo = {
            p-locate = {
              descriptor = "^4.1.0";
              pin = "4.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-gWogKcdUNqt/VW2g03Z2vjwEVQDwMbjTqaeDCyIcv1I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz";
          };
          ident = "locate-path";
          ltype = "file";
          treeInfo = {
            "node_modules/p-locate" = {
              key = "p-locate/4.1.0";
              link = true;
            };
          };
          version = "5.0.0";
        };
      };
      lru-cache = {
        "5.1.1" = {
          depInfo = {
            yallist = {
              descriptor = "^3.0.2";
              pin = "3.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-bHn+nBFPDrWPf+09HR7NWzfyCzHRm27iyvShXAmfLMk=";
            type = "tarball";
            url = "https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz";
          };
          ident = "lru-cache";
          ltype = "file";
          treeInfo = {
            "node_modules/yallist" = {
              key = "yallist/3.1.1";
              link = true;
            };
          };
          version = "5.1.1";
        };
        "6.0.0" = {
          depInfo = {
            yallist = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lBc6340YZYAh1Numj5iz418ChtGb3UUtRZLOYj/WJXg=";
            type = "tarball";
            url = "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz";
          };
          ident = "lru-cache";
          ltype = "file";
          treeInfo = {
            "node_modules/yallist" = {
              key = "yallist/4.0.0";
              link = true;
            };
          };
          version = "6.0.0";
        };
      };
      make-dir = {
        "3.1.0" = {
          depInfo = {
            semver = {
              descriptor = "^6.0.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-dUB70vIpdmwQzuUKc2swXy2Bk8jj8Ehyg2doWs/Dveg=";
            type = "tarball";
            url = "https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz";
          };
          ident = "make-dir";
          ltype = "file";
          treeInfo = {
            "node_modules/semver" = {
              key = "semver/6.3.0";
              link = true;
            };
          };
          version = "3.1.0";
        };
      };
      makeerror = {
        "1.0.12" = {
          depInfo = {
            tmpl = {
              descriptor = "1.0.5";
              pin = "1.0.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Y6/jU8bj28DLOj5Uf0QjLIP0dguPlxkh3GnrVL+1w40=";
            type = "tarball";
            url = "https://registry.npmjs.org/makeerror/-/makeerror-1.0.12.tgz";
          };
          ident = "makeerror";
          ltype = "file";
          treeInfo = {
            "node_modules/tmpl" = {
              key = "tmpl/1.0.5";
              link = true;
            };
          };
          version = "1.0.12";
        };
      };
      merge-stream = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-0ZC11XNq6TaUxEXOV9bwaS71Qd3wQoqZAkFRvtnab5I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/merge-stream/-/merge-stream-2.0.0.tgz";
          };
          ident = "merge-stream";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      micromatch = {
        "4.0.5" = {
          depInfo = {
            braces = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            picomatch = {
              descriptor = "^2.3.1";
              pin = "2.3.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5sy/ExTbi9X3zWFTVMx8cfbQCpl3Kyqc7RVqcpj11gg=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/micromatch/-/micromatch-4.0.5.tgz";
          };
          ident = "micromatch";
          ltype = "file";
          treeInfo = {
            "node_modules/braces" = {
              key = "braces/3.0.2";
              link = true;
            };
            "node_modules/picomatch" = {
              key = "picomatch/2.3.1";
              link = true;
            };
          };
          version = "4.0.5";
        };
      };
      mimic-fn = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-up0po5F914aiPm0fCqnagVNmpVJeMAroQXpYiWZAOn0=";
            type = "tarball";
            url = "https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz";
          };
          ident = "mimic-fn";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      minimatch = {
        "3.1.2" = {
          depInfo = {
            brace-expansion = {
              descriptor = "^1.1.7";
              pin = "1.1.11";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lngTO0Bk/Spf3t/zG5/j7C2STufjXWF5DlmKjvj1M8s=";
            type = "tarball";
            url = "https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz";
          };
          ident = "minimatch";
          ltype = "file";
          treeInfo = {
            "node_modules/brace-expansion" = {
              key = "brace-expansion/1.1.11";
              link = true;
            };
          };
          version = "3.1.2";
        };
      };
      ms = {
        "2.1.2" = {
          fetchInfo = {
            narHash = "sha256-Y87ut99BMamY3YJBX3Cj3DvOJWkqW+7MrPm7bLyuT50=";
            type = "tarball";
            url = "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz";
          };
          ident = "ms";
          ltype = "file";
          treeInfo = { };
          version = "2.1.2";
        };
      };
      natural-compare = {
        "1.4.0" = {
          fetchInfo = {
            narHash = "sha256-wx+m763bR0Auq7WpVJREb2xXTIHcZMYL9T/G+Y0FQlY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz";
          };
          ident = "natural-compare";
          ltype = "file";
          treeInfo = { };
          version = "1.4.0";
        };
      };
      node-int64 = {
        "0.4.0" = {
          fetchInfo = {
            narHash = "sha256-BOd48Uc57GvkSlqGJR5ZPMr5oGEdY6CKsrrLVTIjcvY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/node-int64/-/node-int64-0.4.0.tgz";
          };
          ident = "node-int64";
          ltype = "file";
          treeInfo = { };
          version = "0.4.0";
        };
      };
      node-releases = {
        "2.0.9" = {
          fetchInfo = {
            narHash = "sha256-reaKeghAFwGQDAXoLW0Duswk9ap7WV2PaSWekYFkPsw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/node-releases/-/node-releases-2.0.9.tgz";
          };
          ident = "node-releases";
          ltype = "file";
          treeInfo = { };
          version = "2.0.9";
        };
      };
      normalize-path = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-dEESYAs01W+lUXWyDzFkbIwz/dIe85OeDKy23RRoa6E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz";
          };
          ident = "normalize-path";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      npm-run-path = {
        "4.0.1" = {
          depInfo = {
            path-key = {
              descriptor = "^3.0.0";
              pin = "3.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ZefVxdnSyuTRRctCRlLr8Ga7HtLhuFKX4CPVtLLPQvU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/npm-run-path/-/npm-run-path-4.0.1.tgz";
          };
          ident = "npm-run-path";
          ltype = "file";
          treeInfo = {
            "node_modules/path-key" = {
              key = "path-key/3.1.1";
              link = true;
            };
          };
          version = "4.0.1";
        };
      };
      once = {
        "1.4.0" = {
          depInfo = {
            wrappy = {
              descriptor = "1";
              pin = "1.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-2NvvDZICNRZJPY258mO8rrRBg4fY7mlMjFEl2R+m348=";
            type = "tarball";
            url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
          };
          ident = "once";
          ltype = "file";
          treeInfo = {
            "node_modules/wrappy" = {
              key = "wrappy/1.0.2";
              link = true;
            };
          };
          version = "1.4.0";
        };
      };
      onetime = {
        "5.1.2" = {
          depInfo = {
            mimic-fn = {
              descriptor = "^2.1.0";
              pin = "2.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-IlWxpAaeV+41VqHMcJLBSFazIsiYMEs5PrBtQGQyqrg=";
            type = "tarball";
            url = "https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz";
          };
          ident = "onetime";
          ltype = "file";
          treeInfo = {
            "node_modules/mimic-fn" = {
              key = "mimic-fn/2.1.0";
              link = true;
            };
          };
          version = "5.1.2";
        };
      };
      p-limit = {
        "2.3.0" = {
          depInfo = {
            p-try = {
              descriptor = "^2.0.0";
              pin = "2.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-7PNmPQsmrW5wFWP6LW8btESW7zOsfly2tYn6R/oXdPA=";
            type = "tarball";
            url = "https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz";
          };
          ident = "p-limit";
          ltype = "file";
          treeInfo = {
            "node_modules/p-try" = {
              key = "p-try/2.2.0";
              link = true;
            };
          };
          version = "2.3.0";
        };
        "3.1.0" = {
          depInfo = {
            yocto-queue = {
              descriptor = "^0.1.0";
              pin = "0.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-AMCtIV7mGwSuZn7PDlsDCHQ4n/pm5S5WG4H1FJC/sR8=";
            type = "tarball";
            url = "https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz";
          };
          ident = "p-limit";
          ltype = "file";
          treeInfo = {
            "node_modules/yocto-queue" = {
              key = "yocto-queue/0.1.0";
              link = true;
            };
          };
          version = "3.1.0";
        };
      };
      p-locate = {
        "4.1.0" = {
          depInfo = {
            p-limit = {
              descriptor = "^2.2.0";
              pin = "2.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-t+nu4NXYPJAAj5F42+eFFJ7m7Ss1IoLVIR76yUVjPjQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz";
          };
          ident = "p-locate";
          ltype = "file";
          treeInfo = {
            "node_modules/p-limit" = {
              key = "p-limit/2.3.0";
              link = true;
            };
          };
          version = "4.1.0";
        };
      };
      p-try = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-qGxjcs9tIM3yrGOljhpcGxq08MuQAPaXo7Hape2dmyw=";
            type = "tarball";
            url = "https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz";
          };
          ident = "p-try";
          ltype = "file";
          treeInfo = { };
          version = "2.2.0";
        };
      };
      parse-json = {
        "5.2.0" = {
          depInfo = {
            "@babel/code-frame" = {
              descriptor = "^7.0.0";
              pin = "7.18.6";
              runtime = true;
            };
            error-ex = {
              descriptor = "^1.3.1";
              pin = "1.3.2";
              runtime = true;
            };
            json-parse-even-better-errors = {
              descriptor = "^2.3.0";
              pin = "2.3.1";
              runtime = true;
            };
            lines-and-columns = {
              descriptor = "^1.1.6";
              pin = "1.2.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hxVxyGV3iUu2t/nGE+bdgp9C38FU/lZU2iPbtazHLy4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/parse-json/-/parse-json-5.2.0.tgz";
          };
          ident = "parse-json";
          ltype = "file";
          treeInfo = {
            "node_modules/@babel/code-frame" = {
              key = "@babel/code-frame/7.18.6";
              link = true;
            };
            "node_modules/error-ex" = {
              key = "error-ex/1.3.2";
              link = true;
            };
            "node_modules/json-parse-even-better-errors" = {
              key = "json-parse-even-better-errors/2.3.1";
              link = true;
            };
            "node_modules/lines-and-columns" = {
              key = "lines-and-columns/1.2.4";
              link = true;
            };
          };
          version = "5.2.0";
        };
      };
      path-exists = {
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-QmsShSY8p68eX9bNeinv/8VO0/+P2c+Rv82mtPqtpjE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz";
          };
          ident = "path-exists";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      path-is-absolute = {
        "1.0.1" = {
          fetchInfo = {
            narHash = "sha256-+DjPlEsONpIJ3kBveAhTRCV2aRZt3KN8RNLsgoC+jXk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
          };
          ident = "path-is-absolute";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      path-key = {
        "3.1.1" = {
          fetchInfo = {
            narHash = "sha256-gj4CYT2AeZ5jyhV6m/eAq4pETAxmqd5kAcw/Iw0yxiI=";
            type = "tarball";
            url = "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz";
          };
          ident = "path-key";
          ltype = "file";
          treeInfo = { };
          version = "3.1.1";
        };
      };
      path-parse = {
        "1.0.7" = {
          fetchInfo = {
            narHash = "sha256-IO0Y8yjZA6xJ63eLG/nFzWTGjI5tREyNKttz4DXoKYo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz";
          };
          ident = "path-parse";
          ltype = "file";
          treeInfo = { };
          version = "1.0.7";
        };
      };
      picocolors = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-zo0dDKQASSCpixflPOwG61jzA9IqjZMBN8dwojRu+l8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/picocolors/-/picocolors-1.0.0.tgz";
          };
          ident = "picocolors";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      picomatch = {
        "2.3.1" = {
          fetchInfo = {
            narHash = "sha256-8N7a/2Aei6DYLZ9EvhCEbdxTSTb5pmy0OqHYuN/IJac=";
            type = "tarball";
            url = "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz";
          };
          ident = "picomatch";
          ltype = "file";
          treeInfo = { };
          version = "2.3.1";
        };
      };
      pirates = {
        "4.0.5" = {
          fetchInfo = {
            narHash = "sha256-QTm1afqJ/JgEA0JQ3jGzuuGZ1S35R0aeDljqL63+4Tg=";
            type = "tarball";
            url = "https://registry.npmjs.org/pirates/-/pirates-4.0.5.tgz";
          };
          ident = "pirates";
          ltype = "file";
          treeInfo = { };
          version = "4.0.5";
        };
      };
      pkg-dir = {
        "4.2.0" = {
          depInfo = {
            find-up = {
              descriptor = "^4.0.0";
              pin = "4.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-T2WIK6kImvw8h8UkVKVSXIBs7KNbQ3d8XkU9FV8CCXA=";
            type = "tarball";
            url = "https://registry.npmjs.org/pkg-dir/-/pkg-dir-4.2.0.tgz";
          };
          ident = "pkg-dir";
          ltype = "file";
          treeInfo = {
            "node_modules/find-up" = {
              key = "find-up/4.1.0";
              link = true;
            };
          };
          version = "4.2.0";
        };
      };
      pretty-format = {
        "29.4.1" = {
          depInfo = {
            "@jest/schemas" = {
              descriptor = "^29.4.0";
              pin = "29.4.0";
              runtime = true;
            };
            ansi-styles = {
              descriptor = "^5.0.0";
              pin = "5.2.0";
              runtime = true;
            };
            react-is = {
              descriptor = "^18.0.0";
              pin = "18.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ao+UIfkDeOOrEwyG3Jw1oWIgy4EpdthjfQcRqEzAvCo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/pretty-format/-/pretty-format-29.4.1.tgz";
          };
          ident = "pretty-format";
          ltype = "file";
          treeInfo = {
            "node_modules/@jest/schemas" = {
              key = "@jest/schemas/29.4.0";
              link = true;
            };
            "node_modules/ansi-styles" = {
              key = "ansi-styles/5.2.0";
              link = true;
            };
            "node_modules/react-is" = {
              key = "react-is/18.2.0";
              link = true;
            };
          };
          version = "29.4.1";
        };
      };
      prompts = {
        "2.4.2" = {
          depInfo = {
            kleur = {
              descriptor = "^3.0.3";
              pin = "3.0.3";
              runtime = true;
            };
            sisteransi = {
              descriptor = "^1.0.5";
              pin = "1.0.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-E/G2OK8TyexZ9g/C3SYchJOBGLzfFsEhaUxgZrLCf7c=";
            type = "tarball";
            url = "https://registry.npmjs.org/prompts/-/prompts-2.4.2.tgz";
          };
          ident = "prompts";
          ltype = "file";
          treeInfo = {
            "node_modules/kleur" = {
              key = "kleur/3.0.3";
              link = true;
            };
            "node_modules/sisteransi" = {
              key = "sisteransi/1.0.5";
              link = true;
            };
          };
          version = "2.4.2";
        };
      };
      react-is = {
        "18.2.0" = {
          fetchInfo = {
            narHash = "sha256-eSOGsY/IVNB/U36bUYaUctK4n5DEM9hmzm1keaypG2c=";
            type = "tarball";
            url = "https://registry.npmjs.org/react-is/-/react-is-18.2.0.tgz";
          };
          ident = "react-is";
          ltype = "file";
          treeInfo = { };
          version = "18.2.0";
        };
      };
      require-directory = {
        "2.1.1" = {
          fetchInfo = {
            narHash = "sha256-nAP28KKDIP7JZZfCTBI0EHdJcuAa6hsYOVfXNdVn7xY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
          };
          ident = "require-directory";
          ltype = "file";
          treeInfo = { };
          version = "2.1.1";
        };
      };
      resolve = {
        "1.22.1" = {
          binInfo = { binPairs = { resolve = "bin/resolve"; }; };
          depInfo = {
            is-core-module = {
              descriptor = "^2.9.0";
              pin = "2.11.0";
              runtime = true;
            };
            path-parse = {
              descriptor = "^1.0.7";
              pin = "1.0.7";
              runtime = true;
            };
            supports-preserve-symlinks-flag = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-7Z/261GRkso9A8/SZR0DTykpeA02Y270stCuAj7lmGE=";
            type = "tarball";
            url = "https://registry.npmjs.org/resolve/-/resolve-1.22.1.tgz";
          };
          ident = "resolve";
          ltype = "file";
          treeInfo = {
            "node_modules/is-core-module" = {
              key = "is-core-module/2.11.0";
              link = true;
            };
            "node_modules/path-parse" = {
              key = "path-parse/1.0.7";
              link = true;
            };
            "node_modules/supports-preserve-symlinks-flag" = {
              key = "supports-preserve-symlinks-flag/1.0.0";
              link = true;
            };
          };
          version = "1.22.1";
        };
      };
      resolve-cwd = {
        "3.0.0" = {
          depInfo = {
            resolve-from = {
              descriptor = "^5.0.0";
              pin = "5.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-GRzvU5THR6GGQDxRGxEro/n8fCm34gy5wBwE8/3zvng=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/resolve-cwd/-/resolve-cwd-3.0.0.tgz";
          };
          ident = "resolve-cwd";
          ltype = "file";
          treeInfo = {
            "node_modules/resolve-from" = {
              key = "resolve-from/5.0.0";
              link = true;
            };
          };
          version = "3.0.0";
        };
      };
      resolve-from = {
        "5.0.0" = {
          fetchInfo = {
            narHash = "sha256-bab+/K+W0XuYFqBwFe2syabeEX2GjtK2SdfQmN6NiVI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/resolve-from/-/resolve-from-5.0.0.tgz";
          };
          ident = "resolve-from";
          ltype = "file";
          treeInfo = { };
          version = "5.0.0";
        };
      };
      "resolve.exports" = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-gT/Aje9vtPd29bWC5xyxZCDB3gngVEHtxy/fDXBr7Yo=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/resolve.exports/-/resolve.exports-2.0.0.tgz";
          };
          ident = "resolve.exports";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      semver = {
        "6.3.0" = {
          binInfo = { binPairs = { semver = "bin/semver.js"; }; };
          fetchInfo = {
            narHash = "sha256-43shFLKGOi7rl5FbrvggFEm+CYJJASgy3GvSXCJf00I=";
            type = "tarball";
            url = "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz";
          };
          ident = "semver";
          ltype = "file";
          treeInfo = { };
          version = "6.3.0";
        };
        "7.3.8" = {
          binInfo = { binPairs = { semver = "bin/semver.js"; }; };
          depInfo = {
            lru-cache = {
              descriptor = "^6.0.0";
              pin = "6.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vqtjrIFs0Yw18hcdfShdL7BwyzqXdZ+K60Rp3oLNo/A=";
            type = "tarball";
            url = "https://registry.npmjs.org/semver/-/semver-7.3.8.tgz";
          };
          ident = "semver";
          ltype = "file";
          treeInfo = {
            "node_modules/lru-cache" = {
              key = "lru-cache/6.0.0";
              link = true;
            };
          };
          version = "7.3.8";
        };
      };
      shebang-command = {
        "2.0.0" = {
          depInfo = {
            shebang-regex = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hQ8ZmBxEUTBeAoFsrXtJSMXkxZPNJhOEvKatEpvbpaE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz";
          };
          ident = "shebang-command";
          ltype = "file";
          treeInfo = {
            "node_modules/shebang-regex" = {
              key = "shebang-regex/3.0.0";
              link = true;
            };
          };
          version = "2.0.0";
        };
      };
      shebang-regex = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-20gU7k4uzL2AgOQ9iw2L1KH8sC6GaQCZtjyUBY5ayQ0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz";
          };
          ident = "shebang-regex";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      signal-exit = {
        "3.0.7" = {
          fetchInfo = {
            narHash = "sha256-2mSrADWJKHoX/YwLWk/Mdb4mjpL/6QYU8Evqtm24fdE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz";
          };
          ident = "signal-exit";
          ltype = "file";
          treeInfo = { };
          version = "3.0.7";
        };
      };
      sisteransi = {
        "1.0.5" = {
          fetchInfo = {
            narHash = "sha256-jrhjMBkYGoTeR1ym+MkEd90+qydMYnNKN0p9vmHUqp8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/sisteransi/-/sisteransi-1.0.5.tgz";
          };
          ident = "sisteransi";
          ltype = "file";
          treeInfo = { };
          version = "1.0.5";
        };
      };
      slash = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-tZzgTJwTD+eFikcawSO8plEa7YR2/RULHUs98d+5EC4=";
            type = "tarball";
            url = "https://registry.npmjs.org/slash/-/slash-3.0.0.tgz";
          };
          ident = "slash";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      source-map = {
        "0.6.1" = {
          fetchInfo = {
            narHash = "sha256-kOXyuKVrD3Fzez65GwPnNC615Ju17D00wsIgKcCWTJk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
          };
          ident = "source-map";
          ltype = "file";
          treeInfo = { };
          version = "0.6.1";
        };
      };
      source-map-support = {
        "0.5.13" = {
          depInfo = {
            buffer-from = {
              descriptor = "^1.0.0";
              pin = "1.1.2";
              runtime = true;
            };
            source-map = {
              descriptor = "^0.6.0";
              pin = "0.6.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-DMiRX7QMl1ewmSXe/wX33WYPxD/XhWkZntVAdR013Cc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.13.tgz";
          };
          ident = "source-map-support";
          ltype = "file";
          treeInfo = {
            "node_modules/buffer-from" = {
              key = "buffer-from/1.1.2";
              link = true;
            };
            "node_modules/source-map" = {
              key = "source-map/0.6.1";
              link = true;
            };
          };
          version = "0.5.13";
        };
      };
      sprintf-js = {
        "1.0.3" = {
          fetchInfo = {
            narHash = "sha256-uUKz9y/hyOs58YEaXDOeVK7nhGxpTdNWE7IFSsdAtAc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
          };
          ident = "sprintf-js";
          ltype = "file";
          treeInfo = { };
          version = "1.0.3";
        };
      };
      stack-utils = {
        "2.0.6" = {
          depInfo = {
            escape-string-regexp = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yJBI15szqsjkCcJ2+mMFL2VXIxQhujWZ4kncVGPoP5Y=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/stack-utils/-/stack-utils-2.0.6.tgz";
          };
          ident = "stack-utils";
          ltype = "file";
          treeInfo = {
            "node_modules/escape-string-regexp" = {
              key = "escape-string-regexp/2.0.0";
              link = true;
            };
          };
          version = "2.0.6";
        };
      };
      string-length = {
        "4.0.2" = {
          depInfo = {
            char-regex = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-08t0L2ATp0hGeUbT3ENnU/4bA2DdbBi6lU4uUsUIxWA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/string-length/-/string-length-4.0.2.tgz";
          };
          ident = "string-length";
          ltype = "file";
          treeInfo = {
            "node_modules/char-regex" = {
              key = "char-regex/1.0.2";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
          };
          version = "4.0.2";
        };
      };
      string-width = {
        "4.2.3" = {
          depInfo = {
            emoji-regex = {
              descriptor = "^8.0.0";
              pin = "8.0.0";
              runtime = true;
            };
            is-fullwidth-code-point = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.1";
              pin = "6.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-UkdpzgZbqh+d2lMxcCqdnxter5D6KYGgaYMta2Dhqn4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
          };
          ident = "string-width";
          ltype = "file";
          treeInfo = {
            "node_modules/emoji-regex" = {
              key = "emoji-regex/8.0.0";
              link = true;
            };
            "node_modules/is-fullwidth-code-point" = {
              key = "is-fullwidth-code-point/3.0.0";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
          };
          version = "4.2.3";
        };
      };
      strip-ansi = {
        "6.0.1" = {
          depInfo = {
            ansi-regex = {
              descriptor = "^5.0.1";
              pin = "5.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-mMRzEL6fWJXYmQ2ZhRAhnYMcjdNCfvGF3Y7NekoLgXc=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
          };
          ident = "strip-ansi";
          ltype = "file";
          treeInfo = {
            "node_modules/ansi-regex" = {
              key = "ansi-regex/5.0.1";
              link = true;
            };
          };
          version = "6.0.1";
        };
      };
      strip-bom = {
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-1ep2vpPJQUeyDPma6RIYvQ22vmGsXsGAGxoRnySl+2s=";
            type = "tarball";
            url = "https://registry.npmjs.org/strip-bom/-/strip-bom-4.0.0.tgz";
          };
          ident = "strip-bom";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      strip-final-newline = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-t0BevRoiiF/ujVHWQykmRSeUyIkGkVcXidbu5eFromE=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/strip-final-newline/-/strip-final-newline-2.0.0.tgz";
          };
          ident = "strip-final-newline";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      strip-json-comments = {
        "3.1.1" = {
          fetchInfo = {
            narHash = "sha256-kG9XiGtBCKfDljwOWaSI7pZbk5I7uywJFm4jNdBERYw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz";
          };
          ident = "strip-json-comments";
          ltype = "file";
          treeInfo = { };
          version = "3.1.1";
        };
      };
      supports-color = {
        "5.5.0" = {
          depInfo = {
            has-flag = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-CFEl8ukJUaXQ4RzTSFYfqd09tqgYfgJuU/Kem/DkKe4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz";
          };
          ident = "supports-color";
          ltype = "file";
          treeInfo = {
            "node_modules/has-flag" = {
              key = "has-flag/3.0.0";
              link = true;
            };
          };
          version = "5.5.0";
        };
        "7.2.0" = {
          depInfo = {
            has-flag = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ALfHRAgnkUrOOyywhxLVllKKtKkFQZ3IvetXiR72flk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz";
          };
          ident = "supports-color";
          ltype = "file";
          treeInfo = {
            "node_modules/has-flag" = {
              key = "has-flag/4.0.0";
              link = true;
            };
          };
          version = "7.2.0";
        };
        "8.1.1" = {
          depInfo = {
            has-flag = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-uzKM/4dI5vQi51VxaCyT2y3S33POKUM/FxldHV9HD1E=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/supports-color/-/supports-color-8.1.1.tgz";
          };
          ident = "supports-color";
          ltype = "file";
          treeInfo = {
            "node_modules/has-flag" = {
              key = "has-flag/4.0.0";
              link = true;
            };
          };
          version = "8.1.1";
        };
      };
      supports-preserve-symlinks-flag = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-Gwf/IHn+m17+KsKxcOrhCxAjvH8uxQx8Bud+qeCNwKg=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz";
          };
          ident = "supports-preserve-symlinks-flag";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      test-exclude = {
        "6.0.0" = {
          depInfo = {
            "@istanbuljs/schema" = {
              descriptor = "^0.1.2";
              pin = "0.1.3";
              runtime = true;
            };
            glob = {
              descriptor = "^7.1.4";
              pin = "7.2.3";
              runtime = true;
            };
            minimatch = {
              descriptor = "^3.0.4";
              pin = "3.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-mAzD4R1N5GQhajG4/vQ7vBHOw61M4xwoDp6Rp2ckqGA=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/test-exclude/-/test-exclude-6.0.0.tgz";
          };
          ident = "test-exclude";
          ltype = "file";
          treeInfo = {
            "node_modules/@istanbuljs/schema" = {
              key = "@istanbuljs/schema/0.1.3";
              link = true;
            };
            "node_modules/glob" = {
              key = "glob/7.2.3";
              link = true;
            };
            "node_modules/minimatch" = {
              key = "minimatch/3.1.2";
              link = true;
            };
          };
          version = "6.0.0";
        };
      };
      tmpl = {
        "1.0.5" = {
          fetchInfo = {
            narHash = "sha256-mBez8zwGvoMGokwAOGw7VqRz+c/QbR7O8gqtgZXl1iQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/tmpl/-/tmpl-1.0.5.tgz";
          };
          ident = "tmpl";
          ltype = "file";
          treeInfo = { };
          version = "1.0.5";
        };
      };
      to-fast-properties = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-REHa011PYD77WKQpm3pDqs8+640POdK6iqwfEhljtzk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/to-fast-properties/-/to-fast-properties-2.0.0.tgz";
          };
          ident = "to-fast-properties";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      to-regex-range = {
        "5.0.1" = {
          depInfo = {
            is-number = {
              descriptor = "^7.0.0";
              pin = "7.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-+vtC2A5vM5ixOFrv1pRteDxoFLswFln/YcK09AmMbQM=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz";
          };
          ident = "to-regex-range";
          ltype = "file";
          treeInfo = {
            "node_modules/is-number" = {
              key = "is-number/7.0.0";
              link = true;
            };
          };
          version = "5.0.1";
        };
      };
      type-detect = {
        "4.0.8" = {
          fetchInfo = {
            narHash = "sha256-U2nnsxpPYQeB9BbI0xhu/Tjutkw6xD0tBYni7lvOxps=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/type-detect/-/type-detect-4.0.8.tgz";
          };
          ident = "type-detect";
          ltype = "file";
          treeInfo = { };
          version = "4.0.8";
        };
      };
      type-fest = {
        "0.21.3" = {
          fetchInfo = {
            narHash = "sha256-JQqZB3b0eYNZSfQWlyJoLCVwX+CgaUFWRrbc2oZTStg=";
            type = "tarball";
            url = "https://registry.npmjs.org/type-fest/-/type-fest-0.21.3.tgz";
          };
          ident = "type-fest";
          ltype = "file";
          treeInfo = { };
          version = "0.21.3";
        };
      };
      update-browserslist-db = {
        "1.0.10" = {
          binInfo = { binPairs = { browserslist-lint = "cli.js"; }; };
          depInfo = {
            escalade = {
              descriptor = "^3.1.1";
              pin = "3.1.1";
              runtime = true;
            };
            picocolors = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-IYA2zm9AqMhRwaBbGCSbhiSC6jJ5fJdDyuyVAD0gfJs=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.0.10.tgz";
          };
          ident = "update-browserslist-db";
          ltype = "file";
          peerInfo = { browserslist = { descriptor = ">= 4.21.0"; }; };
          treeInfo = {
            "node_modules/escalade" = {
              key = "escalade/3.1.1";
              link = true;
            };
            "node_modules/picocolors" = {
              key = "picocolors/1.0.0";
              link = true;
            };
          };
          version = "1.0.10";
        };
      };
      v8-to-istanbul = {
        "9.0.1" = {
          depInfo = {
            "@jridgewell/trace-mapping" = {
              descriptor = "^0.3.12";
              pin = "0.3.17";
              runtime = true;
            };
            "@types/istanbul-lib-coverage" = {
              descriptor = "^2.0.1";
              pin = "2.0.4";
              runtime = true;
            };
            convert-source-map = {
              descriptor = "^1.6.0";
              pin = "1.9.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-7KEKlZfsL2VKrB1Vdr6jqjDyoT0Cb8HhFr3UDpU9Cbs=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/v8-to-istanbul/-/v8-to-istanbul-9.0.1.tgz";
          };
          ident = "v8-to-istanbul";
          ltype = "file";
          treeInfo = {
            "node_modules/@jridgewell/trace-mapping" = {
              key = "@jridgewell/trace-mapping/0.3.17";
              link = true;
            };
            "node_modules/@types/istanbul-lib-coverage" = {
              key = "@types/istanbul-lib-coverage/2.0.4";
              link = true;
            };
            "node_modules/convert-source-map" = {
              key = "convert-source-map/1.9.0";
              link = true;
            };
          };
          version = "9.0.1";
        };
      };
      walker = {
        "1.0.8" = {
          depInfo = {
            makeerror = {
              descriptor = "1.0.12";
              pin = "1.0.12";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-niQWR/fGhu9isBuMZaYUfNdyTtdn/robDxwmVWz3IWw=";
            type = "tarball";
            url = "https://registry.npmjs.org/walker/-/walker-1.0.8.tgz";
          };
          ident = "walker";
          ltype = "file";
          treeInfo = {
            "node_modules/makeerror" = {
              key = "makeerror/1.0.12";
              link = true;
            };
          };
          version = "1.0.8";
        };
      };
      which = {
        "2.0.2" = {
          binInfo = { binPairs = { node-which = "bin/node-which"; }; };
          depInfo = {
            isexe = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-u114pFUXCCiUamLVVZma0Au+didZhD6RCoGTbrh2OhU=";
            type = "tarball";
            url = "https://registry.npmjs.org/which/-/which-2.0.2.tgz";
          };
          ident = "which";
          ltype = "file";
          treeInfo = {
            "node_modules/isexe" = {
              key = "isexe/2.0.0";
              link = true;
            };
          };
          version = "2.0.2";
        };
      };
      wrap-ansi = {
        "7.0.0" = {
          depInfo = {
            ansi-styles = {
              descriptor = "^4.0.0";
              pin = "4.3.0";
              runtime = true;
            };
            string-width = {
              descriptor = "^4.1.0";
              pin = "4.2.3";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-4STOnmSiJLwhYjl7yafCOFqX+PtBFdAbGTiZEHV+KZM=";
            type = "tarball";
            url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
          };
          ident = "wrap-ansi";
          ltype = "file";
          treeInfo = {
            "node_modules/ansi-styles" = {
              key = "ansi-styles/4.3.0";
              link = true;
            };
            "node_modules/string-width" = {
              key = "string-width/4.2.3";
              link = true;
            };
            "node_modules/strip-ansi" = {
              key = "strip-ansi/6.0.1";
              link = true;
            };
          };
          version = "7.0.0";
        };
      };
      wrappy = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-8EvxGsoK2efCTAOoAHPbfbCoPOJvkmOLPM4XA1rEcVU=";
            type = "tarball";
            url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
          };
          ident = "wrappy";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      write-file-atomic = {
        "5.0.0" = {
          depInfo = {
            imurmurhash = {
              descriptor = "^0.1.4";
              pin = "0.1.4";
              runtime = true;
            };
            signal-exit = {
              descriptor = "^3.0.7";
              pin = "3.0.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LgNDFmsSfCvxMqUIWB2oI4ZzEgc+4gi4iOZzbN9PzS4=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-5.0.0.tgz";
          };
          ident = "write-file-atomic";
          ltype = "file";
          treeInfo = {
            "node_modules/imurmurhash" = {
              key = "imurmurhash/0.1.4";
              link = true;
            };
            "node_modules/signal-exit" = {
              key = "signal-exit/3.0.7";
              link = true;
            };
          };
          version = "5.0.0";
        };
      };
      y18n = {
        "5.0.8" = {
          fetchInfo = {
            narHash = "sha256-iFm2pYwriQ4ikd/5Pw604ag5yU2D3/51Sl4UQ+0nleE=";
            type = "tarball";
            url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
          };
          ident = "y18n";
          ltype = "file";
          treeInfo = { };
          version = "5.0.8";
        };
      };
      yallist = {
        "3.1.1" = {
          fetchInfo = {
            narHash = "sha256-7nmo2FncYulLdSGcz4BC/y0lbFEfMHmyOSCCUTbbBXc=";
            type = "tarball";
            url = "https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz";
          };
          ident = "yallist";
          ltype = "file";
          treeInfo = { };
          version = "3.1.1";
        };
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-JQNNkqswg1ZH4o8PQS2R8WsZWJtv/5R3vRgc4d1vDR0=";
            type = "tarball";
            url = "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz";
          };
          ident = "yallist";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      yargs = {
        "17.6.2" = {
          depInfo = {
            cliui = {
              descriptor = "^8.0.1";
              pin = "8.0.1";
              runtime = true;
            };
            escalade = {
              descriptor = "^3.1.1";
              pin = "3.1.1";
              runtime = true;
            };
            get-caller-file = {
              descriptor = "^2.0.5";
              pin = "2.0.5";
              runtime = true;
            };
            require-directory = {
              descriptor = "^2.1.1";
              pin = "2.1.1";
              runtime = true;
            };
            string-width = {
              descriptor = "^4.2.3";
              pin = "4.2.3";
              runtime = true;
            };
            y18n = {
              descriptor = "^5.0.5";
              pin = "5.0.8";
              runtime = true;
            };
            yargs-parser = {
              descriptor = "^21.1.1";
              pin = "21.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wuYt4QeJRlnywemLNKriBvZkPhxUGeAPsYv3n20t95I=";
            type = "tarball";
            url = "https://registry.npmjs.org/yargs/-/yargs-17.6.2.tgz";
          };
          ident = "yargs";
          ltype = "file";
          treeInfo = {
            "node_modules/cliui" = {
              key = "cliui/8.0.1";
              link = true;
            };
            "node_modules/escalade" = {
              key = "escalade/3.1.1";
              link = true;
            };
            "node_modules/get-caller-file" = {
              key = "get-caller-file/2.0.5";
              link = true;
            };
            "node_modules/require-directory" = {
              key = "require-directory/2.1.1";
              link = true;
            };
            "node_modules/string-width" = {
              key = "string-width/4.2.3";
              link = true;
            };
            "node_modules/y18n" = {
              key = "y18n/5.0.8";
              link = true;
            };
            "node_modules/yargs-parser" = {
              key = "yargs-parser/21.1.1";
              link = true;
            };
          };
          version = "17.6.2";
        };
      };
      yargs-parser = {
        "21.1.1" = {
          fetchInfo = {
            narHash = "sha256-mbMbMuJ6Cit1Xns/Fi77RJytrnfC7+AzvAU+x5cdR6I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz";
          };
          ident = "yargs-parser";
          ltype = "file";
          treeInfo = { };
          version = "21.1.1";
        };
      };
      yocto-queue = {
        "0.1.0" = {
          fetchInfo = {
            narHash = "sha256-DpbkBR6X0fZcRRdqavXuN5z2r2EfhSO5pbc2PuZwDFY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz";
          };
          ident = "yocto-queue";
          ltype = "file";
          treeInfo = { };
          version = "0.1.0";
        };
      };
    };
  };
}

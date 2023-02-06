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
            url = "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.2.0.tgz";
          };
          ident = "@ampproject/remapping";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.18.6.tgz";
          };
          ident = "@babel/code-frame";
          ltype = "file";
          version = "7.18.6";
        };
      };
      "@babel/compat-data" = {
        "7.20.14" = {
          fetchInfo = {
            narHash = "sha256-pM7Mnzdt75zYb37WowTDyfWos1FT/7uGgEFYwmdSJ1Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.20.14.tgz";
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
            url = "https://registry.npmjs.org/@babel/generator/-/generator-7.20.14.tgz";
          };
          ident = "@babel/generator";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.20.7.tgz";
          };
          ident = "@babel/helper-compilation-targets";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0";
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
            url = "https://registry.npmjs.org/@babel/helper-environment-visitor/-/helper-environment-visitor-7.18.9.tgz";
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
            url = "https://registry.npmjs.org/@babel/helper-function-name/-/helper-function-name-7.19.0.tgz";
          };
          ident = "@babel/helper-function-name";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/helper-hoist-variables/-/helper-hoist-variables-7.18.6.tgz";
          };
          ident = "@babel/helper-hoist-variables";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.18.6.tgz";
          };
          ident = "@babel/helper-module-imports";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.20.11.tgz";
          };
          ident = "@babel/helper-module-transforms";
          ltype = "file";
          version = "7.20.11";
        };
      };
      "@babel/helper-plugin-utils" = {
        "7.20.2" = {
          fetchInfo = {
            narHash = "sha256-7z/gPAcPH95idoeUHVE8AbImHYhNfu5a0SB9gdrosVs=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.20.2.tgz";
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
            url = "https://registry.npmjs.org/@babel/helper-simple-access/-/helper-simple-access-7.20.2.tgz";
          };
          ident = "@babel/helper-simple-access";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.18.6.tgz";
          };
          ident = "@babel/helper-split-export-declaration";
          ltype = "file";
          version = "7.18.6";
        };
      };
      "@babel/helper-string-parser" = {
        "7.19.4" = {
          fetchInfo = {
            narHash = "sha256-kshJlXC/PxL8I4AUvNn+9gQMBscRbgRdSToKh+okk6k=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.19.4.tgz";
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
            url = "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.19.1.tgz";
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
            url = "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.18.6.tgz";
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
            url = "https://registry.npmjs.org/@babel/helpers/-/helpers-7.20.13.tgz";
          };
          ident = "@babel/helpers";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/highlight/-/highlight-7.18.6.tgz";
          };
          ident = "@babel/highlight";
          ltype = "file";
          version = "7.18.6";
        };
      };
      "@babel/parser" = {
        "7.20.15" = {
          binInfo = {
            binPairs = {
              parser = "bin/babel-parser.js";
            };
          };
          fetchInfo = {
            narHash = "sha256-lkwhz18Ino5243Fob9tH8SdjekZh7Y2yJRUVJXtSjnA=";
            type = "tarball";
            url = "https://registry.npmjs.org/@babel/parser/-/parser-7.20.15.tgz";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz";
          };
          ident = "@babel/plugin-syntax-async-generators";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-bigint";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz";
          };
          ident = "@babel/plugin-syntax-class-properties";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-import-meta";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-json-strings";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
            };
          };
          version = "7.8.3";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-logical-assignment-operators";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-nullish-coalescing-operator";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz";
          };
          ident = "@babel/plugin-syntax-numeric-separator";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-object-rest-spread";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-optional-catch-binding";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
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
            url = "https://registry.npmjs.org/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz";
          };
          ident = "@babel/plugin-syntax-optional-chaining";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0-0";
            };
          };
          version = "7.8.3";
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
            url = "https://registry.npmjs.org/@babel/template/-/template-7.20.7.tgz";
          };
          ident = "@babel/template";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@babel/traverse/-/traverse-7.20.13.tgz";
          };
          ident = "@babel/traverse";
          ltype = "file";
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
          version = "7.20.7";
        };
      };
      "@cnakazawa/watch" = {
        "1.0.4" = {
          binInfo = {
            binPairs = {
              watch = "cli.js";
            };
          };
          depInfo = {
            exec-sh = {
              descriptor = "^0.3.2";
              pin = "0.3.6";
              runtime = true;
            };
            minimist = {
              descriptor = "^1.2.0";
              pin = "1.2.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-i47mz/ekIXTLJH/PC2ojLuWyBcsf+nuY5FZ1nvPXp4c=";
            type = "tarball";
            url = "https://registry.npmjs.org/@cnakazawa/watch/-/watch-1.0.4.tgz";
          };
          ident = "@cnakazawa/watch";
          ltype = "file";
          version = "1.0.4";
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
            url = "https://registry.npmjs.org/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz";
          };
          ident = "@istanbuljs/load-nyc-config";
          ltype = "file";
          version = "1.1.0";
        };
      };
      "@istanbuljs/schema" = {
        "0.1.3" = {
          fetchInfo = {
            narHash = "sha256-Xqwdgx5lnaVLsBs7+38TSnPd2EzlG1XIwdv0UvRB8No=";
            type = "tarball";
            url = "https://registry.npmjs.org/@istanbuljs/schema/-/schema-0.1.3.tgz";
          };
          ident = "@istanbuljs/schema";
          ltype = "file";
          treeInfo = { };
          version = "0.1.3";
        };
      };
      "@jest/console" = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-PKNfqCVwHY4rXgkNS+1VM1Q8uI49k+FePZAmVufIE34=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/console/-/console-25.5.0.tgz";
          };
          ident = "@jest/console";
          ltype = "file";
          version = "25.5.0";
        };
      };
      "@jest/environment" = {
        "25.5.0" = {
          depInfo = {
            "@jest/fake-timers" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Seb+ihv1+w4QiCVEVN9WOiRLrkl5laUBKDEw0ucvkm0=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/environment/-/environment-25.5.0.tgz";
          };
          ident = "@jest/environment";
          ltype = "file";
          version = "25.5.0";
        };
      };
      "@jest/fake-timers" = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            lolex = {
              descriptor = "^5.0.0";
              pin = "5.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kOB/QEkAvcZXBF9lSpCNMl4qthj5TZbRFGV2/f8At1g=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/fake-timers/-/fake-timers-25.5.0.tgz";
          };
          ident = "@jest/fake-timers";
          ltype = "file";
          version = "25.5.0";
        };
      };
      "@jest/globals" = {
        "25.5.2" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            expect = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-1qztO8xiEsNVBwdo+PuSsd/6zDuJ7JfFA/P6ykEzXQ8=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/globals/-/globals-25.5.2.tgz";
          };
          ident = "@jest/globals";
          ltype = "file";
          version = "25.5.2";
        };
      };
      "@jest/source-map" = {
        "25.5.0" = {
          depInfo = {
            callsites = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            source-map = {
              descriptor = "^0.6.0";
              pin = "0.6.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-0bgmTU0SURwsJxCnQF2sPHE1t3cdgUQvOu2QntM9JMc=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/source-map/-/source-map-25.5.0.tgz";
          };
          ident = "@jest/source-map";
          ltype = "file";
          version = "25.5.0";
        };
      };
      "@jest/transform" = {
        "25.5.1" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.1.0";
              pin = "7.20.12";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            babel-plugin-istanbul = {
              descriptor = "^6.0.0";
              pin = "6.1.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            convert-source-map = {
              descriptor = "^1.4.0";
              pin = "1.9.0";
              runtime = true;
            };
            fast-json-stable-stringify = {
              descriptor = "^2.0.0";
              pin = "2.1.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.2";
              pin = "4.0.5";
              runtime = true;
            };
            pirates = {
              descriptor = "^4.0.1";
              pin = "4.0.5";
              runtime = true;
            };
            realpath-native = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            source-map = {
              descriptor = "^0.6.1";
              pin = "0.6.1";
              runtime = true;
            };
            write-file-atomic = {
              descriptor = "^3.0.0";
              pin = "3.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wyZB2Ic+0BBHB2VB2pgTOH04onXDGr7yW8iN15KWxks=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/transform/-/transform-25.5.1.tgz";
          };
          ident = "@jest/transform";
          ltype = "file";
          version = "25.5.1";
        };
      };
      "@jest/types" = {
        "25.5.0" = {
          depInfo = {
            "@types/istanbul-lib-coverage" = {
              descriptor = "^2.0.0";
              pin = "2.0.4";
              runtime = true;
            };
            "@types/istanbul-reports" = {
              descriptor = "^1.1.1";
              pin = "1.1.2";
              runtime = true;
            };
            "@types/yargs" = {
              descriptor = "^15.0.0";
              pin = "15.0.15";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-sLM8wCsSLRxSvhwz43tRV7pdVYZxi2z81LylHEfdsHQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jest/types/-/types-25.5.0.tgz";
          };
          ident = "@jest/types";
          ltype = "file";
          version = "25.5.0";
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
            url = "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.1.1.tgz";
          };
          ident = "@jridgewell/gen-mapping";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.2.tgz";
          };
          ident = "@jridgewell/gen-mapping";
          ltype = "file";
          version = "0.3.2";
        };
      };
      "@jridgewell/resolve-uri" = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-hED3kswj5waotVJCd7ougmOL65MmYhoI4YFae3fN2c0=";
            type = "tarball";
            url = "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.0.tgz";
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
            url = "https://registry.npmjs.org/@jridgewell/set-array/-/set-array-1.1.2.tgz";
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
            url = "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.14.tgz";
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
            url = "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.17.tgz";
          };
          ident = "@jridgewell/trace-mapping";
          ltype = "file";
          version = "0.3.17";
        };
      };
      "@sinonjs/commons" = {
        "1.8.6" = {
          depInfo = {
            type-detect = {
              descriptor = "4.0.8";
              pin = "4.0.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-cSJJCrwsq4uEoqmFr+0QdgleirCu5Xfcm5ueoR1uOFQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/@sinonjs/commons/-/commons-1.8.6.tgz";
          };
          ident = "@sinonjs/commons";
          ltype = "file";
          version = "1.8.6";
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
            url = "https://registry.npmjs.org/@types/babel__core/-/babel__core-7.20.0.tgz";
          };
          ident = "@types/babel__core";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@types/babel__generator/-/babel__generator-7.6.4.tgz";
          };
          ident = "@types/babel__generator";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@types/babel__template/-/babel__template-7.4.1.tgz";
          };
          ident = "@types/babel__template";
          ltype = "file";
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
            url = "https://registry.npmjs.org/@types/babel__traverse/-/babel__traverse-7.18.3.tgz";
          };
          ident = "@types/babel__traverse";
          ltype = "file";
          version = "7.18.3";
        };
      };
      "@types/graceful-fs" = {
        "4.1.6" = {
          depInfo = {
            "@types/node" = {
              pin = "18.11.19";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-NeoPlSfrhf23AFZLoGdgj/fGymYh8Gq2+qhnyCi+v6E=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/graceful-fs/-/graceful-fs-4.1.6.tgz";
          };
          ident = "@types/graceful-fs";
          ltype = "file";
          version = "4.1.6";
        };
      };
      "@types/istanbul-lib-coverage" = {
        "2.0.4" = {
          fetchInfo = {
            narHash = "sha256-DtWhc4JGMhO7O0szwUUUAgO3Qgh8hrmgEygs8bL5Z1Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.4.tgz";
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
            url = "https://registry.npmjs.org/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz";
          };
          ident = "@types/istanbul-lib-report";
          ltype = "file";
          version = "3.0.0";
        };
      };
      "@types/istanbul-reports" = {
        "1.1.2" = {
          depInfo = {
            "@types/istanbul-lib-coverage" = {
              pin = "2.0.4";
              runtime = true;
            };
            "@types/istanbul-lib-report" = {
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-EyuCGCzjrX/ikSzhpjwhKaLarvIVe8ct/ffT/mwBG6Y=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/istanbul-reports/-/istanbul-reports-1.1.2.tgz";
          };
          ident = "@types/istanbul-reports";
          ltype = "file";
          version = "1.1.2";
        };
      };
      "@types/node" = {
        "18.11.19" = {
          fetchInfo = {
            narHash = "sha256-Wkr26jhVcN4DJwYuM0tuG+uJRkE4MD18HEFqg+LGn0w=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/node/-/node-18.11.19.tgz";
          };
          ident = "@types/node";
          ltype = "file";
          treeInfo = { };
          version = "18.11.19";
        };
      };
      "@types/normalize-package-data" = {
        "2.4.1" = {
          fetchInfo = {
            narHash = "sha256-QdvNN+P4HU10sPWObUTEsKlIV7rZELwUsmsItFmeJiI=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/normalize-package-data/-/normalize-package-data-2.4.1.tgz";
          };
          ident = "@types/normalize-package-data";
          ltype = "file";
          treeInfo = { };
          version = "2.4.1";
        };
      };
      "@types/prettier" = {
        "1.19.1" = {
          fetchInfo = {
            narHash = "sha256-dhT0AZbdKzeVYSG2v0VnaTMhLsUSMsYHz4oWqcMKqpo=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/prettier/-/prettier-1.19.1.tgz";
          };
          ident = "@types/prettier";
          ltype = "file";
          treeInfo = { };
          version = "1.19.1";
        };
      };
      "@types/stack-utils" = {
        "1.0.1" = {
          fetchInfo = {
            narHash = "sha256-39occ3/QD5ylm40kZnKH0chh0xULEZEpr8vcWwrGYeQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/stack-utils/-/stack-utils-1.0.1.tgz";
          };
          ident = "@types/stack-utils";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      "@types/yargs" = {
        "15.0.15" = {
          depInfo = {
            "@types/yargs-parser" = {
              pin = "21.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-DTgw58nzEKhWMF7j79DVP1KnghE9z1ZImZvMrKjFyu0=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/yargs/-/yargs-15.0.15.tgz";
          };
          ident = "@types/yargs";
          ltype = "file";
          version = "15.0.15";
        };
      };
      "@types/yargs-parser" = {
        "21.0.0" = {
          fetchInfo = {
            narHash = "sha256-5Eay5eyC90EFhvTlSqGxOTHiYHfZAKJVd58oLhEvv04=";
            type = "tarball";
            url = "https://registry.npmjs.org/@types/yargs-parser/-/yargs-parser-21.0.0.tgz";
          };
          ident = "@types/yargs-parser";
          ltype = "file";
          treeInfo = { };
          version = "21.0.0";
        };
      };
      abab = {
        "2.0.6" = {
          fetchInfo = {
            narHash = "sha256-Mk1JUzGHX62inUREA7tJ9/s0sLB8SSD8XRob/wGtq54=";
            type = "tarball";
            url = "https://registry.npmjs.org/abab/-/abab-2.0.6.tgz";
          };
          ident = "abab";
          ltype = "file";
          treeInfo = { };
          version = "2.0.6";
        };
      };
      acorn = {
        "6.4.2" = {
          binInfo = {
            binPairs = {
              acorn = "bin/acorn";
            };
          };
          fetchInfo = {
            narHash = "sha256-b7fo8fBpSiRQUjfIZDsSQfaoW+SFWHmfgRhh5iE8h2Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/acorn/-/acorn-6.4.2.tgz";
          };
          ident = "acorn";
          ltype = "file";
          treeInfo = { };
          version = "6.4.2";
        };
        "7.4.1" = {
          binInfo = {
            binPairs = {
              acorn = "bin/acorn";
            };
          };
          fetchInfo = {
            narHash = "sha256-4h5Ap7o59zvBR6qPsEcelOyWLfz2A7+ulPyr3Uy9xI8=";
            type = "tarball";
            url = "https://registry.npmjs.org/acorn/-/acorn-7.4.1.tgz";
          };
          ident = "acorn";
          ltype = "file";
          treeInfo = { };
          version = "7.4.1";
        };
      };
      acorn-globals = {
        "4.3.4" = {
          depInfo = {
            acorn = {
              descriptor = "^6.0.1";
              pin = "6.4.2";
              runtime = true;
            };
            acorn-walk = {
              descriptor = "^6.0.1";
              pin = "6.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-nRfxju+jOfod3JSJFHZZ/PZYs9aPnkuyoOvjtpDjZSc=";
            type = "tarball";
            url = "https://registry.npmjs.org/acorn-globals/-/acorn-globals-4.3.4.tgz";
          };
          ident = "acorn-globals";
          ltype = "file";
          version = "4.3.4";
        };
      };
      acorn-walk = {
        "6.2.0" = {
          fetchInfo = {
            narHash = "sha256-H2hOZYHyNxhNEkPH31Bb6oGkUDNeZ0gGLTDhGjq00Z8=";
            type = "tarball";
            url = "https://registry.npmjs.org/acorn-walk/-/acorn-walk-6.2.0.tgz";
          };
          ident = "acorn-walk";
          ltype = "file";
          treeInfo = { };
          version = "6.2.0";
        };
      };
      ajv = {
        "6.12.6" = {
          depInfo = {
            fast-deep-equal = {
              descriptor = "^3.1.1";
              pin = "3.1.3";
              runtime = true;
            };
            fast-json-stable-stringify = {
              descriptor = "^2.0.0";
              pin = "2.1.0";
              runtime = true;
            };
            json-schema-traverse = {
              descriptor = "^0.4.1";
              pin = "0.4.1";
              runtime = true;
            };
            uri-js = {
              descriptor = "^4.2.2";
              pin = "4.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-J73Yar5PwP9cRfKNYKEbHIVHuvfSEfLuSmkdbF8WeYI=";
            type = "tarball";
            url = "https://registry.npmjs.org/ajv/-/ajv-6.12.6.tgz";
          };
          ident = "ajv";
          ltype = "file";
          version = "6.12.6";
        };
      };
      ansi-regex = {
        "5.0.1" = {
          fetchInfo = {
            narHash = "sha256-8FjueDq8OfpA4/cbcsda1vVcNseZPDYf+YqM56zD03Y=";
            type = "tarball";
            url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
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
            url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz";
          };
          ident = "ansi-styles";
          ltype = "file";
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
            url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
          };
          ident = "ansi-styles";
          ltype = "file";
          version = "4.3.0";
        };
      };
      anymatch = {
        "2.0.0" = {
          depInfo = {
            micromatch = {
              descriptor = "^3.1.4";
              pin = "3.1.10";
              runtime = true;
            };
            normalize-path = {
              descriptor = "^2.1.1";
              pin = "2.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-5Iz+cgE7MvPdfn40MIG1J0eE2aEgSIlTlPTkBFhc2AY=";
            type = "tarball";
            url = "https://registry.npmjs.org/anymatch/-/anymatch-2.0.0.tgz";
          };
          ident = "anymatch";
          ltype = "file";
          version = "2.0.0";
        };
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
          version = "1.0.10";
        };
      };
      arr-diff = {
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-0ilttmhuLtHZfTVqyXbf9poid6PozAVQVkZxExnbtFs=";
            type = "tarball";
            url = "https://registry.npmjs.org/arr-diff/-/arr-diff-4.0.0.tgz";
          };
          ident = "arr-diff";
          ltype = "file";
          treeInfo = { };
          version = "4.0.0";
        };
      };
      arr-flatten = {
        "1.1.0" = {
          fetchInfo = {
            narHash = "sha256-Mb130gwiwAh7iR2fmBuPqsJ5mVULVAN+WLhGfVcLQWw=";
            type = "tarball";
            url = "https://registry.npmjs.org/arr-flatten/-/arr-flatten-1.1.0.tgz";
          };
          ident = "arr-flatten";
          ltype = "file";
          treeInfo = { };
          version = "1.1.0";
        };
      };
      arr-union = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-mybBR6j11whgJ7BkvPcpiyCsyV4yN3qmMuVVQ9aOkHE=";
            type = "tarball";
            url = "https://registry.npmjs.org/arr-union/-/arr-union-3.1.0.tgz";
          };
          ident = "arr-union";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      array-equal = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-niYa7pUiiVzV+9Uqo8E+J5asJ54zuPn6wXgo2+eur90=";
            type = "tarball";
            url = "https://registry.npmjs.org/array-equal/-/array-equal-1.0.0.tgz";
          };
          ident = "array-equal";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      array-unique = {
        "0.3.2" = {
          fetchInfo = {
            narHash = "sha256-XbP3m6ZsJd7mLq6ohz4+RXGAhb/QKggQyjoAibnvwxI=";
            type = "tarball";
            url = "https://registry.npmjs.org/array-unique/-/array-unique-0.3.2.tgz";
          };
          ident = "array-unique";
          ltype = "file";
          treeInfo = { };
          version = "0.3.2";
        };
      };
      asn1 = {
        "0.2.6" = {
          depInfo = {
            safer-buffer = {
              descriptor = "~2.1.0";
              pin = "2.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8O0T1vq4nGwocitSzc98ORFs5yzOevccj38BybdCiXY=";
            type = "tarball";
            url = "https://registry.npmjs.org/asn1/-/asn1-0.2.6.tgz";
          };
          ident = "asn1";
          ltype = "file";
          version = "0.2.6";
        };
      };
      assert-plus = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-/QjGpVP8wg2XWpVer/N5GYhLdIlcj7u3XxNwyVB89RM=";
            type = "tarball";
            url = "https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz";
          };
          ident = "assert-plus";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      assign-symbols = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-0HPW1l/lvJDzFILSnCHmqHN0rr0znGgX0nD4HXdy7KE=";
            type = "tarball";
            url = "https://registry.npmjs.org/assign-symbols/-/assign-symbols-1.0.0.tgz";
          };
          ident = "assign-symbols";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      asynckit = {
        "0.4.0" = {
          fetchInfo = {
            narHash = "sha256-ySX1KUru2VwlCX4xMQynwHNOtbX8yyqtirHD2ILEuyc=";
            type = "tarball";
            url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
          };
          ident = "asynckit";
          ltype = "file";
          treeInfo = { };
          version = "0.4.0";
        };
      };
      atob = {
        "2.1.2" = {
          binInfo = {
            binPairs = {
              atob = "bin/atob.js";
            };
          };
          fetchInfo = {
            narHash = "sha256-nVGOe0SmzjrEFXM5EumbT+Z2yV7h9DylSVOLE18wA2g=";
            type = "tarball";
            url = "https://registry.npmjs.org/atob/-/atob-2.1.2.tgz";
          };
          ident = "atob";
          ltype = "file";
          treeInfo = { };
          version = "2.1.2";
        };
      };
      aws-sign2 = {
        "0.7.0" = {
          fetchInfo = {
            narHash = "sha256-XTKObsATaYUtnBGqzqdzw+Md9o8y3dNjj9AjZtqGCdE=";
            type = "tarball";
            url = "https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz";
          };
          ident = "aws-sign2";
          ltype = "file";
          treeInfo = { };
          version = "0.7.0";
        };
      };
      aws4 = {
        "1.12.0" = {
          fetchInfo = {
            narHash = "sha256-we00ruzuzJ2D6cRspJA0kCALcXnVsG4mY8JUjaHT/k4=";
            type = "tarball";
            url = "https://registry.npmjs.org/aws4/-/aws4-1.12.0.tgz";
          };
          ident = "aws4";
          ltype = "file";
          treeInfo = { };
          version = "1.12.0";
        };
      };
      babel-jest = {
        "25.5.1" = {
          depInfo = {
            "@jest/transform" = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@types/babel__core" = {
              descriptor = "^7.1.7";
              pin = "7.20.0";
              runtime = true;
            };
            babel-plugin-istanbul = {
              descriptor = "^6.0.0";
              pin = "6.1.1";
              runtime = true;
            };
            babel-preset-jest = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
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
            narHash = "sha256-eIE2VAQKsN8v2gAAk4Mbxq7dt6gj7XIsB+ts1nUjAD8=";
            type = "tarball";
            url = "https://registry.npmjs.org/babel-jest/-/babel-jest-25.5.1.tgz";
          };
          ident = "babel-jest";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0";
            };
          };
          version = "25.5.1";
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
            url = "https://registry.npmjs.org/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz";
          };
          ident = "babel-plugin-istanbul";
          ltype = "file";
          version = "6.1.1";
        };
      };
      babel-plugin-jest-hoist = {
        "25.5.0" = {
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
            "@types/babel__traverse" = {
              descriptor = "^7.0.6";
              pin = "7.18.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-NOFoVzGphADldSl5pMjm2Aaj6QO34PH4WDxK4bEwois=";
            type = "tarball";
            url = "https://registry.npmjs.org/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-25.5.0.tgz";
          };
          ident = "babel-plugin-jest-hoist";
          ltype = "file";
          version = "25.5.0";
        };
      };
      babel-preset-current-node-syntax = {
        "0.1.4" = {
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
          };
          fetchInfo = {
            narHash = "sha256-kVA07ettCEuxf1cSbB+A1j6Uln8P+S4aqiGu3ku+rvA=";
            type = "tarball";
            url = "https://registry.npmjs.org/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-0.1.4.tgz";
          };
          ident = "babel-preset-current-node-syntax";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0";
            };
          };
          version = "0.1.4";
        };
      };
      babel-preset-jest = {
        "25.5.0" = {
          depInfo = {
            babel-plugin-jest-hoist = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            babel-preset-current-node-syntax = {
              descriptor = "^0.1.2";
              pin = "0.1.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lxbgw2K2HOBR1rqNoB81o7j6YwwaeGBP2UCrfm4mUzY=";
            type = "tarball";
            url = "https://registry.npmjs.org/babel-preset-jest/-/babel-preset-jest-25.5.0.tgz";
          };
          ident = "babel-preset-jest";
          ltype = "file";
          peerInfo = {
            "@babel/core" = {
              descriptor = "^7.0.0";
            };
          };
          version = "25.5.0";
        };
      };
      balanced-match = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-YH1+osaAiJvWUUR4VCe/Hh4eHhXS0gN3Lnr+Xd3cCzg=";
            type = "tarball";
            url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
          };
          ident = "balanced-match";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      base = {
        "0.11.2" = {
          depInfo = {
            cache-base = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
            class-utils = {
              descriptor = "^0.3.5";
              pin = "0.3.6";
              runtime = true;
            };
            component-emitter = {
              descriptor = "^1.2.1";
              pin = "1.3.0";
              runtime = true;
            };
            define-property = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
            mixin-deep = {
              descriptor = "^1.2.0";
              pin = "1.3.2";
              runtime = true;
            };
            pascalcase = {
              descriptor = "^0.1.1";
              pin = "0.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-TuRTiQGQ+zMEwazWvwOHZVk4ulxnFwSQ53HDXNeA6Vk=";
            type = "tarball";
            url = "https://registry.npmjs.org/base/-/base-0.11.2.tgz";
          };
          ident = "base";
          ltype = "file";
          version = "0.11.2";
        };
      };
      bcrypt-pbkdf = {
        "1.0.2" = {
          depInfo = {
            tweetnacl = {
              descriptor = "^0.14.3";
              pin = "0.14.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-2iL91DfbvnCacv5Tpp32aUmAxCxvx30lZdnCX17mySw=";
            type = "tarball";
            url = "https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz";
          };
          ident = "bcrypt-pbkdf";
          ltype = "file";
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
            url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
          };
          ident = "brace-expansion";
          ltype = "file";
          version = "1.1.11";
        };
      };
      braces = {
        "2.3.2" = {
          depInfo = {
            arr-flatten = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
            array-unique = {
              descriptor = "^0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            fill-range = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
            repeat-element = {
              descriptor = "^1.1.2";
              pin = "1.1.4";
              runtime = true;
            };
            snapdragon = {
              descriptor = "^0.8.1";
              pin = "0.8.2";
              runtime = true;
            };
            snapdragon-node = {
              descriptor = "^2.0.1";
              pin = "2.1.1";
              runtime = true;
            };
            split-string = {
              descriptor = "^3.0.2";
              pin = "3.1.0";
              runtime = true;
            };
            to-regex = {
              descriptor = "^3.0.1";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-t/YqZaoaOClNvpMPsVWI90uo4CLdwOTrq3Z2t2YSvfU=";
            type = "tarball";
            url = "https://registry.npmjs.org/braces/-/braces-2.3.2.tgz";
          };
          ident = "braces";
          ltype = "file";
          version = "2.3.2";
        };
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
          version = "3.0.2";
        };
      };
      browser-process-hrtime = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-X/I9oMUeRu5lSBtb1+i1l5BzeQDIqIQGHlBg3NH/muM=";
            type = "tarball";
            url = "https://registry.npmjs.org/browser-process-hrtime/-/browser-process-hrtime-1.0.0.tgz";
          };
          ident = "browser-process-hrtime";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      browser-resolve = {
        "1.11.3" = {
          depInfo = {
            resolve = {
              descriptor = "1.1.7";
              pin = "1.1.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-7CmK3std1aIhKlAIPRsoVrZiw+/6iOF7lvPsU+WnKVU=";
            type = "tarball";
            url = "https://registry.npmjs.org/browser-resolve/-/browser-resolve-1.11.3.tgz";
          };
          ident = "browser-resolve";
          ltype = "file";
          version = "1.11.3";
        };
      };
      browserslist = {
        "4.21.5" = {
          binInfo = {
            binPairs = {
              browserslist = "cli.js";
            };
          };
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
              pin = "2.0.10";
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
            url = "https://registry.npmjs.org/browserslist/-/browserslist-4.21.5.tgz";
          };
          ident = "browserslist";
          ltype = "file";
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
          version = "2.1.1";
        };
      };
      buffer-from = {
        "1.1.2" = {
          fetchInfo = {
            narHash = "sha256-8dpJi5qu37MruotYJ6QBjTJbgWOO4eDu3gOoJ6Mi9H0=";
            type = "tarball";
            url = "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz";
          };
          ident = "buffer-from";
          ltype = "file";
          treeInfo = { };
          version = "1.1.2";
        };
      };
      cache-base = {
        "1.0.1" = {
          depInfo = {
            collection-visit = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            component-emitter = {
              descriptor = "^1.2.1";
              pin = "1.3.0";
              runtime = true;
            };
            get-value = {
              descriptor = "^2.0.6";
              pin = "2.0.6";
              runtime = true;
            };
            has-value = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
            set-value = {
              descriptor = "^2.0.0";
              pin = "2.0.1";
              runtime = true;
            };
            to-object-path = {
              descriptor = "^0.3.0";
              pin = "0.3.0";
              runtime = true;
            };
            union-value = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
            unset-value = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wbD32k4yg3w1HJfR1/NRWIlsk//MTJMO61AhapHxTPo=";
            type = "tarball";
            url = "https://registry.npmjs.org/cache-base/-/cache-base-1.0.1.tgz";
          };
          ident = "cache-base";
          ltype = "file";
          version = "1.0.1";
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
      };
      caniuse-lite = {
        "1.0.30001450" = {
          fetchInfo = {
            narHash = "sha256-pMoC10heRp+lTAsejFUjfACgi99nbUPuqdAl7nByXHk=";
            type = "tarball";
            url = "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001450.tgz";
          };
          ident = "caniuse-lite";
          ltype = "file";
          treeInfo = { };
          version = "1.0.30001450";
        };
      };
      capture-exit = {
        "2.0.0" = {
          depInfo = {
            rsvp = {
              descriptor = "^4.8.4";
              pin = "4.8.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-F/Ztgg5qy336NHTZK/QrMmUR1SVSeZG5upnXcSRkt+k=";
            type = "tarball";
            url = "https://registry.npmjs.org/capture-exit/-/capture-exit-2.0.0.tgz";
          };
          ident = "capture-exit";
          ltype = "file";
          version = "2.0.0";
        };
      };
      caseless = {
        "0.12.0" = {
          fetchInfo = {
            narHash = "sha256-PCMJPKAV5jgZK0X8JrkGO1eGAmPo6xvI+n0bH0mwC7o=";
            type = "tarball";
            url = "https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz";
          };
          ident = "caseless";
          ltype = "file";
          treeInfo = { };
          version = "0.12.0";
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
          version = "2.4.2";
        };
        "3.0.0" = {
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
            narHash = "sha256-GXKxt/fGq6j28M6p9kRZvXhEkCWWL5wqu2yPNdDDhHs=";
            type = "tarball";
            url = "https://registry.npmjs.org/chalk/-/chalk-3.0.0.tgz";
          };
          ident = "chalk";
          ltype = "file";
          version = "3.0.0";
        };
      };
      ci-info = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-lpvdoyNS43LFlCOXQQUC+1njCZR/UACFaFJWaDObcMs=";
            type = "tarball";
            url = "https://registry.npmjs.org/ci-info/-/ci-info-2.0.0.tgz";
          };
          ident = "ci-info";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      class-utils = {
        "0.3.6" = {
          depInfo = {
            arr-union = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            define-property = {
              descriptor = "^0.2.5";
              pin = "0.2.5";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
            static-extend = {
              descriptor = "^0.1.1";
              pin = "0.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-qsg7KNbM4tu2al9SoFttUj06lAQ6pTJlhEz4mVXMoUI=";
            type = "tarball";
            url = "https://registry.npmjs.org/class-utils/-/class-utils-0.3.6.tgz";
          };
          ident = "class-utils";
          ltype = "file";
          version = "0.3.6";
        };
      };
      cliui = {
        "6.0.0" = {
          depInfo = {
            string-width = {
              descriptor = "^4.2.0";
              pin = "4.2.3";
              runtime = true;
            };
            strip-ansi = {
              descriptor = "^6.0.0";
              pin = "6.0.1";
              runtime = true;
            };
            wrap-ansi = {
              descriptor = "^6.2.0";
              pin = "6.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lhm+47pKG+t2gz4CLBX6fUKUyydrlMk8rBHZVdU90co=";
            type = "tarball";
            url = "https://registry.npmjs.org/cliui/-/cliui-6.0.0.tgz";
          };
          ident = "cliui";
          ltype = "file";
          version = "6.0.0";
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
            url = "https://registry.npmjs.org/collect-v8-coverage/-/collect-v8-coverage-1.0.1.tgz";
          };
          ident = "collect-v8-coverage";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      collection-visit = {
        "1.0.0" = {
          depInfo = {
            map-visit = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            object-visit = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lts9ghF+G1mrxID1EGdsf9Co8JX3o6//fwyE2liy5Qc=";
            type = "tarball";
            url = "https://registry.npmjs.org/collection-visit/-/collection-visit-1.0.0.tgz";
          };
          ident = "collection-visit";
          ltype = "file";
          version = "1.0.0";
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
            url = "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz";
          };
          ident = "color-convert";
          ltype = "file";
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
            url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
          };
          ident = "color-convert";
          ltype = "file";
          version = "2.0.1";
        };
      };
      color-name = {
        "1.1.3" = {
          fetchInfo = {
            narHash = "sha256-Z7+qlowBfxZNeitMCENEfKBRnaxqLWi4+ms5SIKafc0=";
            type = "tarball";
            url = "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz";
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
            url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
          };
          ident = "color-name";
          ltype = "file";
          treeInfo = { };
          version = "1.1.4";
        };
      };
      combined-stream = {
        "1.0.8" = {
          depInfo = {
            delayed-stream = {
              descriptor = "~1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-+RCvzsa/ScK8HQNe6L6WRdxOuiJuqU1cRvV7qUfEbks=";
            type = "tarball";
            url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
          };
          ident = "combined-stream";
          ltype = "file";
          version = "1.0.8";
        };
      };
      component-emitter = {
        "1.3.0" = {
          fetchInfo = {
            narHash = "sha256-VFcIKCpwoTFbguNob0u3QpmvA8LrJFv4ck3bBCwgyOc=";
            type = "tarball";
            url = "https://registry.npmjs.org/component-emitter/-/component-emitter-1.3.0.tgz";
          };
          ident = "component-emitter";
          ltype = "file";
          treeInfo = { };
          version = "1.3.0";
        };
      };
      concat-map = {
        "0.0.1" = {
          fetchInfo = {
            narHash = "sha256-ZY5/rMtzNK56p81EGaPcoIRr+J9j7yWh4szGxIOFYFA=";
            type = "tarball";
            url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
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
            url = "https://registry.npmjs.org/convert-source-map/-/convert-source-map-1.9.0.tgz";
          };
          ident = "convert-source-map";
          ltype = "file";
          treeInfo = { };
          version = "1.9.0";
        };
      };
      copy-descriptor = {
        "0.1.1" = {
          fetchInfo = {
            narHash = "sha256-6mK9rEOEXcvH58PAYUWI7gMMWgKhoy517rAXQGLZbY0=";
            type = "tarball";
            url = "https://registry.npmjs.org/copy-descriptor/-/copy-descriptor-0.1.1.tgz";
          };
          ident = "copy-descriptor";
          ltype = "file";
          treeInfo = { };
          version = "0.1.1";
        };
      };
      core-util-is = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-Pxso4wcOkMB0sFixkb1eh2lhShu6umQzRlenu9DcW4U=";
            type = "tarball";
            url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
          };
          ident = "core-util-is";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      cross-spawn = {
        "6.0.5" = {
          depInfo = {
            nice-try = {
              descriptor = "^1.0.4";
              pin = "1.0.5";
              runtime = true;
            };
            path-key = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            semver = {
              descriptor = "^5.5.0";
              pin = "5.7.1";
              runtime = true;
            };
            shebang-command = {
              descriptor = "^1.2.0";
              pin = "1.2.0";
              runtime = true;
            };
            which = {
              descriptor = "^1.2.9";
              pin = "1.3.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ZTaJhCC7piYdoBcKukUDJkQL5qIhWDmALSzgdn7EOhw=";
            type = "tarball";
            url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-6.0.5.tgz";
          };
          ident = "cross-spawn";
          ltype = "file";
          version = "6.0.5";
        };
      };
      cssom = {
        "0.3.8" = {
          fetchInfo = {
            narHash = "sha256-hWPHUp148mDHBzn49JK0ZodAwSXWO4e79fl3tcexzus=";
            type = "tarball";
            url = "https://registry.npmjs.org/cssom/-/cssom-0.3.8.tgz";
          };
          ident = "cssom";
          ltype = "file";
          treeInfo = { };
          version = "0.3.8";
        };
        "0.4.4" = {
          fetchInfo = {
            narHash = "sha256-lLpEmGKmtPo/kjKPILqYl0VEWiDHlsXlgnIjEAoV/Wo=";
            type = "tarball";
            url = "https://registry.npmjs.org/cssom/-/cssom-0.4.4.tgz";
          };
          ident = "cssom";
          ltype = "file";
          treeInfo = { };
          version = "0.4.4";
        };
      };
      cssstyle = {
        "2.3.0" = {
          depInfo = {
            cssom = {
              descriptor = "~0.3.6";
              pin = "0.3.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-CnWC2AaInFNY6iQiWdDf+A7x1S7BLpcBJnguiYvdE+M=";
            type = "tarball";
            url = "https://registry.npmjs.org/cssstyle/-/cssstyle-2.3.0.tgz";
          };
          ident = "cssstyle";
          ltype = "file";
          version = "2.3.0";
        };
      };
      dashdash = {
        "1.14.1" = {
          depInfo = {
            assert-plus = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kR/UG43nguRG4uqv3YbhysWG8Ms+Tg/yPnceaRLPPVY=";
            type = "tarball";
            url = "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz";
          };
          ident = "dashdash";
          ltype = "file";
          version = "1.14.1";
        };
      };
      data-urls = {
        "1.1.0" = {
          depInfo = {
            abab = {
              descriptor = "^2.0.0";
              pin = "2.0.6";
              runtime = true;
            };
            whatwg-mimetype = {
              descriptor = "^2.2.0";
              pin = "2.3.0";
              runtime = true;
            };
            whatwg-url = {
              descriptor = "^7.0.0";
              pin = "7.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-lTiTLCXbGOYDwrgTAwoq4jVlJTLOcmWQ6WBL+Iyw4ck=";
            type = "tarball";
            url = "https://registry.npmjs.org/data-urls/-/data-urls-1.1.0.tgz";
          };
          ident = "data-urls";
          ltype = "file";
          version = "1.1.0";
        };
      };
      debug = {
        "2.6.9" = {
          depInfo = {
            ms = {
              descriptor = "2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yjLKPyF9xMbY7K0K3TMRla3MIYOy/bDzb8nnwkHqa1Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz";
          };
          ident = "debug";
          ltype = "file";
          version = "2.6.9";
        };
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
          version = "4.3.4";
        };
      };
      decamelize = {
        "1.2.0" = {
          fetchInfo = {
            narHash = "sha256-G8OX5wV0xknHqDgEaZaTWrtgh6GZ7kMs/ZjFdPgOB5k=";
            type = "tarball";
            url = "https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz";
          };
          ident = "decamelize";
          ltype = "file";
          treeInfo = { };
          version = "1.2.0";
        };
      };
      decode-uri-component = {
        "0.2.2" = {
          fetchInfo = {
            narHash = "sha256-Od3uZG7J9Of3YixBn+MPr3LSkyg/KkMG60j/b9ENxKY=";
            type = "tarball";
            url = "https://registry.npmjs.org/decode-uri-component/-/decode-uri-component-0.2.2.tgz";
          };
          ident = "decode-uri-component";
          ltype = "file";
          treeInfo = { };
          version = "0.2.2";
        };
      };
      deep-is = {
        "0.1.4" = {
          fetchInfo = {
            narHash = "sha256-lCUSf2gkAHrLYjZ2TnOMaZM+uviLCB/UwkWf/dAZ5BE=";
            type = "tarball";
            url = "https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz";
          };
          ident = "deep-is";
          ltype = "file";
          treeInfo = { };
          version = "0.1.4";
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
      define-property = {
        "0.2.5" = {
          depInfo = {
            is-descriptor = {
              descriptor = "^0.1.0";
              pin = "0.1.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-JKQmvrotGzN34kAMUn9DNwMPIoYz/nYfG0gG8hc1bGk=";
            type = "tarball";
            url = "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz";
          };
          ident = "define-property";
          ltype = "file";
          version = "0.2.5";
        };
        "1.0.0" = {
          depInfo = {
            is-descriptor = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-EP0qyyw0bScGhvPtCBeE/vo/m/TraoD1sc9XRyKnogo=";
            type = "tarball";
            url = "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz";
          };
          ident = "define-property";
          ltype = "file";
          version = "1.0.0";
        };
        "2.0.2" = {
          depInfo = {
            is-descriptor = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-C6AZSBzDfNXToXE8/l5zdIp9UWt+BpfcjPPjySdKARo=";
            type = "tarball";
            url = "https://registry.npmjs.org/define-property/-/define-property-2.0.2.tgz";
          };
          ident = "define-property";
          ltype = "file";
          version = "2.0.2";
        };
      };
      delayed-stream = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-kUE7OC4/g4RzhwzxU7Cj6hP07jok78tJwAsYWxWIQOc=";
            type = "tarball";
            url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
          };
          ident = "delayed-stream";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      detect-newline = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-jKiYmQrz4YjKevdQlDPu2iPBzjoNtNMcYGiqhKhmrW8=";
            type = "tarball";
            url = "https://registry.npmjs.org/detect-newline/-/detect-newline-3.1.0.tgz";
          };
          ident = "detect-newline";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
        };
      };
      diff-sequences = {
        "25.2.6" = {
          fetchInfo = {
            narHash = "sha256-YnKnIOeT1sJqYNj/UgT/ilsCDBrvQd2XGf5khObzmSQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/diff-sequences/-/diff-sequences-25.2.6.tgz";
          };
          ident = "diff-sequences";
          ltype = "file";
          treeInfo = { };
          version = "25.2.6";
        };
      };
      domexception = {
        "1.0.1" = {
          depInfo = {
            webidl-conversions = {
              descriptor = "^4.0.2";
              pin = "4.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-TZMwFJfG0zi6Y/6xZY4PMnmSFMIhRYuzirxohwVlN+M=";
            type = "tarball";
            url = "https://registry.npmjs.org/domexception/-/domexception-1.0.1.tgz";
          };
          ident = "domexception";
          ltype = "file";
          version = "1.0.1";
        };
      };
      ecc-jsbn = {
        "0.1.2" = {
          depInfo = {
            jsbn = {
              descriptor = "~0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
            safer-buffer = {
              descriptor = "^2.1.0";
              pin = "2.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-tERK3P68I7pcZUCvls+Yuf5swwWYbkYLJhq1wetMMQY=";
            type = "tarball";
            url = "https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz";
          };
          ident = "ecc-jsbn";
          ltype = "file";
          version = "0.1.2";
        };
      };
      electron-to-chromium = {
        "1.4.286" = {
          fetchInfo = {
            narHash = "sha256-0Qr9+GqYRyYkCjDiFK8ojC7jtlm3v8QfW/wZHYjWVbY=";
            type = "tarball";
            url = "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.4.286.tgz";
          };
          ident = "electron-to-chromium";
          ltype = "file";
          treeInfo = { };
          version = "1.4.286";
        };
      };
      emoji-regex = {
        "8.0.0" = {
          fetchInfo = {
            narHash = "sha256-WRW3MHslwJkKGL+xt09TThHNLeRiKIcUGIk1j+ewTpc=";
            type = "tarball";
            url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
          };
          ident = "emoji-regex";
          ltype = "file";
          treeInfo = { };
          version = "8.0.0";
        };
      };
      end-of-stream = {
        "1.4.4" = {
          depInfo = {
            once = {
              descriptor = "^1.4.0";
              pin = "1.4.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-DoZb+q1+jRXeFeejb2j6KVLM/pFXGVWa+ZR3+3MDSbo=";
            type = "tarball";
            url = "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz";
          };
          ident = "end-of-stream";
          ltype = "file";
          version = "1.4.4";
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
            url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
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
            url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz";
          };
          ident = "escape-string-regexp";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      escodegen = {
        "1.14.3" = {
          binInfo = {
            binPairs = {
              escodegen = "bin/escodegen.js";
              esgenerate = "bin/esgenerate.js";
            };
          };
          depInfo = {
            esprima = {
              descriptor = "^4.0.1";
              pin = "4.0.1";
              runtime = true;
            };
            estraverse = {
              descriptor = "^4.2.0";
              pin = "4.3.0";
              runtime = true;
            };
            esutils = {
              descriptor = "^2.0.2";
              pin = "2.0.3";
              runtime = true;
            };
            optionator = {
              descriptor = "^0.8.1";
              pin = "0.8.3";
              runtime = true;
            };
            source-map = {
              descriptor = "~0.6.1";
              optional = true;
              pin = "0.6.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ue6cdWj41Q3p1080bEHi/DI2brEXQ3crAYiG2x2fnQw=";
            type = "tarball";
            url = "https://registry.npmjs.org/escodegen/-/escodegen-1.14.3.tgz";
          };
          ident = "escodegen";
          ltype = "file";
          version = "1.14.3";
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
      estraverse = {
        "4.3.0" = {
          fetchInfo = {
            narHash = "sha256-ekB0YUgzdakntluHF3FoHv9+GZr7QJEua1FF32TYBaQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/estraverse/-/estraverse-4.3.0.tgz";
          };
          ident = "estraverse";
          ltype = "file";
          treeInfo = { };
          version = "4.3.0";
        };
      };
      esutils = {
        "2.0.3" = {
          fetchInfo = {
            narHash = "sha256-5ELIsVusYd9/R/gTN89JTtg9quxfu170hXVKuwceIdg=";
            type = "tarball";
            url = "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz";
          };
          ident = "esutils";
          ltype = "file";
          treeInfo = { };
          version = "2.0.3";
        };
      };
      exec-sh = {
        "0.3.6" = {
          fetchInfo = {
            narHash = "sha256-FZbEd2P4pLahPhi8gGg1WT0o43wl+x2DBpKQzim+aLc=";
            type = "tarball";
            url = "https://registry.npmjs.org/exec-sh/-/exec-sh-0.3.6.tgz";
          };
          ident = "exec-sh";
          ltype = "file";
          treeInfo = { };
          version = "0.3.6";
        };
      };
      execa = {
        "1.0.0" = {
          depInfo = {
            cross-spawn = {
              descriptor = "^6.0.0";
              pin = "6.0.5";
              runtime = true;
            };
            get-stream = {
              descriptor = "^4.0.0";
              pin = "4.1.0";
              runtime = true;
            };
            is-stream = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
            npm-run-path = {
              descriptor = "^2.0.0";
              pin = "2.0.2";
              runtime = true;
            };
            p-finally = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            signal-exit = {
              descriptor = "^3.0.0";
              pin = "3.0.7";
              runtime = true;
            };
            strip-eof = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hx1qtO39rupf0X0x9YIskDVlYSxhrUKo7xlh/jc/XIs=";
            type = "tarball";
            url = "https://registry.npmjs.org/execa/-/execa-1.0.0.tgz";
          };
          ident = "execa";
          ltype = "file";
          version = "1.0.0";
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
      expand-brackets = {
        "2.1.4" = {
          depInfo = {
            debug = {
              descriptor = "^2.3.3";
              pin = "2.6.9";
              runtime = true;
            };
            define-property = {
              descriptor = "^0.2.5";
              pin = "0.2.5";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            posix-character-classes = {
              descriptor = "^0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
            regex-not = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            snapdragon = {
              descriptor = "^0.8.1";
              pin = "0.8.2";
              runtime = true;
            };
            to-regex = {
              descriptor = "^3.0.1";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-GBo+FOiqZKWLs7NtwREFHtNJC4bLHVl/nLRbr46sV3Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/expand-brackets/-/expand-brackets-2.1.4.tgz";
          };
          ident = "expand-brackets";
          ltype = "file";
          version = "2.1.4";
        };
      };
      expect = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            ansi-styles = {
              descriptor = "^4.0.0";
              pin = "4.3.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wI1+O1fbUrYdnoeMO/YRydoI2W0GvTKRcexlKqIp9Lw=";
            type = "tarball";
            url = "https://registry.npmjs.org/expect/-/expect-25.5.0.tgz";
          };
          ident = "expect";
          ltype = "file";
          version = "25.5.0";
        };
      };
      extend = {
        "3.0.2" = {
          fetchInfo = {
            narHash = "sha256-fMaYYzkBS/Ut/IEysYn5eAUvOswEP/rcpCah/joRGBM=";
            type = "tarball";
            url = "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz";
          };
          ident = "extend";
          ltype = "file";
          treeInfo = { };
          version = "3.0.2";
        };
      };
      extend-shallow = {
        "2.0.1" = {
          depInfo = {
            is-extendable = {
              descriptor = "^0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-qV88mKQTirm3t4No4yrzHIotGX0WrTMTWeZrluPz5Rc=";
            type = "tarball";
            url = "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz";
          };
          ident = "extend-shallow";
          ltype = "file";
          version = "2.0.1";
        };
        "3.0.2" = {
          depInfo = {
            assign-symbols = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            is-extendable = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-BeaEhkiZfB0/kaSzCrbFvegmCCUmvktdRGibqbYvOaE=";
            type = "tarball";
            url = "https://registry.npmjs.org/extend-shallow/-/extend-shallow-3.0.2.tgz";
          };
          ident = "extend-shallow";
          ltype = "file";
          version = "3.0.2";
        };
      };
      extglob = {
        "2.0.4" = {
          depInfo = {
            array-unique = {
              descriptor = "^0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            define-property = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            expand-brackets = {
              descriptor = "^2.1.4";
              pin = "2.1.4";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            fragment-cache = {
              descriptor = "^0.2.1";
              pin = "0.2.1";
              runtime = true;
            };
            regex-not = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            snapdragon = {
              descriptor = "^0.8.1";
              pin = "0.8.2";
              runtime = true;
            };
            to-regex = {
              descriptor = "^3.0.1";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-u+F9PeGBP6U5g9a3g/FZktLXrLyLbXVE5mkHM5uPRsI=";
            type = "tarball";
            url = "https://registry.npmjs.org/extglob/-/extglob-2.0.4.tgz";
          };
          ident = "extglob";
          ltype = "file";
          version = "2.0.4";
        };
      };
      extsprintf = {
        "1.3.0" = {
          fetchInfo = {
            narHash = "sha256-kw+9iOQkx0cbE1466k1vTcBrMH+cm8++jCJ/4JrfCpw=";
            type = "tarball";
            url = "https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz";
          };
          ident = "extsprintf";
          ltype = "file";
          treeInfo = { };
          version = "1.3.0";
        };
      };
      fast-deep-equal = {
        "3.1.3" = {
          fetchInfo = {
            narHash = "sha256-KpUhRWsLDBdqgjClgxbRoAtbWsUvY7JhVil6+dMUqwE=";
            type = "tarball";
            url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz";
          };
          ident = "fast-deep-equal";
          ltype = "file";
          treeInfo = { };
          version = "3.1.3";
        };
      };
      fast-json-stable-stringify = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-nvrcRKamdCbRlzJK0Bh6NkK5zpCoFhkizKEov4yK2oI=";
            type = "tarball";
            url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
          };
          ident = "fast-json-stable-stringify";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      fast-levenshtein = {
        "2.0.6" = {
          fetchInfo = {
            narHash = "sha256-ecbIyMHylbbr7yuhLAsB/amPAPjjzF0rZw6qZDni7b8=";
            type = "tarball";
            url = "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz";
          };
          ident = "fast-levenshtein";
          ltype = "file";
          treeInfo = { };
          version = "2.0.6";
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
            url = "https://registry.npmjs.org/fb-watchman/-/fb-watchman-2.0.2.tgz";
          };
          ident = "fb-watchman";
          ltype = "file";
          version = "2.0.2";
        };
      };
      fill-range = {
        "4.0.0" = {
          depInfo = {
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            is-number = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            repeat-string = {
              descriptor = "^1.6.1";
              pin = "1.6.1";
              runtime = true;
            };
            to-regex-range = {
              descriptor = "^2.1.0";
              pin = "2.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-leAHHCS/19w0f5UvLHBPe2t9OUGuWJ67o4rdQrZAjz4=";
            type = "tarball";
            url = "https://registry.npmjs.org/fill-range/-/fill-range-4.0.0.tgz";
          };
          ident = "fill-range";
          ltype = "file";
          version = "4.0.0";
        };
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
            url = "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz";
          };
          ident = "fill-range";
          ltype = "file";
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
          version = "4.1.0";
        };
      };
      for-in = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-AASJRvEqnzDTszWRn3ksGLkYexihCAI0PcG2EepEG68=";
            type = "tarball";
            url = "https://registry.npmjs.org/for-in/-/for-in-1.0.2.tgz";
          };
          ident = "for-in";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      forever-agent = {
        "0.6.1" = {
          fetchInfo = {
            narHash = "sha256-40O7yb39mqzcsHaLjpGI08sLSut7RJnJejFJBYpkL6Y=";
            type = "tarball";
            url = "https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
          };
          ident = "forever-agent";
          ltype = "file";
          treeInfo = { };
          version = "0.6.1";
        };
      };
      form-data = {
        "2.3.3" = {
          depInfo = {
            asynckit = {
              descriptor = "^0.4.0";
              pin = "0.4.0";
              runtime = true;
            };
            combined-stream = {
              descriptor = "^1.0.6";
              pin = "1.0.8";
              runtime = true;
            };
            mime-types = {
              descriptor = "^2.1.12";
              pin = "2.1.35";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yqBx7Ycp2HXzGZWeCNW48Z3NwxJ0+SqWSLCs8Ase1HA=";
            type = "tarball";
            url = "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz";
          };
          ident = "form-data";
          ltype = "file";
          version = "2.3.3";
        };
      };
      fragment-cache = {
        "0.2.1" = {
          depInfo = {
            map-cache = {
              descriptor = "^0.2.2";
              pin = "0.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-t/OgDc0EtHrkH4Lh31vfntgdTZQ6Dr0pIQY5cULHFAQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/fragment-cache/-/fragment-cache-0.2.1.tgz";
          };
          ident = "fragment-cache";
          ltype = "file";
          version = "0.2.1";
        };
      };
      "fs.realpath" = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-oPk2F5VP+ECdKr8qs3h0dziW0mK71uwTUrbgulLI/ks=";
            type = "tarball";
            url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
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
          lifecycle = {
            install = true;
          };
          ltype = "file";
          sysInfo = {
            os = [
              "darwin"
            ];
          };
          treeInfo = { };
          version = "2.3.2";
        };
      };
      function-bind = {
        "1.1.1" = {
          fetchInfo = {
            narHash = "sha256-9SZTeDBJ87ogdiEHyC3b2/wr1Bv8qb8rCJeD+OYvf9A=";
            type = "tarball";
            url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
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
            url = "https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz";
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
            url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
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
            url = "https://registry.npmjs.org/get-package-type/-/get-package-type-0.1.0.tgz";
          };
          ident = "get-package-type";
          ltype = "file";
          treeInfo = { };
          version = "0.1.0";
        };
      };
      get-stream = {
        "4.1.0" = {
          depInfo = {
            pump = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-p49qiQ/A4CUjKtLue3dPXu3TH+iyCEMPyVeXQlhuFfA=";
            type = "tarball";
            url = "https://registry.npmjs.org/get-stream/-/get-stream-4.1.0.tgz";
          };
          ident = "get-stream";
          ltype = "file";
          version = "4.1.0";
        };
      };
      get-value = {
        "2.0.6" = {
          fetchInfo = {
            narHash = "sha256-TkTTouXDqF8fjzasPKBDygOONtWtXjCgyG2wHcBO2h4=";
            type = "tarball";
            url = "https://registry.npmjs.org/get-value/-/get-value-2.0.6.tgz";
          };
          ident = "get-value";
          ltype = "file";
          treeInfo = { };
          version = "2.0.6";
        };
      };
      getpass = {
        "0.1.7" = {
          depInfo = {
            assert-plus = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-6tZsrTjEb8BSDJYPBNXBcphG0vs5xIbuOMLGSrTIvHE=";
            type = "tarball";
            url = "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz";
          };
          ident = "getpass";
          ltype = "file";
          version = "0.1.7";
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
            url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.10.tgz";
          };
          ident = "graceful-fs";
          ltype = "file";
          treeInfo = { };
          version = "4.2.10";
        };
      };
      har-schema = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-ADOciTnc9IG4BIWzmodWXLjGC1nzKMsXbi5z7SpmYow=";
            type = "tarball";
            url = "https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz";
          };
          ident = "har-schema";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      har-validator = {
        "5.1.5" = {
          depInfo = {
            ajv = {
              descriptor = "^6.12.3";
              pin = "6.12.6";
              runtime = true;
            };
            har-schema = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yGcWoB42XRkVWX4pleE8yNsyKI3d4umsN/3ag0ecrAg=";
            type = "tarball";
            url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.5.tgz";
          };
          ident = "har-validator";
          ltype = "file";
          version = "5.1.5";
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
      has-value = {
        "0.3.1" = {
          depInfo = {
            get-value = {
              descriptor = "^2.0.3";
              pin = "2.0.6";
              runtime = true;
            };
            has-values = {
              descriptor = "^0.1.4";
              pin = "0.1.4";
              runtime = true;
            };
            isobject = {
              descriptor = "^2.0.0";
              pin = "2.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fumPftmKORBxNuE8DXMd0B876eFzWWIEacOyomnzfoE=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-value/-/has-value-0.3.1.tgz";
          };
          ident = "has-value";
          ltype = "file";
          version = "0.3.1";
        };
        "1.0.0" = {
          depInfo = {
            get-value = {
              descriptor = "^2.0.6";
              pin = "2.0.6";
              runtime = true;
            };
            has-values = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LcbqCi9GEz6Fopbu/UZ8cEm0Aiu5dR8yD6gtWWdKuxw=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-value/-/has-value-1.0.0.tgz";
          };
          ident = "has-value";
          ltype = "file";
          version = "1.0.0";
        };
      };
      has-values = {
        "0.1.4" = {
          fetchInfo = {
            narHash = "sha256-rpmhxuatjiFFfaESAh4vh1yPRk7z38Dv/7OELpV67/s=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-values/-/has-values-0.1.4.tgz";
          };
          ident = "has-values";
          ltype = "file";
          treeInfo = { };
          version = "0.1.4";
        };
        "1.0.0" = {
          depInfo = {
            is-number = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            kind-of = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hNp5LJ5beGq+oW92uTN1No8C7J/YWgXtH31fFPFDHZU=";
            type = "tarball";
            url = "https://registry.npmjs.org/has-values/-/has-values-1.0.0.tgz";
          };
          ident = "has-values";
          ltype = "file";
          version = "1.0.0";
        };
      };
      hosted-git-info = {
        "2.8.9" = {
          fetchInfo = {
            narHash = "sha256-jCPJw+0WqYSPtpRNJ9zu5yDrS7L7QWgrJsnZtF3+Mso=";
            type = "tarball";
            url = "https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-2.8.9.tgz";
          };
          ident = "hosted-git-info";
          ltype = "file";
          treeInfo = { };
          version = "2.8.9";
        };
      };
      html-encoding-sniffer = {
        "1.0.2" = {
          depInfo = {
            whatwg-encoding = {
              descriptor = "^1.0.1";
              pin = "1.0.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-hfJ5rBOOIfAldC9WKNxC4TnfTUNXFyS3/eOSFPmIyf8=";
            type = "tarball";
            url = "https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-1.0.2.tgz";
          };
          ident = "html-encoding-sniffer";
          ltype = "file";
          version = "1.0.2";
        };
      };
      http-signature = {
        "1.2.0" = {
          depInfo = {
            assert-plus = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            jsprim = {
              descriptor = "^1.2.2";
              pin = "1.4.2";
              runtime = true;
            };
            sshpk = {
              descriptor = "^1.7.0";
              pin = "1.17.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OWoxemqqP9r2maG/jQjkMDYqZ2i5Zkb1MekECTztRWc=";
            type = "tarball";
            url = "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz";
          };
          ident = "http-signature";
          ltype = "file";
          version = "1.2.0";
        };
      };
      iconv-lite = {
        "0.4.24" = {
          depInfo = {
            safer-buffer = {
              descriptor = ">= 2.1.2 < 3";
              pin = "2.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-AKyquJsE0pmfPSGiC+7IuhvniNI9MEFVEub2XcvIKjc=";
            type = "tarball";
            url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz";
          };
          ident = "iconv-lite";
          ltype = "file";
          version = "0.4.24";
        };
      };
      imurmurhash = {
        "0.1.4" = {
          fetchInfo = {
            narHash = "sha256-kQg6DzTfAqCJNsP9gs1WygIi03+4/AGeF43p9h4LH30=";
            type = "tarball";
            url = "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz";
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
      ip-regex = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-LEKrFW050z9nnLAVmnnT5cA5O2TBWi5CKXZ4zyDRvUI=";
            type = "tarball";
            url = "https://registry.npmjs.org/ip-regex/-/ip-regex-2.1.0.tgz";
          };
          ident = "ip-regex";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      is-accessor-descriptor = {
        "0.1.6" = {
          depInfo = {
            kind-of = {
              descriptor = "^3.0.2";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-6qoX3aQFUWJvyOp3MveM8/CBB/T0lUCLy12NdvNrquI=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz";
          };
          ident = "is-accessor-descriptor";
          ltype = "file";
          version = "0.1.6";
        };
        "1.0.0" = {
          depInfo = {
            kind-of = {
              descriptor = "^6.0.0";
              pin = "6.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vJvAJ8szdmV1k3ujo6Wkam6GK7zGfEuI4ldKaPnr1Yk=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz";
          };
          ident = "is-accessor-descriptor";
          ltype = "file";
          version = "1.0.0";
        };
      };
      is-arrayish = {
        "0.2.1" = {
          fetchInfo = {
            narHash = "sha256-wvuJg92GZxDL9IffjN5ttz8DRki65ZgZoM3Mr1V9IyM=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz";
          };
          ident = "is-arrayish";
          ltype = "file";
          treeInfo = { };
          version = "0.2.1";
        };
      };
      is-buffer = {
        "1.1.6" = {
          fetchInfo = {
            narHash = "sha256-ZqhOEtSsW9VIca+cNURW1kJrDYAM/JqAv9c8kIaioHg=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-buffer/-/is-buffer-1.1.6.tgz";
          };
          ident = "is-buffer";
          ltype = "file";
          treeInfo = { };
          version = "1.1.6";
        };
      };
      is-ci = {
        "2.0.0" = {
          binInfo = {
            binPairs = {
              is-ci = "bin.js";
            };
          };
          depInfo = {
            ci-info = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-iqQRiQ0SQ2PPnzJwlGXf6FGIZchkk0UxyY81rY1Ph5M=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-ci/-/is-ci-2.0.0.tgz";
          };
          ident = "is-ci";
          ltype = "file";
          version = "2.0.0";
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
            url = "https://registry.npmjs.org/is-core-module/-/is-core-module-2.11.0.tgz";
          };
          ident = "is-core-module";
          ltype = "file";
          version = "2.11.0";
        };
      };
      is-data-descriptor = {
        "0.1.4" = {
          depInfo = {
            kind-of = {
              descriptor = "^3.0.2";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8nXVGDnZJCtXUk65QO8vGocsA/Y0QKIm3Us1esPt9Fc=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz";
          };
          ident = "is-data-descriptor";
          ltype = "file";
          version = "0.1.4";
        };
        "1.0.0" = {
          depInfo = {
            kind-of = {
              descriptor = "^6.0.0";
              pin = "6.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-gTKHdQHzL9Oteu+TyuDxXhn3pXOmDfvXlyN/X0tNT5E=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz";
          };
          ident = "is-data-descriptor";
          ltype = "file";
          version = "1.0.0";
        };
      };
      is-descriptor = {
        "0.1.6" = {
          depInfo = {
            is-accessor-descriptor = {
              descriptor = "^0.1.6";
              pin = "0.1.6";
              runtime = true;
            };
            is-data-descriptor = {
              descriptor = "^0.1.4";
              pin = "0.1.4";
              runtime = true;
            };
            kind-of = {
              descriptor = "^5.0.0";
              pin = "5.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-jOTkqnZouYrPQIOm6zhzcOmIKoKo+n0b5oP+Rj0x2e8=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-descriptor/-/is-descriptor-0.1.6.tgz";
          };
          ident = "is-descriptor";
          ltype = "file";
          version = "0.1.6";
        };
        "1.0.2" = {
          depInfo = {
            is-accessor-descriptor = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            is-data-descriptor = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            kind-of = {
              descriptor = "^6.0.2";
              pin = "6.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8wI/NPgqPImA4EZoKBXtojv3Kif89I4AANDIYGT6hNY=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz";
          };
          ident = "is-descriptor";
          ltype = "file";
          version = "1.0.2";
        };
      };
      is-extendable = {
        "0.1.1" = {
          fetchInfo = {
            narHash = "sha256-v1hJq74OXLHSGXp6M+LKzbRKdEMkOBZHky74j+uJH/A=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-extendable/-/is-extendable-0.1.1.tgz";
          };
          ident = "is-extendable";
          ltype = "file";
          treeInfo = { };
          version = "0.1.1";
        };
        "1.0.1" = {
          depInfo = {
            is-plain-object = {
              descriptor = "^2.0.4";
              pin = "2.0.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-tkaETV31K3OaYYG4uOSTEn0tMHR4Cr5wNvi+bTTNX3w=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz";
          };
          ident = "is-extendable";
          ltype = "file";
          version = "1.0.1";
        };
      };
      is-fullwidth-code-point = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-FAwh/1ODBHIw/Tm2EQLvleV6Xkb1qy7AKy6kBEi9ei8=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
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
            url = "https://registry.npmjs.org/is-generator-fn/-/is-generator-fn-2.1.0.tgz";
          };
          ident = "is-generator-fn";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      is-number = {
        "3.0.0" = {
          depInfo = {
            kind-of = {
              descriptor = "^3.0.2";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-iwxV0galuDYWXJ4R3386SK+vhLyZ0IPcIMTBdK9fLjg=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-number/-/is-number-3.0.0.tgz";
          };
          ident = "is-number";
          ltype = "file";
          version = "3.0.0";
        };
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
      is-plain-object = {
        "2.0.4" = {
          depInfo = {
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-/5upb4OB9itAJTTssxgDReqRLG+DTV0CA6BmqfqD3OI=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-plain-object/-/is-plain-object-2.0.4.tgz";
          };
          ident = "is-plain-object";
          ltype = "file";
          version = "2.0.4";
        };
      };
      is-stream = {
        "1.1.0" = {
          fetchInfo = {
            narHash = "sha256-8fAw+WPWodAWy1fYEX1/2r/OSGINjzccB2Nw+VUluRA=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz";
          };
          ident = "is-stream";
          ltype = "file";
          treeInfo = { };
          version = "1.1.0";
        };
      };
      is-typedarray = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-KV/7NxzQDyhkz9Q5WFDM6T+JXnFOBf7qW9eK4XowMtw=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz";
          };
          ident = "is-typedarray";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      is-windows = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-EDbnSF8ISsPa0Z5RjjkM04ykTNdIvwPry+01gPe4ZP0=";
            type = "tarball";
            url = "https://registry.npmjs.org/is-windows/-/is-windows-1.0.2.tgz";
          };
          ident = "is-windows";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      isarray = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-MgGyCOqRFUXaO8KLEId+Y33InKHReFgmLkbofWbfhgA=";
            type = "tarball";
            url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
          };
          ident = "isarray";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
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
      isobject = {
        "2.1.0" = {
          depInfo = {
            isarray = {
              descriptor = "1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-FcJ6shT4owGFSFlyhBUtxcLgbvlaovz2JSWSLf0+vG8=";
            type = "tarball";
            url = "https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz";
          };
          ident = "isobject";
          ltype = "file";
          version = "2.1.0";
        };
        "3.0.1" = {
          fetchInfo = {
            narHash = "sha256-9BvmvB6upW/lzT2RVapZS1bMdEKFO4stN29WY0wIX2g=";
            type = "tarball";
            url = "https://registry.npmjs.org/isobject/-/isobject-3.0.1.tgz";
          };
          ident = "isobject";
          ltype = "file";
          treeInfo = { };
          version = "3.0.1";
        };
      };
      isstream = {
        "0.1.2" = {
          fetchInfo = {
            narHash = "sha256-PtZMVwH6u+fw6jYejz34Lh1B2W2XyAMi1tLEs2otaso=";
            type = "tarball";
            url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
          };
          ident = "isstream";
          ltype = "file";
          treeInfo = { };
          version = "0.1.2";
        };
      };
      istanbul-lib-coverage = {
        "3.2.0" = {
          fetchInfo = {
            narHash = "sha256-SBDQUKLOF5c2ZbzCiUKmwBRjeL6z9bfOEOiZUEQ4nok=";
            type = "tarball";
            url = "https://registry.npmjs.org/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.0.tgz";
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
            url = "https://registry.npmjs.org/istanbul-lib-instrument/-/istanbul-lib-instrument-5.2.1.tgz";
          };
          ident = "istanbul-lib-instrument";
          ltype = "file";
          version = "5.2.1";
        };
      };
      jest-config = {
        "25.5.4" = {
          depInfo = {
            "@babel/core" = {
              descriptor = "^7.1.0";
              pin = "7.20.12";
              runtime = true;
            };
            "@jest/test-sequencer" = {
              descriptor = "^25.5.4";
              pin = "25.5.4";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            babel-jest = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            deepmerge = {
              descriptor = "^4.2.2";
              pin = "4.3.0";
              runtime = true;
            };
            glob = {
              descriptor = "^7.1.1";
              pin = "7.2.3";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-environment-jsdom = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-environment-node = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-jasmine2 = {
              descriptor = "^25.5.4";
              pin = "25.5.4";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.2";
              pin = "4.0.5";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            realpath-native = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vLEP1aJYNYDYbZbh2i3FM4L8yL3j+1lIFUgYnU9Fg8w=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-config/-/jest-config-25.5.4.tgz";
          };
          ident = "jest-config";
          ltype = "file";
          version = "25.5.4";
        };
      };
      jest-diff = {
        "25.5.0" = {
          depInfo = {
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            diff-sequences = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-VVP7djUYnLreUOfb493S3dkugK3SVS+YmdzKdC7cQXk=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-diff/-/jest-diff-25.5.0.tgz";
          };
          ident = "jest-diff";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-docblock = {
        "25.3.0" = {
          depInfo = {
            detect-newline = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-PfE0ZaOoZYq1sL6Y8fjA/1LF8DHM/NbSXQO62OCyw9A=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-docblock/-/jest-docblock-25.3.0.tgz";
          };
          ident = "jest-docblock";
          ltype = "file";
          version = "25.3.0";
        };
      };
      jest-each = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Km9rl1C29T1QIRWkapJ8JpSrdPDVwl4LGmcP/b5jI2A=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-each/-/jest-each-25.5.0.tgz";
          };
          ident = "jest-each";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-environment-jsdom = {
        "25.5.0" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/fake-timers" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jsdom = {
              descriptor = "^15.2.1";
              pin = "15.2.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-en9Ne0fByObeIFFl05/E9FR4H1tzRs2pKxrfA85tSoM=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-environment-jsdom/-/jest-environment-jsdom-25.5.0.tgz";
          };
          ident = "jest-environment-jsdom";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-environment-node = {
        "25.5.0" = {
          depInfo = {
            "@jest/environment" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/fake-timers" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            semver = {
              descriptor = "^6.3.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Z2/fxNpteYMpdXV3yXHpCj+QzbB3hErUe4jf1bFk9n8=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-environment-node/-/jest-environment-node-25.5.0.tgz";
          };
          ident = "jest-environment-node";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-get-type = {
        "25.2.6" = {
          fetchInfo = {
            narHash = "sha256-0YLbEH1w1U5vbhdzaHkhjqQZf1GN0mlUstFqyiOK0oY=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-get-type/-/jest-get-type-25.2.6.tgz";
          };
          ident = "jest-get-type";
          ltype = "file";
          treeInfo = { };
          version = "25.2.6";
        };
      };
      jest-haste-map = {
        "25.5.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@types/graceful-fs" = {
              descriptor = "^4.1.2";
              pin = "4.1.6";
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
              descriptor = "^2.1.2";
              optional = true;
              pin = "2.3.2";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-serializer = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-worker = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.2";
              pin = "4.0.5";
              runtime = true;
            };
            sane = {
              descriptor = "^4.0.3";
              pin = "4.1.0";
              runtime = true;
            };
            walker = {
              descriptor = "^1.0.7";
              pin = "1.0.8";
              runtime = true;
            };
            which = {
              descriptor = "^2.0.2";
              pin = "2.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-srG6HIIbVtSQ8NZSu3ZLRtbEP57UwLyvPD7GmqxFoGg=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-haste-map/-/jest-haste-map-25.5.1.tgz";
          };
          ident = "jest-haste-map";
          ltype = "file";
          version = "25.5.1";
        };
      };
      jest-jasmine2 = {
        "25.5.4" = {
          depInfo = {
            "@babel/traverse" = {
              descriptor = "^7.1.0";
              pin = "7.20.13";
              runtime = true;
            };
            "@jest/environment" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/source-map" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            co = {
              descriptor = "^4.6.0";
              pin = "4.6.0";
              runtime = true;
            };
            expect = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            is-generator-fn = {
              descriptor = "^2.0.0";
              pin = "2.1.0";
              runtime = true;
            };
            jest-each = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-runtime = {
              descriptor = "^25.5.4";
              pin = "25.5.4";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            throat = {
              descriptor = "^5.0.0";
              pin = "5.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ZSiiWgntOdxZ/mauNMp9alJWebcny8/SebKFtYY6aTo=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-jasmine2/-/jest-jasmine2-25.5.4.tgz";
          };
          ident = "jest-jasmine2";
          ltype = "file";
          version = "25.5.4";
        };
      };
      jest-leak-detector = {
        "25.5.0" = {
          depInfo = {
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-xwCT1sm88R1OOCgLN+pp+Gt248HzNGQ9rqqA4vstwug=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-leak-detector/-/jest-leak-detector-25.5.0.tgz";
          };
          ident = "jest-leak-detector";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-matcher-utils = {
        "25.5.0" = {
          depInfo = {
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            jest-diff = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-rGisSuzmXjlIYPJ45wal8gfMXf0F+AF5EwNhBOCuBe0=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-matcher-utils/-/jest-matcher-utils-25.5.0.tgz";
          };
          ident = "jest-matcher-utils";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-message-util = {
        "25.5.0" = {
          depInfo = {
            "@babel/code-frame" = {
              descriptor = "^7.0.0";
              pin = "7.18.6";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@types/stack-utils" = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            micromatch = {
              descriptor = "^4.0.2";
              pin = "4.0.5";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            stack-utils = {
              descriptor = "^1.0.1";
              pin = "1.0.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-nBQXNTFdxg3e9lxZc2j6qbFhZivFntph/mNqyKX2EZg=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-message-util/-/jest-message-util-25.5.0.tgz";
          };
          ident = "jest-message-util";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-mock = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-7wh4rLx6lWJaDFndl8yKpbwxqAo+lFMbnDomQhK8wJA=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-mock/-/jest-mock-25.5.0.tgz";
          };
          ident = "jest-mock";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-pnp-resolver = {
        "1.2.3" = {
          fetchInfo = {
            narHash = "sha256-W/85qiqWwybP98QaAop8DETyZIJyyMwijm7EBZlWKCc=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-pnp-resolver/-/jest-pnp-resolver-1.2.3.tgz";
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
        "25.2.6" = {
          fetchInfo = {
            narHash = "sha256-nKF0ZM9Yis115Misw6TLjSwSN8ROQ+KANk5HWGaU+mU=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-regex-util/-/jest-regex-util-25.2.6.tgz";
          };
          ident = "jest-regex-util";
          ltype = "file";
          treeInfo = { };
          version = "25.2.6";
        };
      };
      jest-resolve = {
        "25.5.1" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            browser-resolve = {
              descriptor = "^1.11.3";
              pin = "1.11.3";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-pnp-resolver = {
              descriptor = "^1.2.1";
              pin = "1.2.3";
              runtime = true;
            };
            read-pkg-up = {
              descriptor = "^7.0.1";
              pin = "7.0.1";
              runtime = true;
            };
            realpath-native = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            resolve = {
              descriptor = "^1.17.0";
              pin = "1.22.1";
              runtime = true;
            };
            slash = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ND1MkPyDMcDi/5mNZvv9NFNq29jDZFyLhlFmAjJ4Zy8=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-resolve/-/jest-resolve-25.5.1.tgz";
          };
          ident = "jest-resolve";
          ltype = "file";
          version = "25.5.1";
        };
      };
      jest-runtime = {
        "25.5.4" = {
          binInfo = {
            binPairs = {
              jest-runtime = "bin/jest-runtime.js";
            };
          };
          depInfo = {
            "@jest/console" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/environment" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/globals" = {
              descriptor = "^25.5.2";
              pin = "25.5.2";
              runtime = true;
            };
            "@jest/source-map" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/test-result" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@jest/transform" = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@types/yargs" = {
              descriptor = "^15.0.0";
              pin = "15.0.15";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
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
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-config = {
              descriptor = "^25.5.4";
              pin = "25.5.4";
              runtime = true;
            };
            jest-haste-map = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-mock = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-regex-util = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-snapshot = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            jest-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-validate = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            realpath-native = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
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
            yargs = {
              descriptor = "^15.3.1";
              pin = "15.4.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-No2MeQEPiwGU2Ulz4+EKgw910RPELRaRxWonHkwLtOI=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-runtime/-/jest-runtime-25.5.4.tgz";
          };
          ident = "jest-runtime";
          ltype = "file";
          version = "25.5.4";
        };
      };
      jest-serializer = {
        "25.5.0" = {
          depInfo = {
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-J/XCkuC+SB0A8eZ/gzyCDdVs/lWpqmDTq0eWsVBaKig=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-serializer/-/jest-serializer-25.5.0.tgz";
          };
          ident = "jest-serializer";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-snapshot = {
        "25.5.1" = {
          depInfo = {
            "@babel/types" = {
              descriptor = "^7.0.0";
              pin = "7.20.7";
              runtime = true;
            };
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            "@types/prettier" = {
              descriptor = "^1.19.0";
              pin = "1.19.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            expect = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            jest-diff = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            jest-matcher-utils = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-message-util = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            jest-resolve = {
              descriptor = "^25.5.1";
              pin = "25.5.1";
              runtime = true;
            };
            make-dir = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
            natural-compare = {
              descriptor = "^1.4.0";
              pin = "1.4.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            semver = {
              descriptor = "^6.3.0";
              pin = "6.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-U7jDrjIyvZ2BQQsp1HN7GzgSBoYSbt1hxgrvqwVpN8A=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-snapshot/-/jest-snapshot-25.5.1.tgz";
          };
          ident = "jest-snapshot";
          ltype = "file";
          version = "25.5.1";
        };
      };
      jest-util = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            graceful-fs = {
              descriptor = "^4.2.4";
              pin = "4.2.10";
              runtime = true;
            };
            is-ci = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            make-dir = {
              descriptor = "^3.0.0";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-u1hzSc0daraGvSIGp/Kkk6xNWB/uhdR7G8M9Xf+f318=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-util/-/jest-util-25.5.0.tgz";
          };
          ident = "jest-util";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-validate = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            camelcase = {
              descriptor = "^5.3.1";
              pin = "5.3.1";
              runtime = true;
            };
            chalk = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            jest-get-type = {
              descriptor = "^25.2.6";
              pin = "25.2.6";
              runtime = true;
            };
            leven = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            pretty-format = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Eqfvz4Rg/zbd90xE+It4EojqpHZM6OT560pz+jhpxxY=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-validate/-/jest-validate-25.5.0.tgz";
          };
          ident = "jest-validate";
          ltype = "file";
          version = "25.5.0";
        };
      };
      jest-worker = {
        "25.5.0" = {
          depInfo = {
            merge-stream = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            supports-color = {
              descriptor = "^7.0.0";
              pin = "7.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-uAgpGzfjlqMZYQgFx2KT156oJQm35RcIaiAzkd4++Ds=";
            type = "tarball";
            url = "https://registry.npmjs.org/jest-worker/-/jest-worker-25.5.0.tgz";
          };
          ident = "jest-worker";
          ltype = "file";
          version = "25.5.0";
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
          binInfo = {
            binPairs = {
              js-yaml = "bin/js-yaml.js";
            };
          };
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
          version = "3.14.1";
        };
      };
      jsbn = {
        "0.1.1" = {
          fetchInfo = {
            narHash = "sha256-SoL6c6hU9AE+fa4FKsfpLyeoPPyj4nOtSMeBla0U/1c=";
            type = "tarball";
            url = "https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz";
          };
          ident = "jsbn";
          ltype = "file";
          treeInfo = { };
          version = "0.1.1";
        };
      };
      jsdom = {
        "15.2.1" = {
          depInfo = {
            abab = {
              descriptor = "^2.0.0";
              pin = "2.0.6";
              runtime = true;
            };
            acorn = {
              descriptor = "^7.1.0";
              pin = "7.4.1";
              runtime = true;
            };
            acorn-globals = {
              descriptor = "^4.3.2";
              pin = "4.3.4";
              runtime = true;
            };
            array-equal = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            cssom = {
              descriptor = "^0.4.1";
              pin = "0.4.4";
              runtime = true;
            };
            cssstyle = {
              descriptor = "^2.0.0";
              pin = "2.3.0";
              runtime = true;
            };
            data-urls = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
            domexception = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
            escodegen = {
              descriptor = "^1.11.1";
              pin = "1.14.3";
              runtime = true;
            };
            html-encoding-sniffer = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            nwsapi = {
              descriptor = "^2.2.0";
              pin = "2.2.2";
              runtime = true;
            };
            parse5 = {
              descriptor = "5.1.0";
              pin = "5.1.0";
              runtime = true;
            };
            pn = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
            request = {
              descriptor = "^2.88.0";
              pin = "2.88.2";
              runtime = true;
            };
            request-promise-native = {
              descriptor = "^1.0.7";
              pin = "1.0.9";
              runtime = true;
            };
            saxes = {
              descriptor = "^3.1.9";
              pin = "3.1.11";
              runtime = true;
            };
            symbol-tree = {
              descriptor = "^3.2.2";
              pin = "3.2.4";
              runtime = true;
            };
            tough-cookie = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
            w3c-hr-time = {
              descriptor = "^1.0.1";
              pin = "1.0.2";
              runtime = true;
            };
            w3c-xmlserializer = {
              descriptor = "^1.1.2";
              pin = "1.1.2";
              runtime = true;
            };
            webidl-conversions = {
              descriptor = "^4.0.2";
              pin = "4.0.2";
              runtime = true;
            };
            whatwg-encoding = {
              descriptor = "^1.0.5";
              pin = "1.0.5";
              runtime = true;
            };
            whatwg-mimetype = {
              descriptor = "^2.3.0";
              pin = "2.3.0";
              runtime = true;
            };
            whatwg-url = {
              descriptor = "^7.0.0";
              pin = "7.1.0";
              runtime = true;
            };
            ws = {
              descriptor = "^7.0.0";
              pin = "7.5.9";
              runtime = true;
            };
            xml-name-validator = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ODgEDXD48LqP7erFrrNmT7i8K/alvcEIeBrlDBSuJss=";
            type = "tarball";
            url = "https://registry.npmjs.org/jsdom/-/jsdom-15.2.1.tgz";
          };
          ident = "jsdom";
          ltype = "file";
          peerInfo = {
            canvas = {
              descriptor = "^2.5.0";
              optional = true;
            };
          };
          version = "15.2.1";
        };
      };
      jsesc = {
        "2.5.2" = {
          binInfo = {
            binPairs = {
              jsesc = "bin/jsesc";
            };
          };
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
            url = "https://registry.npmjs.org/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz";
          };
          ident = "json-parse-even-better-errors";
          ltype = "file";
          treeInfo = { };
          version = "2.3.1";
        };
      };
      json-schema = {
        "0.4.0" = {
          fetchInfo = {
            narHash = "sha256-B1iZdTBuGZ0Hb/8kkKQfbfmQXhNp4VYCpYg8IX22B8A=";
            type = "tarball";
            url = "https://registry.npmjs.org/json-schema/-/json-schema-0.4.0.tgz";
          };
          ident = "json-schema";
          ltype = "file";
          treeInfo = { };
          version = "0.4.0";
        };
      };
      json-schema-traverse = {
        "0.4.1" = {
          fetchInfo = {
            narHash = "sha256-6yxGXpY70Yc8jAAxR3YYhEXUc0SHZ3Peg+laVwXK9nQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
          };
          ident = "json-schema-traverse";
          ltype = "file";
          treeInfo = { };
          version = "0.4.1";
        };
      };
      json-stringify-safe = {
        "5.0.1" = {
          fetchInfo = {
            narHash = "sha256-MqTycXgztUscNuklIE+IKJz8Fvop4LfaxvWJKei3yi4=";
            type = "tarball";
            url = "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
          };
          ident = "json-stringify-safe";
          ltype = "file";
          treeInfo = { };
          version = "5.0.1";
        };
      };
      json5 = {
        "2.2.3" = {
          binInfo = {
            binPairs = {
              json5 = "lib/cli.js";
            };
          };
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
      jsprim = {
        "1.4.2" = {
          depInfo = {
            assert-plus = {
              descriptor = "1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            extsprintf = {
              descriptor = "1.3.0";
              pin = "1.3.0";
              runtime = true;
            };
            json-schema = {
              descriptor = "0.4.0";
              pin = "0.4.0";
              runtime = true;
            };
            verror = {
              descriptor = "1.10.0";
              pin = "1.10.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-MUkhDXSwDuL/u/rM9Uo58jfABQ7TIOVfrFFnjKPmmWE=";
            type = "tarball";
            url = "https://registry.npmjs.org/jsprim/-/jsprim-1.4.2.tgz";
          };
          ident = "jsprim";
          ltype = "file";
          version = "1.4.2";
        };
      };
      kind-of = {
        "3.2.2" = {
          depInfo = {
            is-buffer = {
              descriptor = "^1.1.5";
              pin = "1.1.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-yRM6JP99sU65SxeGWSohqywnfd2ZJjSHapTtKr2FNJ8=";
            type = "tarball";
            url = "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz";
          };
          ident = "kind-of";
          ltype = "file";
          version = "3.2.2";
        };
        "4.0.0" = {
          depInfo = {
            is-buffer = {
              descriptor = "^1.1.5";
              pin = "1.1.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-blSi0We+UGAZSJ23+MWX8l6O7jOHzcTda+WgVpt1VXo=";
            type = "tarball";
            url = "https://registry.npmjs.org/kind-of/-/kind-of-4.0.0.tgz";
          };
          ident = "kind-of";
          ltype = "file";
          version = "4.0.0";
        };
        "5.1.0" = {
          fetchInfo = {
            narHash = "sha256-xTVrU6SJL/U5BJotT3ULbMp/0Rj8PilrHw3rSE/cxvQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/kind-of/-/kind-of-5.1.0.tgz";
          };
          ident = "kind-of";
          ltype = "file";
          treeInfo = { };
          version = "5.1.0";
        };
        "6.0.3" = {
          fetchInfo = {
            narHash = "sha256-iGmWxJ3d49FAmFRRCxUfWJJx8voPZf5bL/ay2km/eQU=";
            type = "tarball";
            url = "https://registry.npmjs.org/kind-of/-/kind-of-6.0.3.tgz";
          };
          ident = "kind-of";
          ltype = "file";
          treeInfo = { };
          version = "6.0.3";
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
      levn = {
        "0.3.0" = {
          depInfo = {
            prelude-ls = {
              descriptor = "~1.1.2";
              pin = "1.1.2";
              runtime = true;
            };
            type-check = {
              descriptor = "~0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-iMX+ZSlxJcFBWJVcIPnkzvtpiuuq8IhvnVzzh4OQloE=";
            type = "tarball";
            url = "https://registry.npmjs.org/levn/-/levn-0.3.0.tgz";
          };
          ident = "levn";
          ltype = "file";
          version = "0.3.0";
        };
      };
      lines-and-columns = {
        "1.2.4" = {
          fetchInfo = {
            narHash = "sha256-WUoaqN7ad2gwBKftukjtNRrFw19fcS7dRRog0pp4OHE=";
            type = "tarball";
            url = "https://registry.npmjs.org/lines-and-columns/-/lines-and-columns-1.2.4.tgz";
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
            url = "https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz";
          };
          ident = "locate-path";
          ltype = "file";
          version = "5.0.0";
        };
      };
      lodash = {
        "4.17.21" = {
          fetchInfo = {
            narHash = "sha256-amyN064Yh6psvOfLgcpktd5dRNQStUYHHoIqiI6DMek=";
            type = "tarball";
            url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
          };
          ident = "lodash";
          ltype = "file";
          treeInfo = { };
          version = "4.17.21";
        };
      };
      "lodash.sortby" = {
        "4.7.0" = {
          fetchInfo = {
            narHash = "sha256-9XOwwBlwD3I27FhHmHrlQUi9yCqxL3djBU+oDcK1cwA=";
            type = "tarball";
            url = "https://registry.npmjs.org/lodash.sortby/-/lodash.sortby-4.7.0.tgz";
          };
          ident = "lodash.sortby";
          ltype = "file";
          treeInfo = { };
          version = "4.7.0";
        };
      };
      lolex = {
        "5.1.2" = {
          depInfo = {
            "@sinonjs/commons" = {
              descriptor = "^1.7.0";
              pin = "1.8.6";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HbX4pisAhGsVaoe8wrImJglHjWwOnFie8ijepY2LXh8=";
            type = "tarball";
            url = "https://registry.npmjs.org/lolex/-/lolex-5.1.2.tgz";
          };
          ident = "lolex";
          ltype = "file";
          version = "5.1.2";
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
          version = "5.1.1";
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
          version = "1.0.12";
        };
      };
      map-cache = {
        "0.2.2" = {
          fetchInfo = {
            narHash = "sha256-FaQFxQVI2Tw5FHpMfJ9pwYCkLD72lr/SftrYW+uM1/g=";
            type = "tarball";
            url = "https://registry.npmjs.org/map-cache/-/map-cache-0.2.2.tgz";
          };
          ident = "map-cache";
          ltype = "file";
          treeInfo = { };
          version = "0.2.2";
        };
      };
      map-visit = {
        "1.0.0" = {
          depInfo = {
            object-visit = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-8FSzdSjpWnDSHNNj+yxKo+X4oJWneMTPpsc1pOUlmgM=";
            type = "tarball";
            url = "https://registry.npmjs.org/map-visit/-/map-visit-1.0.0.tgz";
          };
          ident = "map-visit";
          ltype = "file";
          version = "1.0.0";
        };
      };
      merge-stream = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-0ZC11XNq6TaUxEXOV9bwaS71Qd3wQoqZAkFRvtnab5I=";
            type = "tarball";
            url = "https://registry.npmjs.org/merge-stream/-/merge-stream-2.0.0.tgz";
          };
          ident = "merge-stream";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      micromatch = {
        "3.1.10" = {
          depInfo = {
            arr-diff = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
            array-unique = {
              descriptor = "^0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            braces = {
              descriptor = "^2.3.1";
              pin = "2.3.2";
              runtime = true;
            };
            define-property = {
              descriptor = "^2.0.2";
              pin = "2.0.2";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            extglob = {
              descriptor = "^2.0.4";
              pin = "2.0.4";
              runtime = true;
            };
            fragment-cache = {
              descriptor = "^0.2.1";
              pin = "0.2.1";
              runtime = true;
            };
            kind-of = {
              descriptor = "^6.0.2";
              pin = "6.0.3";
              runtime = true;
            };
            nanomatch = {
              descriptor = "^1.2.9";
              pin = "1.2.13";
              runtime = true;
            };
            "object.pick" = {
              descriptor = "^1.3.0";
              pin = "1.3.0";
              runtime = true;
            };
            regex-not = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            snapdragon = {
              descriptor = "^0.8.1";
              pin = "0.8.2";
              runtime = true;
            };
            to-regex = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-y6LLvAmfdQdl2o5igr9j+7I51wo0BXDiA4+f7R9I8mI=";
            type = "tarball";
            url = "https://registry.npmjs.org/micromatch/-/micromatch-3.1.10.tgz";
          };
          ident = "micromatch";
          ltype = "file";
          version = "3.1.10";
        };
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
            url = "https://registry.npmjs.org/micromatch/-/micromatch-4.0.5.tgz";
          };
          ident = "micromatch";
          ltype = "file";
          version = "4.0.5";
        };
      };
      mime-db = {
        "1.52.0" = {
          fetchInfo = {
            narHash = "sha256-NWkhw5USnQpCVdzynhDEG/VbDLOdjy0JtGgopd89jr8=";
            type = "tarball";
            url = "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz";
          };
          ident = "mime-db";
          ltype = "file";
          treeInfo = { };
          version = "1.52.0";
        };
      };
      mime-types = {
        "2.1.35" = {
          depInfo = {
            mime-db = {
              descriptor = "1.52.0";
              pin = "1.52.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-OT0LH+QO5JfJrh7X0Lzsv3l/WurbpxPx/nztSX7DeI8=";
            type = "tarball";
            url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz";
          };
          ident = "mime-types";
          ltype = "file";
          version = "2.1.35";
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
          version = "3.1.2";
        };
      };
      minimist = {
        "1.2.7" = {
          fetchInfo = {
            narHash = "sha256-Jo/bc6MFNhtfsnF2bEhRiZzEt/Ex+4paLZ7I4AHdge4=";
            type = "tarball";
            url = "https://registry.npmjs.org/minimist/-/minimist-1.2.7.tgz";
          };
          ident = "minimist";
          ltype = "file";
          treeInfo = { };
          version = "1.2.7";
        };
      };
      mixin-deep = {
        "1.3.2" = {
          depInfo = {
            for-in = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            is-extendable = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-4W9tjfQeDAi7WVHHA+KjtCONEzgQdB7JvCTQ+6qGKLM=";
            type = "tarball";
            url = "https://registry.npmjs.org/mixin-deep/-/mixin-deep-1.3.2.tgz";
          };
          ident = "mixin-deep";
          ltype = "file";
          version = "1.3.2";
        };
      };
      ms = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-ckqf9NvfRsodceQ75B5in2o5NmsmCNQn8Rqt2SrDs2o=";
            type = "tarball";
            url = "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz";
          };
          ident = "ms";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
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
      nanomatch = {
        "1.2.13" = {
          depInfo = {
            arr-diff = {
              descriptor = "^4.0.0";
              pin = "4.0.0";
              runtime = true;
            };
            array-unique = {
              descriptor = "^0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            define-property = {
              descriptor = "^2.0.2";
              pin = "2.0.2";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            fragment-cache = {
              descriptor = "^0.2.1";
              pin = "0.2.1";
              runtime = true;
            };
            is-windows = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            kind-of = {
              descriptor = "^6.0.2";
              pin = "6.0.3";
              runtime = true;
            };
            "object.pick" = {
              descriptor = "^1.3.0";
              pin = "1.3.0";
              runtime = true;
            };
            regex-not = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            snapdragon = {
              descriptor = "^0.8.1";
              pin = "0.8.2";
              runtime = true;
            };
            to-regex = {
              descriptor = "^3.0.1";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Fm9tifAK1BLj/wk5ybJLuEd7VZGnfYe6pakz/cmzxoo=";
            type = "tarball";
            url = "https://registry.npmjs.org/nanomatch/-/nanomatch-1.2.13.tgz";
          };
          ident = "nanomatch";
          ltype = "file";
          version = "1.2.13";
        };
      };
      natural-compare = {
        "1.4.0" = {
          fetchInfo = {
            narHash = "sha256-wx+m763bR0Auq7WpVJREb2xXTIHcZMYL9T/G+Y0FQlY=";
            type = "tarball";
            url = "https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz";
          };
          ident = "natural-compare";
          ltype = "file";
          treeInfo = { };
          version = "1.4.0";
        };
      };
      nice-try = {
        "1.0.5" = {
          fetchInfo = {
            narHash = "sha256-ehIIY7sON7g9oA3R5y9u4gYe1Yc2j1iWu2zGUX52Scw=";
            type = "tarball";
            url = "https://registry.npmjs.org/nice-try/-/nice-try-1.0.5.tgz";
          };
          ident = "nice-try";
          ltype = "file";
          treeInfo = { };
          version = "1.0.5";
        };
      };
      node-int64 = {
        "0.4.0" = {
          fetchInfo = {
            narHash = "sha256-BOd48Uc57GvkSlqGJR5ZPMr5oGEdY6CKsrrLVTIjcvY=";
            type = "tarball";
            url = "https://registry.npmjs.org/node-int64/-/node-int64-0.4.0.tgz";
          };
          ident = "node-int64";
          ltype = "file";
          treeInfo = { };
          version = "0.4.0";
        };
      };
      node-releases = {
        "2.0.10" = {
          fetchInfo = {
            narHash = "sha256-afWYTKovBDrgUwqbf+Dsb2V7yJosUnZ3TT1leT8QiKQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/node-releases/-/node-releases-2.0.10.tgz";
          };
          ident = "node-releases";
          ltype = "file";
          treeInfo = { };
          version = "2.0.10";
        };
      };
      normalize-package-data = {
        "2.5.0" = {
          depInfo = {
            hosted-git-info = {
              descriptor = "^2.1.4";
              pin = "2.8.9";
              runtime = true;
            };
            resolve = {
              descriptor = "^1.10.0";
              pin = "1.22.1";
              runtime = true;
            };
            semver = {
              descriptor = "2 || 3 || 4 || 5";
              pin = "5.7.1";
              runtime = true;
            };
            validate-npm-package-license = {
              descriptor = "^3.0.1";
              pin = "3.0.4";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-vmwiVyssS4LAkAaAzXXspLQRE/dcExYdwi94A04y67Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/normalize-package-data/-/normalize-package-data-2.5.0.tgz";
          };
          ident = "normalize-package-data";
          ltype = "file";
          version = "2.5.0";
        };
      };
      normalize-path = {
        "2.1.1" = {
          depInfo = {
            remove-trailing-separator = {
              descriptor = "^1.0.1";
              pin = "1.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-wl0/FEr7f0yj9t4jL8rm5776PnX+07h62pwD3UqFVwc=";
            type = "tarball";
            url = "https://registry.npmjs.org/normalize-path/-/normalize-path-2.1.1.tgz";
          };
          ident = "normalize-path";
          ltype = "file";
          version = "2.1.1";
        };
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-dEESYAs01W+lUXWyDzFkbIwz/dIe85OeDKy23RRoa6E=";
            type = "tarball";
            url = "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz";
          };
          ident = "normalize-path";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      npm-run-path = {
        "2.0.2" = {
          depInfo = {
            path-key = {
              descriptor = "^2.0.0";
              pin = "2.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kq2nzzmFerndZTC2N44/oC0STWS8DesTGq/d84RJgGQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/npm-run-path/-/npm-run-path-2.0.2.tgz";
          };
          ident = "npm-run-path";
          ltype = "file";
          version = "2.0.2";
        };
      };
      nwsapi = {
        "2.2.2" = {
          fetchInfo = {
            narHash = "sha256-M+NFrv557aOmVCsKKpU8LSrY9b4K9W7SMQy7YsGytN0=";
            type = "tarball";
            url = "https://registry.npmjs.org/nwsapi/-/nwsapi-2.2.2.tgz";
          };
          ident = "nwsapi";
          ltype = "file";
          treeInfo = { };
          version = "2.2.2";
        };
      };
      oauth-sign = {
        "0.9.0" = {
          fetchInfo = {
            narHash = "sha256-zV2PDn3Hb7/j5Y5A3X5ktufZ1YCE22PlYgYgyGENdiU=";
            type = "tarball";
            url = "https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.9.0.tgz";
          };
          ident = "oauth-sign";
          ltype = "file";
          treeInfo = { };
          version = "0.9.0";
        };
      };
      object-copy = {
        "0.1.0" = {
          depInfo = {
            copy-descriptor = {
              descriptor = "^0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
            define-property = {
              descriptor = "^0.2.5";
              pin = "0.2.5";
              runtime = true;
            };
            kind-of = {
              descriptor = "^3.0.3";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-dfOahErblnMXMQM9t3ybI5VspkmypPRTcHIZf3CNKJs=";
            type = "tarball";
            url = "https://registry.npmjs.org/object-copy/-/object-copy-0.1.0.tgz";
          };
          ident = "object-copy";
          ltype = "file";
          version = "0.1.0";
        };
      };
      object-visit = {
        "1.0.1" = {
          depInfo = {
            isobject = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-APB9ukn/028SoYl8nsw3rKQsCNt0g5axQLNyhqIZsi4=";
            type = "tarball";
            url = "https://registry.npmjs.org/object-visit/-/object-visit-1.0.1.tgz";
          };
          ident = "object-visit";
          ltype = "file";
          version = "1.0.1";
        };
      };
      "object.pick" = {
        "1.3.0" = {
          depInfo = {
            isobject = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kUJOzwlq3cYiBAdSuy9kOyN5hj6hZ4zJKEGuNkYB2OU=";
            type = "tarball";
            url = "https://registry.npmjs.org/object.pick/-/object.pick-1.3.0.tgz";
          };
          ident = "object.pick";
          ltype = "file";
          version = "1.3.0";
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
          version = "1.4.0";
        };
      };
      optionator = {
        "0.8.3" = {
          depInfo = {
            deep-is = {
              descriptor = "~0.1.3";
              pin = "0.1.4";
              runtime = true;
            };
            fast-levenshtein = {
              descriptor = "~2.0.6";
              pin = "2.0.6";
              runtime = true;
            };
            levn = {
              descriptor = "~0.3.0";
              pin = "0.3.0";
              runtime = true;
            };
            prelude-ls = {
              descriptor = "~1.1.2";
              pin = "1.1.2";
              runtime = true;
            };
            type-check = {
              descriptor = "~0.3.2";
              pin = "0.3.2";
              runtime = true;
            };
            word-wrap = {
              descriptor = "~1.2.3";
              pin = "1.2.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-xJUpz6mgwDvkXNp7M9deqI054eFuX5IFv5sdalYplv8=";
            type = "tarball";
            url = "https://registry.npmjs.org/optionator/-/optionator-0.8.3.tgz";
          };
          ident = "optionator";
          ltype = "file";
          version = "0.8.3";
        };
      };
      p-finally = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-D02zpl/m5lkO94Yc1X+Z4dCFDrS2MqX8FzaGdPx5Z/8=";
            type = "tarball";
            url = "https://registry.npmjs.org/p-finally/-/p-finally-1.0.0.tgz";
          };
          ident = "p-finally";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
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
          version = "2.3.0";
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
            url = "https://registry.npmjs.org/parse-json/-/parse-json-5.2.0.tgz";
          };
          ident = "parse-json";
          ltype = "file";
          version = "5.2.0";
        };
      };
      parse5 = {
        "5.1.0" = {
          fetchInfo = {
            narHash = "sha256-hKkhJ7J1RM794IOlOnJnsZdcwZIoN+Bn8X5Hwxbl8ic=";
            type = "tarball";
            url = "https://registry.npmjs.org/parse5/-/parse5-5.1.0.tgz";
          };
          ident = "parse5";
          ltype = "file";
          treeInfo = { };
          version = "5.1.0";
        };
      };
      pascalcase = {
        "0.1.1" = {
          fetchInfo = {
            narHash = "sha256-xiAg1FPkRdimwBbHZymSSXEIphyAuQ1VrYlB0jxGhR4=";
            type = "tarball";
            url = "https://registry.npmjs.org/pascalcase/-/pascalcase-0.1.1.tgz";
          };
          ident = "pascalcase";
          ltype = "file";
          treeInfo = { };
          version = "0.1.1";
        };
      };
      path-exists = {
        "4.0.0" = {
          fetchInfo = {
            narHash = "sha256-QmsShSY8p68eX9bNeinv/8VO0/+P2c+Rv82mtPqtpjE=";
            type = "tarball";
            url = "https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz";
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
            url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
          };
          ident = "path-is-absolute";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      path-key = {
        "2.0.1" = {
          fetchInfo = {
            narHash = "sha256-qlTdXNo2yA39F7dzU54FRMJfPTySmMRnLg+1/zsW34Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/path-key/-/path-key-2.0.1.tgz";
          };
          ident = "path-key";
          ltype = "file";
          treeInfo = { };
          version = "2.0.1";
        };
      };
      path-parse = {
        "1.0.7" = {
          fetchInfo = {
            narHash = "sha256-IO0Y8yjZA6xJ63eLG/nFzWTGjI5tREyNKttz4DXoKYo=";
            type = "tarball";
            url = "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz";
          };
          ident = "path-parse";
          ltype = "file";
          treeInfo = { };
          version = "1.0.7";
        };
      };
      performance-now = {
        "2.1.0" = {
          fetchInfo = {
            narHash = "sha256-tICVOSCZgz6ifmkxNX7iBjq4srdbO3fYlCEedF5yvCc=";
            type = "tarball";
            url = "https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz";
          };
          ident = "performance-now";
          ltype = "file";
          treeInfo = { };
          version = "2.1.0";
        };
      };
      picocolors = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-zo0dDKQASSCpixflPOwG61jzA9IqjZMBN8dwojRu+l8=";
            type = "tarball";
            url = "https://registry.npmjs.org/picocolors/-/picocolors-1.0.0.tgz";
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
      pn = {
        "1.1.0" = {
          fetchInfo = {
            narHash = "sha256-9qGLykJnebFEEDZGHWDuI96mLas4L7A5dWDZ+ZA0JZc=";
            type = "tarball";
            url = "https://registry.npmjs.org/pn/-/pn-1.1.0.tgz";
          };
          ident = "pn";
          ltype = "file";
          treeInfo = { };
          version = "1.1.0";
        };
      };
      posix-character-classes = {
        "0.1.1" = {
          fetchInfo = {
            narHash = "sha256-B4KHjxOQ8k7uG6vcvgZq+RUpC20JWJPCcyfBXMly374=";
            type = "tarball";
            url = "https://registry.npmjs.org/posix-character-classes/-/posix-character-classes-0.1.1.tgz";
          };
          ident = "posix-character-classes";
          ltype = "file";
          treeInfo = { };
          version = "0.1.1";
        };
      };
      prelude-ls = {
        "1.1.2" = {
          fetchInfo = {
            narHash = "sha256-gMNYDzse9LGVfvNvpTLIqU/4IGG3nt8/i7jVyl4u+mc=";
            type = "tarball";
            url = "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.1.2.tgz";
          };
          ident = "prelude-ls";
          ltype = "file";
          treeInfo = { };
          version = "1.1.2";
        };
      };
      pretty-format = {
        "25.5.0" = {
          depInfo = {
            "@jest/types" = {
              descriptor = "^25.5.0";
              pin = "25.5.0";
              runtime = true;
            };
            ansi-regex = {
              descriptor = "^5.0.0";
              pin = "5.0.1";
              runtime = true;
            };
            ansi-styles = {
              descriptor = "^4.0.0";
              pin = "4.3.0";
              runtime = true;
            };
            react-is = {
              descriptor = "^16.12.0";
              pin = "16.13.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-x2oalKZOFaAIA1jNHTPCv8vUonKUjGazp0itscPGSCo=";
            type = "tarball";
            url = "https://registry.npmjs.org/pretty-format/-/pretty-format-25.5.0.tgz";
          };
          ident = "pretty-format";
          ltype = "file";
          version = "25.5.0";
        };
      };
      psl = {
        "1.9.0" = {
          fetchInfo = {
            narHash = "sha256-SQEgNmCnR3qw1cvFd2eKgrB1uGfKBWnX0t6hagMtNb8=";
            type = "tarball";
            url = "https://registry.npmjs.org/psl/-/psl-1.9.0.tgz";
          };
          ident = "psl";
          ltype = "file";
          treeInfo = { };
          version = "1.9.0";
        };
      };
      pump = {
        "3.0.0" = {
          depInfo = {
            end-of-stream = {
              descriptor = "^1.1.0";
              pin = "1.4.4";
              runtime = true;
            };
            once = {
              descriptor = "^1.3.1";
              pin = "1.4.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-a+tDrPKxD94V7wzJP9H+JSjQ/EmCpDftL+YDgGW/Nnc=";
            type = "tarball";
            url = "https://registry.npmjs.org/pump/-/pump-3.0.0.tgz";
          };
          ident = "pump";
          ltype = "file";
          version = "3.0.0";
        };
      };
      punycode = {
        "2.3.0" = {
          fetchInfo = {
            narHash = "sha256-KVHAdIKAV7xPRhb1ae9NZ0dwfOVMPUHK/TA4qAx9o48=";
            type = "tarball";
            url = "https://registry.npmjs.org/punycode/-/punycode-2.3.0.tgz";
          };
          ident = "punycode";
          ltype = "file";
          treeInfo = { };
          version = "2.3.0";
        };
      };
      qs = {
        "6.5.3" = {
          fetchInfo = {
            narHash = "sha256-E063+Rl+vG/lDIdthV/5lV1q1wfnP5a6VW89uLo7u68=";
            type = "tarball";
            url = "https://registry.npmjs.org/qs/-/qs-6.5.3.tgz";
          };
          ident = "qs";
          ltype = "file";
          treeInfo = { };
          version = "6.5.3";
        };
      };
      react-is = {
        "16.13.1" = {
          fetchInfo = {
            narHash = "sha256-84sHi9+fCX1q22phJuI2fsbjQQXoHXeAQTa3jmKsw/U=";
            type = "tarball";
            url = "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz";
          };
          ident = "react-is";
          ltype = "file";
          treeInfo = { };
          version = "16.13.1";
        };
      };
      read-pkg = {
        "5.2.0" = {
          depInfo = {
            "@types/normalize-package-data" = {
              descriptor = "^2.4.0";
              pin = "2.4.1";
              runtime = true;
            };
            normalize-package-data = {
              descriptor = "^2.5.0";
              pin = "2.5.0";
              runtime = true;
            };
            parse-json = {
              descriptor = "^5.0.0";
              pin = "5.2.0";
              runtime = true;
            };
            type-fest = {
              descriptor = "^0.6.0";
              pin = "0.6.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ULr/XZF/7XQT3HZiBeSYf6aTRfCIpAFbIshCbiIDuqQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/read-pkg/-/read-pkg-5.2.0.tgz";
          };
          ident = "read-pkg";
          ltype = "file";
          version = "5.2.0";
        };
      };
      read-pkg-up = {
        "7.0.1" = {
          depInfo = {
            find-up = {
              descriptor = "^4.1.0";
              pin = "4.1.0";
              runtime = true;
            };
            read-pkg = {
              descriptor = "^5.2.0";
              pin = "5.2.0";
              runtime = true;
            };
            type-fest = {
              descriptor = "^0.8.1";
              pin = "0.8.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-tjendQI+WJr/MX/s3DvIoDYAVOVmCmOJiZzqAhF2Zzk=";
            type = "tarball";
            url = "https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-7.0.1.tgz";
          };
          ident = "read-pkg-up";
          ltype = "file";
          version = "7.0.1";
        };
      };
      realpath-native = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-OQ9gnzkW1K+Vc9usFhPNZKAkKPuwk0WVjxtVk7ZxUNQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/realpath-native/-/realpath-native-2.0.0.tgz";
          };
          ident = "realpath-native";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      regex-not = {
        "1.0.2" = {
          depInfo = {
            extend-shallow = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            safe-regex = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LJ0gWH8ahtekThD2NzrbUL2DhncHUxaqzWpLXMF4V9w=";
            type = "tarball";
            url = "https://registry.npmjs.org/regex-not/-/regex-not-1.0.2.tgz";
          };
          ident = "regex-not";
          ltype = "file";
          version = "1.0.2";
        };
      };
      remove-trailing-separator = {
        "1.1.0" = {
          fetchInfo = {
            narHash = "sha256-DMnJQzWe8ROQmbWgydEfUoG9UmmHrGY3bABGAw3DP74=";
            type = "tarball";
            url = "https://registry.npmjs.org/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz";
          };
          ident = "remove-trailing-separator";
          ltype = "file";
          treeInfo = { };
          version = "1.1.0";
        };
      };
      repeat-element = {
        "1.1.4" = {
          fetchInfo = {
            narHash = "sha256-mgyECYvfekBX5EXK4bsTd1LhSzak+SXqbLvmQ6VFrjs=";
            type = "tarball";
            url = "https://registry.npmjs.org/repeat-element/-/repeat-element-1.1.4.tgz";
          };
          ident = "repeat-element";
          ltype = "file";
          treeInfo = { };
          version = "1.1.4";
        };
      };
      repeat-string = {
        "1.6.1" = {
          fetchInfo = {
            narHash = "sha256-5xjHXPheX5RO8QkgMlPGomOe/YZ3kf6fmiVyZywsox4=";
            type = "tarball";
            url = "https://registry.npmjs.org/repeat-string/-/repeat-string-1.6.1.tgz";
          };
          ident = "repeat-string";
          ltype = "file";
          treeInfo = { };
          version = "1.6.1";
        };
      };
      request = {
        "2.88.2" = {
          depInfo = {
            aws-sign2 = {
              descriptor = "~0.7.0";
              pin = "0.7.0";
              runtime = true;
            };
            aws4 = {
              descriptor = "^1.8.0";
              pin = "1.12.0";
              runtime = true;
            };
            caseless = {
              descriptor = "~0.12.0";
              pin = "0.12.0";
              runtime = true;
            };
            combined-stream = {
              descriptor = "~1.0.6";
              pin = "1.0.8";
              runtime = true;
            };
            extend = {
              descriptor = "~3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            forever-agent = {
              descriptor = "~0.6.1";
              pin = "0.6.1";
              runtime = true;
            };
            form-data = {
              descriptor = "~2.3.2";
              pin = "2.3.3";
              runtime = true;
            };
            har-validator = {
              descriptor = "~5.1.3";
              pin = "5.1.5";
              runtime = true;
            };
            http-signature = {
              descriptor = "~1.2.0";
              pin = "1.2.0";
              runtime = true;
            };
            is-typedarray = {
              descriptor = "~1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            isstream = {
              descriptor = "~0.1.2";
              pin = "0.1.2";
              runtime = true;
            };
            json-stringify-safe = {
              descriptor = "~5.0.1";
              pin = "5.0.1";
              runtime = true;
            };
            mime-types = {
              descriptor = "~2.1.19";
              pin = "2.1.35";
              runtime = true;
            };
            oauth-sign = {
              descriptor = "~0.9.0";
              pin = "0.9.0";
              runtime = true;
            };
            performance-now = {
              descriptor = "^2.1.0";
              pin = "2.1.0";
              runtime = true;
            };
            qs = {
              descriptor = "~6.5.2";
              pin = "6.5.3";
              runtime = true;
            };
            safe-buffer = {
              descriptor = "^5.1.2";
              pin = "5.2.1";
              runtime = true;
            };
            tough-cookie = {
              descriptor = "~2.5.0";
              pin = "2.5.0";
              runtime = true;
            };
            tunnel-agent = {
              descriptor = "^0.6.0";
              pin = "0.6.0";
              runtime = true;
            };
            uuid = {
              descriptor = "^3.3.2";
              pin = "3.4.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HQ1msBLejlVbgYfveJeW08/ycYVk+SAaaFdMNP6bom0=";
            type = "tarball";
            url = "https://registry.npmjs.org/request/-/request-2.88.2.tgz";
          };
          ident = "request";
          ltype = "file";
          version = "2.88.2";
        };
      };
      request-promise-core = {
        "1.1.4" = {
          depInfo = {
            lodash = {
              descriptor = "^4.17.19";
              pin = "4.17.21";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fdjYWh8V/Msy1y1G+eHIP9Er+G1YD6+gQPPiUlqojVY=";
            type = "tarball";
            url = "https://registry.npmjs.org/request-promise-core/-/request-promise-core-1.1.4.tgz";
          };
          ident = "request-promise-core";
          ltype = "file";
          peerInfo = {
            request = {
              descriptor = "^2.34";
            };
          };
          version = "1.1.4";
        };
      };
      request-promise-native = {
        "1.0.9" = {
          depInfo = {
            request-promise-core = {
              descriptor = "1.1.4";
              pin = "1.1.4";
              runtime = true;
            };
            stealthy-require = {
              descriptor = "^1.1.1";
              pin = "1.1.1";
              runtime = true;
            };
            tough-cookie = {
              descriptor = "^2.3.3";
              pin = "2.5.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-sc55wU0Pxge2ssvSfrovNYjbv0GcLINbJwSlZeW6beY=";
            type = "tarball";
            url = "https://registry.npmjs.org/request-promise-native/-/request-promise-native-1.0.9.tgz";
          };
          ident = "request-promise-native";
          ltype = "file";
          peerInfo = {
            request = {
              descriptor = "^2.34";
            };
          };
          version = "1.0.9";
        };
      };
      require-directory = {
        "2.1.1" = {
          fetchInfo = {
            narHash = "sha256-nAP28KKDIP7JZZfCTBI0EHdJcuAa6hsYOVfXNdVn7xY=";
            type = "tarball";
            url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
          };
          ident = "require-directory";
          ltype = "file";
          treeInfo = { };
          version = "2.1.1";
        };
      };
      require-main-filename = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-2EZHCet7qdP+VTpnaOqH2l1ZShdryUPW9TLLap0QKZQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/require-main-filename/-/require-main-filename-2.0.0.tgz";
          };
          ident = "require-main-filename";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      resolve = {
        "1.1.7" = {
          fetchInfo = {
            narHash = "sha256-5J8d6cHMsfeelVbz5y/C9DNipbH3iKB+o1bmsHm87yQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/resolve/-/resolve-1.1.7.tgz";
          };
          ident = "resolve";
          ltype = "file";
          treeInfo = { };
          version = "1.1.7";
        };
        "1.22.1" = {
          binInfo = {
            binPairs = {
              resolve = "bin/resolve";
            };
          };
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
          version = "1.22.1";
        };
      };
      resolve-from = {
        "5.0.0" = {
          fetchInfo = {
            narHash = "sha256-bab+/K+W0XuYFqBwFe2syabeEX2GjtK2SdfQmN6NiVI=";
            type = "tarball";
            url = "https://registry.npmjs.org/resolve-from/-/resolve-from-5.0.0.tgz";
          };
          ident = "resolve-from";
          ltype = "file";
          treeInfo = { };
          version = "5.0.0";
        };
      };
      resolve-url = {
        "0.2.1" = {
          fetchInfo = {
            narHash = "sha256-F+gGcLKHfem29q8jpnHqjck7P06p35U0zkSVtcgsDcE=";
            type = "tarball";
            url = "https://registry.npmjs.org/resolve-url/-/resolve-url-0.2.1.tgz";
          };
          ident = "resolve-url";
          ltype = "file";
          treeInfo = { };
          version = "0.2.1";
        };
      };
      ret = {
        "0.1.15" = {
          fetchInfo = {
            narHash = "sha256-oST3RGiIW/0q5TRS2IZ+AT+WmGiaGYaxL2SaRlUKy8k=";
            type = "tarball";
            url = "https://registry.npmjs.org/ret/-/ret-0.1.15.tgz";
          };
          ident = "ret";
          ltype = "file";
          treeInfo = { };
          version = "0.1.15";
        };
      };
      rsvp = {
        "4.8.5" = {
          fetchInfo = {
            narHash = "sha256-N50gJVwo3xSAai4n3qyyVu+M7vvkWT18tHyuifoh9Iw=";
            type = "tarball";
            url = "https://registry.npmjs.org/rsvp/-/rsvp-4.8.5.tgz";
          };
          ident = "rsvp";
          ltype = "file";
          treeInfo = { };
          version = "4.8.5";
        };
      };
      safe-buffer = {
        "5.2.1" = {
          fetchInfo = {
            narHash = "sha256-wXBrp88QpZPUzawZ33OaWsjCtWTVMsflFJRBg2/U4y8=";
            type = "tarball";
            url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz";
          };
          ident = "safe-buffer";
          ltype = "file";
          treeInfo = { };
          version = "5.2.1";
        };
      };
      safe-regex = {
        "1.1.0" = {
          depInfo = {
            ret = {
              descriptor = "~0.1.10";
              pin = "0.1.15";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-nt7Bqq7UDmOKUA5IGmt7QlFKDCQ9CBc28wvtx8CNMTM=";
            type = "tarball";
            url = "https://registry.npmjs.org/safe-regex/-/safe-regex-1.1.0.tgz";
          };
          ident = "safe-regex";
          ltype = "file";
          version = "1.1.0";
        };
      };
      safer-buffer = {
        "2.1.2" = {
          fetchInfo = {
            narHash = "sha256-3h6PTqFTKFv3m2ETKDUSOB1rI9KcqogKnSfrV1qnJc0=";
            type = "tarball";
            url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
          };
          ident = "safer-buffer";
          ltype = "file";
          treeInfo = { };
          version = "2.1.2";
        };
      };
      sane = {
        "4.1.0" = {
          binInfo = {
            binPairs = {
              sane = "src/cli.js";
            };
          };
          depInfo = {
            "@cnakazawa/watch" = {
              descriptor = "^1.0.3";
              pin = "1.0.4";
              runtime = true;
            };
            anymatch = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            capture-exit = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            exec-sh = {
              descriptor = "^0.3.2";
              pin = "0.3.6";
              runtime = true;
            };
            execa = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            fb-watchman = {
              descriptor = "^2.0.0";
              pin = "2.0.2";
              runtime = true;
            };
            micromatch = {
              descriptor = "^3.1.4";
              pin = "3.1.10";
              runtime = true;
            };
            minimist = {
              descriptor = "^1.1.1";
              pin = "1.2.7";
              runtime = true;
            };
            walker = {
              descriptor = "~1.0.5";
              pin = "1.0.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Iu9qtZpKp54zuMCYwLNVcctxhbLkGdiaytROPSgfA/4=";
            type = "tarball";
            url = "https://registry.npmjs.org/sane/-/sane-4.1.0.tgz";
          };
          ident = "sane";
          ltype = "file";
          version = "4.1.0";
        };
      };
      saxes = {
        "3.1.11" = {
          depInfo = {
            xmlchars = {
              descriptor = "^2.1.1";
              pin = "2.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-G6G4UFZUVCENtMWNlMqw6z1t0qVjbDnAYizMR+EweeI=";
            type = "tarball";
            url = "https://registry.npmjs.org/saxes/-/saxes-3.1.11.tgz";
          };
          ident = "saxes";
          ltype = "file";
          version = "3.1.11";
        };
      };
      semver = {
        "5.7.1" = {
          binInfo = {
            binPairs = {
              semver = "bin/semver";
            };
          };
          fetchInfo = {
            narHash = "sha256-2Qe9h/dJNkVsFoYVnJzBCzE161lkdSrM+zqGXEUAu1Q=";
            type = "tarball";
            url = "https://registry.npmjs.org/semver/-/semver-5.7.1.tgz";
          };
          ident = "semver";
          ltype = "file";
          treeInfo = { };
          version = "5.7.1";
        };
        "6.3.0" = {
          binInfo = {
            binPairs = {
              semver = "bin/semver.js";
            };
          };
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
      };
      set-blocking = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-v/iCe60xEPwDGC6+iEAS+xvV8ilPSlIyUSmLMfS2bwQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz";
          };
          ident = "set-blocking";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      set-value = {
        "2.0.1" = {
          depInfo = {
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            is-extendable = {
              descriptor = "^0.1.1";
              pin = "0.1.1";
              runtime = true;
            };
            is-plain-object = {
              descriptor = "^2.0.3";
              pin = "2.0.4";
              runtime = true;
            };
            split-string = {
              descriptor = "^3.0.1";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-2EtoEuiiBzkVWZUl4Z9BcfyMagim5T5zN3dKAzgcynk=";
            type = "tarball";
            url = "https://registry.npmjs.org/set-value/-/set-value-2.0.1.tgz";
          };
          ident = "set-value";
          ltype = "file";
          version = "2.0.1";
        };
      };
      shebang-command = {
        "1.2.0" = {
          depInfo = {
            shebang-regex = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-fAUuWYNBpJ4/lr0AyGLCCNkcFbBcNpBgMHZ6aty9xJA=";
            type = "tarball";
            url = "https://registry.npmjs.org/shebang-command/-/shebang-command-1.2.0.tgz";
          };
          ident = "shebang-command";
          ltype = "file";
          version = "1.2.0";
        };
      };
      shebang-regex = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-6gRPvFDwPSfpQ2wtUfS21cCYupUunsrd8JwTQs2QyXU=";
            type = "tarball";
            url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-1.0.0.tgz";
          };
          ident = "shebang-regex";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      signal-exit = {
        "3.0.7" = {
          fetchInfo = {
            narHash = "sha256-2mSrADWJKHoX/YwLWk/Mdb4mjpL/6QYU8Evqtm24fdE=";
            type = "tarball";
            url = "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz";
          };
          ident = "signal-exit";
          ltype = "file";
          treeInfo = { };
          version = "3.0.7";
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
      snapdragon = {
        "0.8.2" = {
          depInfo = {
            base = {
              descriptor = "^0.11.1";
              pin = "0.11.2";
              runtime = true;
            };
            debug = {
              descriptor = "^2.2.0";
              pin = "2.6.9";
              runtime = true;
            };
            define-property = {
              descriptor = "^0.2.5";
              pin = "0.2.5";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
            map-cache = {
              descriptor = "^0.2.2";
              pin = "0.2.2";
              runtime = true;
            };
            source-map = {
              descriptor = "^0.5.6";
              pin = "0.5.7";
              runtime = true;
            };
            source-map-resolve = {
              descriptor = "^0.5.0";
              pin = "0.5.3";
              runtime = true;
            };
            use = {
              descriptor = "^3.1.0";
              pin = "3.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-g2gz7NO4ulmtz8LfFombvjvGjlFAj1rOhIUkF3n2hfU=";
            type = "tarball";
            url = "https://registry.npmjs.org/snapdragon/-/snapdragon-0.8.2.tgz";
          };
          ident = "snapdragon";
          ltype = "file";
          version = "0.8.2";
        };
      };
      snapdragon-node = {
        "2.1.1" = {
          depInfo = {
            define-property = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
            snapdragon-util = {
              descriptor = "^3.0.1";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-GnORY9fjpjIdmBCShGCmvSgXXTbUAAopDa8yzMhS4Hg=";
            type = "tarball";
            url = "https://registry.npmjs.org/snapdragon-node/-/snapdragon-node-2.1.1.tgz";
          };
          ident = "snapdragon-node";
          ltype = "file";
          version = "2.1.1";
        };
      };
      snapdragon-util = {
        "3.0.1" = {
          depInfo = {
            kind-of = {
              descriptor = "^3.2.0";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-o1KGS2sO7mQjZOzaUZ24TNUG+NzQLH9kAVBR8qNfcL4=";
            type = "tarball";
            url = "https://registry.npmjs.org/snapdragon-util/-/snapdragon-util-3.0.1.tgz";
          };
          ident = "snapdragon-util";
          ltype = "file";
          version = "3.0.1";
        };
      };
      source-map = {
        "0.5.7" = {
          fetchInfo = {
            narHash = "sha256-TfLkcoel84umresRhkiSAJkWIZ9bCfn9ZA9cZk8qGRU=";
            type = "tarball";
            url = "https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz";
          };
          ident = "source-map";
          ltype = "file";
          treeInfo = { };
          version = "0.5.7";
        };
        "0.6.1" = {
          fetchInfo = {
            narHash = "sha256-kOXyuKVrD3Fzez65GwPnNC615Ju17D00wsIgKcCWTJk=";
            type = "tarball";
            url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
          };
          ident = "source-map";
          ltype = "file";
          treeInfo = { };
          version = "0.6.1";
        };
      };
      source-map-resolve = {
        "0.5.3" = {
          depInfo = {
            atob = {
              descriptor = "^2.1.2";
              pin = "2.1.2";
              runtime = true;
            };
            decode-uri-component = {
              descriptor = "^0.2.0";
              pin = "0.2.2";
              runtime = true;
            };
            resolve-url = {
              descriptor = "^0.2.1";
              pin = "0.2.1";
              runtime = true;
            };
            source-map-url = {
              descriptor = "^0.4.0";
              pin = "0.4.1";
              runtime = true;
            };
            urix = {
              descriptor = "^0.1.0";
              pin = "0.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-GLKC5T82TX6zLZefQPy5ygeDbpBdhzpKEIEWKkX4KXc=";
            type = "tarball";
            url = "https://registry.npmjs.org/source-map-resolve/-/source-map-resolve-0.5.3.tgz";
          };
          ident = "source-map-resolve";
          ltype = "file";
          version = "0.5.3";
        };
      };
      source-map-support = {
        "0.5.21" = {
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
            narHash = "sha256-jq9veAxl7soqheG69ft6ac42qP61CrHG9kGOfaPGzmg=";
            type = "tarball";
            url = "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz";
          };
          ident = "source-map-support";
          ltype = "file";
          version = "0.5.21";
        };
      };
      source-map-url = {
        "0.4.1" = {
          fetchInfo = {
            narHash = "sha256-ywOkZ1jlfttkWOXsB6SDfuhki+9q2Uwjd9+zvxx948o=";
            type = "tarball";
            url = "https://registry.npmjs.org/source-map-url/-/source-map-url-0.4.1.tgz";
          };
          ident = "source-map-url";
          ltype = "file";
          treeInfo = { };
          version = "0.4.1";
        };
      };
      spdx-correct = {
        "3.1.1" = {
          depInfo = {
            spdx-expression-parse = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
            spdx-license-ids = {
              descriptor = "^3.0.0";
              pin = "3.0.12";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LRoJS+j5IDHTdE7dudfp5OB6pzaztCGOpJnlR5UzShI=";
            type = "tarball";
            url = "https://registry.npmjs.org/spdx-correct/-/spdx-correct-3.1.1.tgz";
          };
          ident = "spdx-correct";
          ltype = "file";
          version = "3.1.1";
        };
      };
      spdx-exceptions = {
        "2.3.0" = {
          fetchInfo = {
            narHash = "sha256-8oTcNAH2o2kY7XueSX1ZqvtWoUEntJ1X9aqg4Po1uXY=";
            type = "tarball";
            url = "https://registry.npmjs.org/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz";
          };
          ident = "spdx-exceptions";
          ltype = "file";
          treeInfo = { };
          version = "2.3.0";
        };
      };
      spdx-expression-parse = {
        "3.0.1" = {
          depInfo = {
            spdx-exceptions = {
              descriptor = "^2.1.0";
              pin = "2.3.0";
              runtime = true;
            };
            spdx-license-ids = {
              descriptor = "^3.0.0";
              pin = "3.0.12";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-LCMRuYaQjyV+uyE5y4d4HaBpVpGuyU9x7jQwRoJB/QU=";
            type = "tarball";
            url = "https://registry.npmjs.org/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz";
          };
          ident = "spdx-expression-parse";
          ltype = "file";
          version = "3.0.1";
        };
      };
      spdx-license-ids = {
        "3.0.12" = {
          fetchInfo = {
            narHash = "sha256-lmmikT/gYSLHSJruZI9Ljr5XT7pglk6rh6cx/Hq/BCc=";
            type = "tarball";
            url = "https://registry.npmjs.org/spdx-license-ids/-/spdx-license-ids-3.0.12.tgz";
          };
          ident = "spdx-license-ids";
          ltype = "file";
          treeInfo = { };
          version = "3.0.12";
        };
      };
      split-string = {
        "3.1.0" = {
          depInfo = {
            extend-shallow = {
              descriptor = "^3.0.0";
              pin = "3.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-xL67GqCh5RFfudE5SQQPrAApqLTTrz55BxjxO7weoa4=";
            type = "tarball";
            url = "https://registry.npmjs.org/split-string/-/split-string-3.1.0.tgz";
          };
          ident = "split-string";
          ltype = "file";
          version = "3.1.0";
        };
      };
      sprintf-js = {
        "1.0.3" = {
          fetchInfo = {
            narHash = "sha256-uUKz9y/hyOs58YEaXDOeVK7nhGxpTdNWE7IFSsdAtAc=";
            type = "tarball";
            url = "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
          };
          ident = "sprintf-js";
          ltype = "file";
          treeInfo = { };
          version = "1.0.3";
        };
      };
      sshpk = {
        "1.17.0" = {
          binInfo = {
            binPairs = {
              sshpk-conv = "bin/sshpk-conv";
              sshpk-sign = "bin/sshpk-sign";
              sshpk-verify = "bin/sshpk-verify";
            };
          };
          depInfo = {
            asn1 = {
              descriptor = "~0.2.3";
              pin = "0.2.6";
              runtime = true;
            };
            assert-plus = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            bcrypt-pbkdf = {
              descriptor = "^1.0.0";
              pin = "1.0.2";
              runtime = true;
            };
            dashdash = {
              descriptor = "^1.12.0";
              pin = "1.14.1";
              runtime = true;
            };
            ecc-jsbn = {
              descriptor = "~0.1.1";
              pin = "0.1.2";
              runtime = true;
            };
            getpass = {
              descriptor = "^0.1.1";
              pin = "0.1.7";
              runtime = true;
            };
            jsbn = {
              descriptor = "~0.1.0";
              pin = "0.1.1";
              runtime = true;
            };
            safer-buffer = {
              descriptor = "^2.0.2";
              pin = "2.1.2";
              runtime = true;
            };
            tweetnacl = {
              descriptor = "~0.14.0";
              pin = "0.14.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-gFpJ4Rgq5LjKGrV8SttqCqeUN6nUCZD6d7tabAcGMN4=";
            type = "tarball";
            url = "https://registry.npmjs.org/sshpk/-/sshpk-1.17.0.tgz";
          };
          ident = "sshpk";
          ltype = "file";
          version = "1.17.0";
        };
      };
      stack-utils = {
        "1.0.5" = {
          depInfo = {
            escape-string-regexp = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-V3YE+qelyYruoopZdkG6tQ9IUs/jiJAZtGrzyXIzeN0=";
            type = "tarball";
            url = "https://registry.npmjs.org/stack-utils/-/stack-utils-1.0.5.tgz";
          };
          ident = "stack-utils";
          ltype = "file";
          version = "1.0.5";
        };
      };
      static-extend = {
        "0.1.2" = {
          depInfo = {
            define-property = {
              descriptor = "^0.2.5";
              pin = "0.2.5";
              runtime = true;
            };
            object-copy = {
              descriptor = "^0.1.0";
              pin = "0.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HFObvYI9zkRtUKnWCwKUf4Il046r4mMiC/kDSz4rqmY=";
            type = "tarball";
            url = "https://registry.npmjs.org/static-extend/-/static-extend-0.1.2.tgz";
          };
          ident = "static-extend";
          ltype = "file";
          version = "0.1.2";
        };
      };
      stealthy-require = {
        "1.1.1" = {
          fetchInfo = {
            narHash = "sha256-o1XsPQo/0fbInLDEkQTR3zOjzJXhgmRqrJqvymLgUtw=";
            type = "tarball";
            url = "https://registry.npmjs.org/stealthy-require/-/stealthy-require-1.1.1.tgz";
          };
          ident = "stealthy-require";
          ltype = "file";
          treeInfo = { };
          version = "1.1.1";
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
            url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
          };
          ident = "string-width";
          ltype = "file";
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
            url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
          };
          ident = "strip-ansi";
          ltype = "file";
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
      strip-eof = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-51X887Z+Iq823bX9z63YhB2/rHFSZJjV7X/k8pCDLAQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/strip-eof/-/strip-eof-1.0.0.tgz";
          };
          ident = "strip-eof";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
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
            url = "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz";
          };
          ident = "supports-color";
          ltype = "file";
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
            url = "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz";
          };
          ident = "supports-color";
          ltype = "file";
          version = "7.2.0";
        };
      };
      supports-preserve-symlinks-flag = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-Gwf/IHn+m17+KsKxcOrhCxAjvH8uxQx8Bud+qeCNwKg=";
            type = "tarball";
            url = "https://registry.npmjs.org/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz";
          };
          ident = "supports-preserve-symlinks-flag";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      symbol-tree = {
        "3.2.4" = {
          fetchInfo = {
            narHash = "sha256-bnfA5/+ZeusXRxzRJhE+M9zgmeRbbaqex638kYPSad4=";
            type = "tarball";
            url = "https://registry.npmjs.org/symbol-tree/-/symbol-tree-3.2.4.tgz";
          };
          ident = "symbol-tree";
          ltype = "file";
          treeInfo = { };
          version = "3.2.4";
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
            url = "https://registry.npmjs.org/test-exclude/-/test-exclude-6.0.0.tgz";
          };
          ident = "test-exclude";
          ltype = "file";
          version = "6.0.0";
        };
      };
      throat = {
        "5.0.0" = {
          fetchInfo = {
            narHash = "sha256-RB5fZ/z0z4giyt0UNWvb8O0i20KbY0iEn3IbGbrAL0E=";
            type = "tarball";
            url = "https://registry.npmjs.org/throat/-/throat-5.0.0.tgz";
          };
          ident = "throat";
          ltype = "file";
          treeInfo = { };
          version = "5.0.0";
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
            url = "https://registry.npmjs.org/to-fast-properties/-/to-fast-properties-2.0.0.tgz";
          };
          ident = "to-fast-properties";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      to-object-path = {
        "0.3.0" = {
          depInfo = {
            kind-of = {
              descriptor = "^3.0.2";
              pin = "3.2.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-o2noaCWn5WWxMZRXVp1L2a1NUQ2QY6RJS5n+lAEMgjE=";
            type = "tarball";
            url = "https://registry.npmjs.org/to-object-path/-/to-object-path-0.3.0.tgz";
          };
          ident = "to-object-path";
          ltype = "file";
          version = "0.3.0";
        };
      };
      to-regex = {
        "3.0.2" = {
          depInfo = {
            define-property = {
              descriptor = "^2.0.2";
              pin = "2.0.2";
              runtime = true;
            };
            extend-shallow = {
              descriptor = "^3.0.2";
              pin = "3.0.2";
              runtime = true;
            };
            regex-not = {
              descriptor = "^1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            safe-regex = {
              descriptor = "^1.1.0";
              pin = "1.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-uPRe+lmezGzCJgbkGLVxtFcn+jXAQCisgJRUyJ8SQkM=";
            type = "tarball";
            url = "https://registry.npmjs.org/to-regex/-/to-regex-3.0.2.tgz";
          };
          ident = "to-regex";
          ltype = "file";
          version = "3.0.2";
        };
      };
      to-regex-range = {
        "2.1.1" = {
          depInfo = {
            is-number = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            repeat-string = {
              descriptor = "^1.6.1";
              pin = "1.6.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-azGXDJjRJQOGqXVizLJKXDsCUKxdaLJsQ/wO3hqAHxw=";
            type = "tarball";
            url = "https://registry.npmjs.org/to-regex-range/-/to-regex-range-2.1.1.tgz";
          };
          ident = "to-regex-range";
          ltype = "file";
          version = "2.1.1";
        };
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
            url = "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz";
          };
          ident = "to-regex-range";
          ltype = "file";
          version = "5.0.1";
        };
      };
      tough-cookie = {
        "2.5.0" = {
          depInfo = {
            psl = {
              descriptor = "^1.1.28";
              pin = "1.9.0";
              runtime = true;
            };
            punycode = {
              descriptor = "^2.1.1";
              pin = "2.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-g9P0Sn+A0G6gbhlGMVNu/B/FyG8zuyMhF5pf9uDcsSU=";
            type = "tarball";
            url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz";
          };
          ident = "tough-cookie";
          ltype = "file";
          version = "2.5.0";
        };
        "3.0.1" = {
          depInfo = {
            ip-regex = {
              descriptor = "^2.1.0";
              pin = "2.1.0";
              runtime = true;
            };
            psl = {
              descriptor = "^1.1.28";
              pin = "1.9.0";
              runtime = true;
            };
            punycode = {
              descriptor = "^2.1.1";
              pin = "2.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-+cdb5MdSWXFGhkEHe1MdHK1+HkoB1V5xuztEtE31PMQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-3.0.1.tgz";
          };
          ident = "tough-cookie";
          ltype = "file";
          version = "3.0.1";
        };
      };
      tr46 = {
        "1.0.1" = {
          depInfo = {
            punycode = {
              descriptor = "^2.1.0";
              pin = "2.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Ar3U3Qjx+bmtyHig3CKOb1uL6iUV7w2QuNI4XzkMhqY=";
            type = "tarball";
            url = "https://registry.npmjs.org/tr46/-/tr46-1.0.1.tgz";
          };
          ident = "tr46";
          ltype = "file";
          version = "1.0.1";
        };
      };
      tunnel-agent = {
        "0.6.0" = {
          depInfo = {
            safe-buffer = {
              descriptor = "^5.0.1";
              pin = "5.2.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-dwtOgVXwIaimJaDtTc7pUe6RKsRMIBgMCF4MtuQnDZ8=";
            type = "tarball";
            url = "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
          };
          ident = "tunnel-agent";
          ltype = "file";
          version = "0.6.0";
        };
      };
      tweetnacl = {
        "0.14.5" = {
          fetchInfo = {
            narHash = "sha256-MCEPWBBw8I2D8KT4ztVQX2uq2LRsnNT/ENRZypBlTPc=";
            type = "tarball";
            url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz";
          };
          ident = "tweetnacl";
          ltype = "file";
          treeInfo = { };
          version = "0.14.5";
        };
      };
      type-check = {
        "0.3.2" = {
          depInfo = {
            prelude-ls = {
              descriptor = "~1.1.2";
              pin = "1.1.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-AnuKFV0wViWz6nhzYV/yz5+EvBYmaOerFgVhvw2LBNA=";
            type = "tarball";
            url = "https://registry.npmjs.org/type-check/-/type-check-0.3.2.tgz";
          };
          ident = "type-check";
          ltype = "file";
          version = "0.3.2";
        };
      };
      type-detect = {
        "4.0.8" = {
          fetchInfo = {
            narHash = "sha256-U2nnsxpPYQeB9BbI0xhu/Tjutkw6xD0tBYni7lvOxps=";
            type = "tarball";
            url = "https://registry.npmjs.org/type-detect/-/type-detect-4.0.8.tgz";
          };
          ident = "type-detect";
          ltype = "file";
          treeInfo = { };
          version = "4.0.8";
        };
      };
      type-fest = {
        "0.6.0" = {
          fetchInfo = {
            narHash = "sha256-73cRYAzTOSMMcjnbgaLnG1w0kDflS9fzftIe63ytlGY=";
            type = "tarball";
            url = "https://registry.npmjs.org/type-fest/-/type-fest-0.6.0.tgz";
          };
          ident = "type-fest";
          ltype = "file";
          treeInfo = { };
          version = "0.6.0";
        };
        "0.8.1" = {
          fetchInfo = {
            narHash = "sha256-oLOIB1DDiS9K9qqoxY2GIpjD1IQ2THx1I+PVuu+SrgM=";
            type = "tarball";
            url = "https://registry.npmjs.org/type-fest/-/type-fest-0.8.1.tgz";
          };
          ident = "type-fest";
          ltype = "file";
          treeInfo = { };
          version = "0.8.1";
        };
      };
      typedarray-to-buffer = {
        "3.1.5" = {
          depInfo = {
            is-typedarray = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-09+sySCUeiKvar5b4mwle5U60gpQRwGb3FF+XPd6tF4=";
            type = "tarball";
            url = "https://registry.npmjs.org/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz";
          };
          ident = "typedarray-to-buffer";
          ltype = "file";
          version = "3.1.5";
        };
      };
      union-value = {
        "1.0.1" = {
          depInfo = {
            arr-union = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
            get-value = {
              descriptor = "^2.0.6";
              pin = "2.0.6";
              runtime = true;
            };
            is-extendable = {
              descriptor = "^0.1.1";
              pin = "0.1.1";
              runtime = true;
            };
            set-value = {
              descriptor = "^2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-TKd0YDOYUNiLuHtSQ/34J82VOvU0IPysYpBCtOnjsBw=";
            type = "tarball";
            url = "https://registry.npmjs.org/union-value/-/union-value-1.0.1.tgz";
          };
          ident = "union-value";
          ltype = "file";
          version = "1.0.1";
        };
      };
      unset-value = {
        "1.0.0" = {
          depInfo = {
            has-value = {
              descriptor = "^0.3.1";
              pin = "0.3.1";
              runtime = true;
            };
            isobject = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-IUl+xJ6KBDcryGLqoOl+rFCADPUsG0svnKiIe6El4bU=";
            type = "tarball";
            url = "https://registry.npmjs.org/unset-value/-/unset-value-1.0.0.tgz";
          };
          ident = "unset-value";
          ltype = "file";
          version = "1.0.0";
        };
      };
      update-browserslist-db = {
        "1.0.10" = {
          binInfo = {
            binPairs = {
              browserslist-lint = "cli.js";
            };
          };
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
            url = "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.0.10.tgz";
          };
          ident = "update-browserslist-db";
          ltype = "file";
          peerInfo = {
            browserslist = {
              descriptor = ">= 4.21.0";
            };
          };
          version = "1.0.10";
        };
      };
      uri-js = {
        "4.4.1" = {
          depInfo = {
            punycode = {
              descriptor = "^2.1.0";
              pin = "2.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-iMLypOgKbMR/XBQ4pWT/gOyOA0W8YKt1rQ8BUBCNzoY=";
            type = "tarball";
            url = "https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz";
          };
          ident = "uri-js";
          ltype = "file";
          version = "4.4.1";
        };
      };
      urix = {
        "0.1.0" = {
          fetchInfo = {
            narHash = "sha256-SLWW6UvNh0709iPsoL2kD5ro5Sy0W51GxOpZe4fUbrA=";
            type = "tarball";
            url = "https://registry.npmjs.org/urix/-/urix-0.1.0.tgz";
          };
          ident = "urix";
          ltype = "file";
          treeInfo = { };
          version = "0.1.0";
        };
      };
      use = {
        "3.1.1" = {
          fetchInfo = {
            narHash = "sha256-N59fQbEuS6wC+5mbTJPouDhn1vScChHR/xsFHOcNDyo=";
            type = "tarball";
            url = "https://registry.npmjs.org/use/-/use-3.1.1.tgz";
          };
          ident = "use";
          ltype = "file";
          treeInfo = { };
          version = "3.1.1";
        };
      };
      uuid = {
        "3.4.0" = {
          binInfo = {
            binPairs = {
              uuid = "bin/uuid";
            };
          };
          fetchInfo = {
            narHash = "sha256-VKMtFIQAIRfa7/dRttrUDbAz+r6c0l9pFj2VRqt4Xig=";
            type = "tarball";
            url = "https://registry.npmjs.org/uuid/-/uuid-3.4.0.tgz";
          };
          ident = "uuid";
          ltype = "file";
          treeInfo = { };
          version = "3.4.0";
        };
      };
      validate-npm-package-license = {
        "3.0.4" = {
          depInfo = {
            spdx-correct = {
              descriptor = "^3.0.0";
              pin = "3.1.1";
              runtime = true;
            };
            spdx-expression-parse = {
              descriptor = "^3.0.0";
              pin = "3.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-CNe0POqcC+Wvyftds8P4h4leM1+PYJxbHWYS6Baqecg=";
            type = "tarball";
            url = "https://registry.npmjs.org/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz";
          };
          ident = "validate-npm-package-license";
          ltype = "file";
          version = "3.0.4";
        };
      };
      verror = {
        "1.10.0" = {
          depInfo = {
            assert-plus = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            core-util-is = {
              descriptor = "1.0.2";
              pin = "1.0.2";
              runtime = true;
            };
            extsprintf = {
              descriptor = "^1.2.0";
              pin = "1.3.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-PmCAyfAYR9+2rdg7TLcJj3Vy279BZs3syUoBqc8aBX0=";
            type = "tarball";
            url = "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz";
          };
          ident = "verror";
          ltype = "file";
          version = "1.10.0";
        };
      };
      w3c-hr-time = {
        "1.0.2" = {
          depInfo = {
            browser-process-hrtime = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-bY96TBxo5VKiVAHP+OQzPz4XkP/XJOEvH4ZvPjjcNkw=";
            type = "tarball";
            url = "https://registry.npmjs.org/w3c-hr-time/-/w3c-hr-time-1.0.2.tgz";
          };
          ident = "w3c-hr-time";
          ltype = "file";
          version = "1.0.2";
        };
      };
      w3c-xmlserializer = {
        "1.1.2" = {
          depInfo = {
            domexception = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
            webidl-conversions = {
              descriptor = "^4.0.2";
              pin = "4.0.2";
              runtime = true;
            };
            xml-name-validator = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HcaP54XEyGA5szDwgJlgrkVgp1amZfwh4fxWPn2eTrk=";
            type = "tarball";
            url = "https://registry.npmjs.org/w3c-xmlserializer/-/w3c-xmlserializer-1.1.2.tgz";
          };
          ident = "w3c-xmlserializer";
          ltype = "file";
          version = "1.1.2";
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
          version = "1.0.8";
        };
      };
      webidl-conversions = {
        "4.0.2" = {
          fetchInfo = {
            narHash = "sha256-yzyeWZzlrSxiSVx078JkzkL+h6wf1J7jUpsjyASQQ7I=";
            type = "tarball";
            url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-4.0.2.tgz";
          };
          ident = "webidl-conversions";
          ltype = "file";
          treeInfo = { };
          version = "4.0.2";
        };
      };
      whatwg-encoding = {
        "1.0.5" = {
          depInfo = {
            iconv-lite = {
              descriptor = "0.4.24";
              pin = "0.4.24";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-Wc2UD5MNBeymRH+0ZMbNtCkmx70zGgH4mYsNQH8lAkY=";
            type = "tarball";
            url = "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-1.0.5.tgz";
          };
          ident = "whatwg-encoding";
          ltype = "file";
          version = "1.0.5";
        };
      };
      whatwg-mimetype = {
        "2.3.0" = {
          fetchInfo = {
            narHash = "sha256-pfj2ExLAH+gXIFz3zn4uI/Q/YBTB8bRCyu/UlLlEbqY=";
            type = "tarball";
            url = "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-2.3.0.tgz";
          };
          ident = "whatwg-mimetype";
          ltype = "file";
          treeInfo = { };
          version = "2.3.0";
        };
      };
      whatwg-url = {
        "7.1.0" = {
          depInfo = {
            "lodash.sortby" = {
              descriptor = "^4.7.0";
              pin = "4.7.0";
              runtime = true;
            };
            tr46 = {
              descriptor = "^1.0.1";
              pin = "1.0.1";
              runtime = true;
            };
            webidl-conversions = {
              descriptor = "^4.0.2";
              pin = "4.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-tSBka4AnaYWddfHDxebMzYaWkS33gvNBuUq1fvuLE3w=";
            type = "tarball";
            url = "https://registry.npmjs.org/whatwg-url/-/whatwg-url-7.1.0.tgz";
          };
          ident = "whatwg-url";
          ltype = "file";
          version = "7.1.0";
        };
      };
      which = {
        "1.3.1" = {
          binInfo = {
            binPairs = {
              which = "bin/which";
            };
          };
          depInfo = {
            isexe = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-rT38T0uM083LydXEZ0AAzczS37tTDncqnV59seAgHSg=";
            type = "tarball";
            url = "https://registry.npmjs.org/which/-/which-1.3.1.tgz";
          };
          ident = "which";
          ltype = "file";
          version = "1.3.1";
        };
        "2.0.2" = {
          binInfo = {
            binPairs = {
              node-which = "bin/node-which";
            };
          };
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
          version = "2.0.2";
        };
      };
      which-module = {
        "2.0.0" = {
          fetchInfo = {
            narHash = "sha256-i3JwDcaORamS8EHPTJsNMKD4fhQGmGozOQT3kjBf1wY=";
            type = "tarball";
            url = "https://registry.npmjs.org/which-module/-/which-module-2.0.0.tgz";
          };
          ident = "which-module";
          ltype = "file";
          treeInfo = { };
          version = "2.0.0";
        };
      };
      word-wrap = {
        "1.2.3" = {
          fetchInfo = {
            narHash = "sha256-IuQp+rqXsbglQ6n0uJEG9RV6QAEoQNwcUmcfHcE8YiI=";
            type = "tarball";
            url = "https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.3.tgz";
          };
          ident = "word-wrap";
          ltype = "file";
          treeInfo = { };
          version = "1.2.3";
        };
      };
      wrap-ansi = {
        "6.2.0" = {
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
            narHash = "sha256-xMpt62dCwINzLupNVfeHfXFI6Muxt5HC+E+IKQhlOJg=";
            type = "tarball";
            url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-6.2.0.tgz";
          };
          ident = "wrap-ansi";
          ltype = "file";
          version = "6.2.0";
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
        "3.0.3" = {
          depInfo = {
            imurmurhash = {
              descriptor = "^0.1.4";
              pin = "0.1.4";
              runtime = true;
            };
            is-typedarray = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            signal-exit = {
              descriptor = "^3.0.2";
              pin = "3.0.7";
              runtime = true;
            };
            typedarray-to-buffer = {
              descriptor = "^3.1.5";
              pin = "3.1.5";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-1ClfkzDDazFSZ7aS4Mo/E2k9WzT+yo3CS9wX6+xyK5c=";
            type = "tarball";
            url = "https://registry.npmjs.org/write-file-atomic/-/write-file-atomic-3.0.3.tgz";
          };
          ident = "write-file-atomic";
          ltype = "file";
          version = "3.0.3";
        };
      };
      ws = {
        "7.5.9" = {
          fetchInfo = {
            narHash = "sha256-AN2PKyDXMovvSznANyDAWaMK3AfxVSFzp3apPBpFyGY=";
            type = "tarball";
            url = "https://registry.npmjs.org/ws/-/ws-7.5.9.tgz";
          };
          ident = "ws";
          ltype = "file";
          peerInfo = {
            bufferutil = {
              descriptor = "^4.0.1";
              optional = true;
            };
            utf-8-validate = {
              descriptor = "^5.0.2";
              optional = true;
            };
          };
          treeInfo = { };
          version = "7.5.9";
        };
      };
      xml-name-validator = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-KW9F+WxTfvWYT1LM2Uca13G68lFAZNKKsFETQG/Vt30=";
            type = "tarball";
            url = "https://registry.npmjs.org/xml-name-validator/-/xml-name-validator-3.0.0.tgz";
          };
          ident = "xml-name-validator";
          ltype = "file";
          treeInfo = { };
          version = "3.0.0";
        };
      };
      xmlchars = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-aQUUQgn0vYzX8MpPb3B3Cfm6W4bZMMT5nNv3jNg4g2c=";
            type = "tarball";
            url = "https://registry.npmjs.org/xmlchars/-/xmlchars-2.2.0.tgz";
          };
          ident = "xmlchars";
          ltype = "file";
          treeInfo = { };
          version = "2.2.0";
        };
      };
      y18n = {
        "4.0.3" = {
          fetchInfo = {
            narHash = "sha256-YIqmjc6LOFdMUwaTSZf9R+CiD7XTszc+yC/fuYHkOHY=";
            type = "tarball";
            url = "https://registry.npmjs.org/y18n/-/y18n-4.0.3.tgz";
          };
          ident = "y18n";
          ltype = "file";
          treeInfo = { };
          version = "4.0.3";
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
      };
      yargs = {
        "15.4.1" = {
          depInfo = {
            cliui = {
              descriptor = "^6.0.0";
              pin = "6.0.0";
              runtime = true;
            };
            decamelize = {
              descriptor = "^1.2.0";
              pin = "1.2.0";
              runtime = true;
            };
            find-up = {
              descriptor = "^4.1.0";
              pin = "4.1.0";
              runtime = true;
            };
            get-caller-file = {
              descriptor = "^2.0.1";
              pin = "2.0.5";
              runtime = true;
            };
            require-directory = {
              descriptor = "^2.1.1";
              pin = "2.1.1";
              runtime = true;
            };
            require-main-filename = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            set-blocking = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            string-width = {
              descriptor = "^4.2.0";
              pin = "4.2.3";
              runtime = true;
            };
            which-module = {
              descriptor = "^2.0.0";
              pin = "2.0.0";
              runtime = true;
            };
            y18n = {
              descriptor = "^4.0.0";
              pin = "4.0.3";
              runtime = true;
            };
            yargs-parser = {
              descriptor = "^18.1.2";
              pin = "18.1.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-6ed+1obHvUKXTXsrMaZs2dowxLEHFd2ifSgroNv2THo=";
            type = "tarball";
            url = "https://registry.npmjs.org/yargs/-/yargs-15.4.1.tgz";
          };
          ident = "yargs";
          ltype = "file";
          version = "15.4.1";
        };
      };
      yargs-parser = {
        "18.1.3" = {
          depInfo = {
            camelcase = {
              descriptor = "^5.0.0";
              pin = "5.3.1";
              runtime = true;
            };
            decamelize = {
              descriptor = "^1.2.0";
              pin = "1.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-976tY0Z6Xx+k9QBVeRF8fPTCFhL51CozGGWQR/kyce4=";
            type = "tarball";
            url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-18.1.3.tgz";
          };
          ident = "yargs-parser";
          ltype = "file";
          version = "18.1.3";
        };
      };
    };
  };
}

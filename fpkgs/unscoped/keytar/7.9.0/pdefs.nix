{
  floco = {
    pdefs = {
      base64-js = {
        "1.5.1" = {
          fetchInfo = {
            narHash = "sha256-LZGj7J4BbIJL9l6ECGOwv/mtGWvPNoNs9F+RrJUH9Ds=";
            type = "tarball";
            url = "https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz";
          };
          ident = "base64-js";
          ltype = "file";
          treeInfo = { };
          version = "1.5.1";
        };
      };
      bl = {
        "4.1.0" = {
          depInfo = {
            buffer = {
              descriptor = "^5.5.0";
              pin = "5.7.1";
              runtime = true;
            };
            inherits = {
              descriptor = "^2.0.4";
              pin = "2.0.4";
              runtime = true;
            };
            readable-stream = {
              descriptor = "^3.4.0";
              pin = "3.6.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-XAYUTdeJ3lqt70AKQGXcvlTAOFWNfkw3plBepm9BMQc=";
            type = "tarball";
            url = "https://registry.npmjs.org/bl/-/bl-4.1.0.tgz";
          };
          ident = "bl";
          ltype = "file";
          treeInfo = {
            "node_modules/buffer" = {
              key = "buffer/5.7.1";
              link = true;
            };
            "node_modules/inherits" = {
              key = "inherits/2.0.4";
              link = true;
            };
            "node_modules/readable-stream" = {
              key = "readable-stream/3.6.0";
              link = true;
            };
          };
          version = "4.1.0";
        };
      };
      buffer = {
        "5.7.1" = {
          depInfo = {
            base64-js = {
              descriptor = "^1.3.1";
              pin = "1.5.1";
              runtime = true;
            };
            ieee754 = {
              descriptor = "^1.1.13";
              pin = "1.2.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-BR9EQnHS60hW0AgO7CgAWd8NPc6jICGb9s2ZSC6Ea2o=";
            type = "tarball";
            url = "https://registry.npmjs.org/buffer/-/buffer-5.7.1.tgz";
          };
          ident = "buffer";
          ltype = "file";
          treeInfo = {
            "node_modules/base64-js" = {
              key = "base64-js/1.5.1";
              link = true;
            };
            "node_modules/ieee754" = {
              key = "ieee754/1.2.1";
              link = true;
            };
          };
          version = "5.7.1";
        };
      };
      chownr = {
        "1.1.4" = {
          fetchInfo = {
            narHash = "sha256-7cJm4tR33zu9lN9x3hx+3kta8rpy1/hg3Sr4ldXRwyA=";
            type = "tarball";
            url = "https://registry.npmjs.org/chownr/-/chownr-1.1.4.tgz";
          };
          ident = "chownr";
          ltype = "file";
          treeInfo = { };
          version = "1.1.4";
        };
      };
      decompress-response = {
        "6.0.0" = {
          depInfo = {
            mimic-response = {
              descriptor = "^3.1.0";
              pin = "3.1.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-L7oDFODTyen+qYk81sxNJ9EYq042/llh9SsGJA0Q1eU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/decompress-response/-/decompress-response-6.0.0.tgz";
          };
          ident = "decompress-response";
          ltype = "file";
          treeInfo = {
            "node_modules/mimic-response" = {
              key = "mimic-response/3.1.0";
              link = true;
            };
          };
          version = "6.0.0";
        };
      };
      deep-extend = {
        "0.6.0" = {
          fetchInfo = {
            narHash = "sha256-7ELaZLoNz6avpFjK9nX3LnXyijf1RqZFsIRMuPK24TQ=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz";
          };
          ident = "deep-extend";
          ltype = "file";
          treeInfo = { };
          version = "0.6.0";
        };
      };
      detect-libc = {
        "2.0.1" = {
          fetchInfo = {
            narHash = "sha256-tMcDNGP69cori7rGwO9BWxwPIziOi8Vxv6OLxFBlw8I=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.1.tgz";
          };
          ident = "detect-libc";
          ltype = "file";
          treeInfo = { };
          version = "2.0.1";
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
            url =
              "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz";
          };
          ident = "end-of-stream";
          ltype = "file";
          treeInfo = {
            "node_modules/once" = {
              key = "once/1.4.0";
              link = true;
            };
          };
          version = "1.4.4";
        };
      };
      expand-template = {
        "2.0.3" = {
          fetchInfo = {
            narHash = "sha256-gU2LbFCK8EUPpRGikfU6jDmwTtANLWXAvzzRv27Wl3A=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/expand-template/-/expand-template-2.0.3.tgz";
          };
          ident = "expand-template";
          ltype = "file";
          treeInfo = { };
          version = "2.0.3";
        };
      };
      fs-constants = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-X8BGzfIVaEnEGeipji8Cvwk145KuhhsGd2282pZJy20=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/fs-constants/-/fs-constants-1.0.0.tgz";
          };
          ident = "fs-constants";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      github-from-package = {
        "0.0.0" = {
          fetchInfo = {
            narHash = "sha256-B7yy5lP1swSzKAGZA4qd/3hug1BJCvdxZmfbRcEx7tw=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/github-from-package/-/github-from-package-0.0.0.tgz";
          };
          ident = "github-from-package";
          ltype = "file";
          treeInfo = { };
          version = "0.0.0";
        };
      };
      ieee754 = {
        "1.2.1" = {
          fetchInfo = {
            narHash = "sha256-tFbpZ+yAyaBm8/G327gTlNUtZS5zfUaAHi8W3HG6q48=";
            type = "tarball";
            url = "https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz";
          };
          ident = "ieee754";
          ltype = "file";
          treeInfo = { };
          version = "1.2.1";
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
      ini = {
        "1.3.8" = {
          fetchInfo = {
            narHash = "sha256-zX9o4qsCsgLbZ/XCCnq9F/1fkx41mv4Y2AbsY0f345g=";
            type = "tarball";
            url = "https://registry.npmjs.org/ini/-/ini-1.3.8.tgz";
          };
          ident = "ini";
          ltype = "file";
          treeInfo = { };
          version = "1.3.8";
        };
      };
      keytar = {
        "7.9.0" = {
          depInfo = {
            node-addon-api = {
              descriptor = "^4.3.0";
              pin = "4.3.0";
              runtime = true;
            };
            prebuild-install = {
              descriptor = "^7.0.1";
              pin = "7.1.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-31kYbaUBy9t9ozFHeC5ShEnuyIOKnzVyurUHvyswdlA=";
            type = "tarball";
            url = "https://registry.npmjs.org/keytar/-/keytar-7.9.0.tgz";
          };
          ident = "keytar";
          ltype = "file";
          treeInfo = {
            "node_modules/base64-js" = { key = "base64-js/1.5.1"; };
            "node_modules/bl" = { key = "bl/4.1.0"; };
            "node_modules/buffer" = { key = "buffer/5.7.1"; };
            "node_modules/chownr" = { key = "chownr/1.1.4"; };
            "node_modules/decompress-response" = {
              key = "decompress-response/6.0.0";
            };
            "node_modules/deep-extend" = { key = "deep-extend/0.6.0"; };
            "node_modules/detect-libc" = { key = "detect-libc/2.0.1"; };
            "node_modules/end-of-stream" = { key = "end-of-stream/1.4.4"; };
            "node_modules/expand-template" = { key = "expand-template/2.0.3"; };
            "node_modules/fs-constants" = { key = "fs-constants/1.0.0"; };
            "node_modules/github-from-package" = {
              key = "github-from-package/0.0.0";
            };
            "node_modules/ieee754" = { key = "ieee754/1.2.1"; };
            "node_modules/inherits" = { key = "inherits/2.0.4"; };
            "node_modules/ini" = { key = "ini/1.3.8"; };
            "node_modules/lru-cache" = { key = "lru-cache/6.0.0"; };
            "node_modules/mimic-response" = { key = "mimic-response/3.1.0"; };
            "node_modules/minimist" = { key = "minimist/1.2.7"; };
            "node_modules/mkdirp-classic" = { key = "mkdirp-classic/0.5.3"; };
            "node_modules/napi-build-utils" = {
              key = "napi-build-utils/1.0.2";
            };
            "node_modules/node-abi" = { key = "node-abi/3.31.0"; };
            "node_modules/node-addon-api" = { key = "node-addon-api/4.3.0"; };
            "node_modules/once" = { key = "once/1.4.0"; };
            "node_modules/prebuild-install" = {
              key = "prebuild-install/7.1.1";
            };
            "node_modules/pump" = { key = "pump/3.0.0"; };
            "node_modules/rc" = { key = "rc/1.2.8"; };
            "node_modules/readable-stream" = { key = "readable-stream/3.6.0"; };
            "node_modules/safe-buffer" = { key = "safe-buffer/5.2.1"; };
            "node_modules/semver" = { key = "semver/7.3.8"; };
            "node_modules/simple-concat" = { key = "simple-concat/1.0.1"; };
            "node_modules/simple-get" = { key = "simple-get/4.0.1"; };
            "node_modules/string_decoder" = { key = "string_decoder/1.3.0"; };
            "node_modules/strip-json-comments" = {
              key = "strip-json-comments/2.0.1";
            };
            "node_modules/tar-fs" = { key = "tar-fs/2.1.1"; };
            "node_modules/tar-stream" = { key = "tar-stream/2.2.0"; };
            "node_modules/tunnel-agent" = { key = "tunnel-agent/0.6.0"; };
            "node_modules/util-deprecate" = { key = "util-deprecate/1.0.2"; };
            "node_modules/wrappy" = { key = "wrappy/1.0.2"; };
            "node_modules/yallist" = { key = "yallist/4.0.0"; };
          };
          version = "7.9.0";
        };
      };
      lru-cache = {
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
      mimic-response = {
        "3.1.0" = {
          fetchInfo = {
            narHash = "sha256-19JpS4wWC7aJczKnJEOrEbn1JN86yNCgXCQ1ibQcG8s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/mimic-response/-/mimic-response-3.1.0.tgz";
          };
          ident = "mimic-response";
          ltype = "file";
          treeInfo = { };
          version = "3.1.0";
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
      mkdirp-classic = {
        "0.5.3" = {
          fetchInfo = {
            narHash = "sha256-CU1Una7m/cchjwbg1wE8ZhXaTU74RI7s4rzMTqCarJI=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/mkdirp-classic/-/mkdirp-classic-0.5.3.tgz";
          };
          ident = "mkdirp-classic";
          ltype = "file";
          treeInfo = { };
          version = "0.5.3";
        };
      };
      napi-build-utils = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-Qrq9kwmODeRqA5wOCu0suF+kRlAOFd7iqeOuHeHZOhk=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/napi-build-utils/-/napi-build-utils-1.0.2.tgz";
          };
          ident = "napi-build-utils";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
        };
      };
      node-abi = {
        "3.31.0" = {
          depInfo = {
            semver = {
              descriptor = "^7.3.5";
              pin = "7.3.8";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-/BCTDwFek4NGJLLEwvf0t+aRf4NIazrV5bMSiT2aZn8=";
            type = "tarball";
            url = "https://registry.npmjs.org/node-abi/-/node-abi-3.31.0.tgz";
          };
          ident = "node-abi";
          ltype = "file";
          treeInfo = {
            "node_modules/semver" = {
              key = "semver/7.3.8";
              link = true;
            };
          };
          version = "3.31.0";
        };
      };
      node-addon-api = {
        "4.3.0" = {
          fetchInfo = {
            narHash = "sha256-Tx2R3aklydHe/RqTRkq+qCMs1pYmWKllvF24Mkh8s/A=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/node-addon-api/-/node-addon-api-4.3.0.tgz";
          };
          ident = "node-addon-api";
          ltype = "file";
          treeInfo = { };
          version = "4.3.0";
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
      prebuild-install = {
        "7.1.1" = {
          binInfo = { binPairs = { prebuild-install = "bin.js"; }; };
          depInfo = {
            detect-libc = {
              descriptor = "^2.0.0";
              pin = "2.0.1";
              runtime = true;
            };
            expand-template = {
              descriptor = "^2.0.3";
              pin = "2.0.3";
              runtime = true;
            };
            github-from-package = {
              descriptor = "0.0.0";
              pin = "0.0.0";
              runtime = true;
            };
            minimist = {
              descriptor = "^1.2.3";
              pin = "1.2.7";
              runtime = true;
            };
            mkdirp-classic = {
              descriptor = "^0.5.3";
              pin = "0.5.3";
              runtime = true;
            };
            napi-build-utils = {
              descriptor = "^1.0.1";
              pin = "1.0.2";
              runtime = true;
            };
            node-abi = {
              descriptor = "^3.3.0";
              pin = "3.31.0";
              runtime = true;
            };
            pump = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            rc = {
              descriptor = "^1.2.7";
              pin = "1.2.8";
              runtime = true;
            };
            simple-get = {
              descriptor = "^4.0.0";
              pin = "4.0.1";
              runtime = true;
            };
            tar-fs = {
              descriptor = "^2.0.0";
              pin = "2.1.1";
              runtime = true;
            };
            tunnel-agent = {
              descriptor = "^0.6.0";
              pin = "0.6.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-HElA7BbLPwElfsI5Af9m/fyWMghGcXQ2sl6TdwIIbeU=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/prebuild-install/-/prebuild-install-7.1.1.tgz";
          };
          ident = "prebuild-install";
          ltype = "file";
          treeInfo = {
            "node_modules/detect-libc" = {
              key = "detect-libc/2.0.1";
              link = true;
            };
            "node_modules/expand-template" = {
              key = "expand-template/2.0.3";
              link = true;
            };
            "node_modules/github-from-package" = {
              key = "github-from-package/0.0.0";
              link = true;
            };
            "node_modules/minimist" = {
              key = "minimist/1.2.7";
              link = true;
            };
            "node_modules/mkdirp-classic" = {
              key = "mkdirp-classic/0.5.3";
              link = true;
            };
            "node_modules/napi-build-utils" = {
              key = "napi-build-utils/1.0.2";
              link = true;
            };
            "node_modules/node-abi" = {
              key = "node-abi/3.31.0";
              link = true;
            };
            "node_modules/pump" = {
              key = "pump/3.0.0";
              link = true;
            };
            "node_modules/rc" = {
              key = "rc/1.2.8";
              link = true;
            };
            "node_modules/simple-get" = {
              key = "simple-get/4.0.1";
              link = true;
            };
            "node_modules/tar-fs" = {
              key = "tar-fs/2.1.1";
              link = true;
            };
            "node_modules/tunnel-agent" = {
              key = "tunnel-agent/0.6.0";
              link = true;
            };
          };
          version = "7.1.1";
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
          treeInfo = {
            "node_modules/end-of-stream" = {
              key = "end-of-stream/1.4.4";
              link = true;
            };
            "node_modules/once" = {
              key = "once/1.4.0";
              link = true;
            };
          };
          version = "3.0.0";
        };
      };
      rc = {
        "1.2.8" = {
          binInfo = { binPairs = { rc = "cli.js"; }; };
          depInfo = {
            deep-extend = {
              descriptor = "^0.6.0";
              pin = "0.6.0";
              runtime = true;
            };
            ini = {
              descriptor = "~1.3.0";
              pin = "1.3.8";
              runtime = true;
            };
            minimist = {
              descriptor = "^1.2.0";
              pin = "1.2.7";
              runtime = true;
            };
            strip-json-comments = {
              descriptor = "~2.0.1";
              pin = "2.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kMQCqHYCBwtHYNERSM5Jn/n2rMghHcP3JVXkUHESluM=";
            type = "tarball";
            url = "https://registry.npmjs.org/rc/-/rc-1.2.8.tgz";
          };
          ident = "rc";
          ltype = "file";
          treeInfo = {
            "node_modules/deep-extend" = {
              key = "deep-extend/0.6.0";
              link = true;
            };
            "node_modules/ini" = {
              key = "ini/1.3.8";
              link = true;
            };
            "node_modules/minimist" = {
              key = "minimist/1.2.7";
              link = true;
            };
            "node_modules/strip-json-comments" = {
              key = "strip-json-comments/2.0.1";
              link = true;
            };
          };
          version = "1.2.8";
        };
      };
      readable-stream = {
        "3.6.0" = {
          depInfo = {
            inherits = {
              descriptor = "^2.0.3";
              pin = "2.0.4";
              runtime = true;
            };
            string_decoder = {
              descriptor = "^1.1.1";
              pin = "1.3.0";
              runtime = true;
            };
            util-deprecate = {
              descriptor = "^1.0.1";
              pin = "1.0.2";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-pvwBMxYeE5paPfTTAXnvO9IJIEcvBww9FyIr95bDA7Y=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.0.tgz";
          };
          ident = "readable-stream";
          ltype = "file";
          treeInfo = {
            "node_modules/inherits" = {
              key = "inherits/2.0.4";
              link = true;
            };
            "node_modules/string_decoder" = {
              key = "string_decoder/1.3.0";
              link = true;
            };
            "node_modules/util-deprecate" = {
              key = "util-deprecate/1.0.2";
              link = true;
            };
          };
          version = "3.6.0";
        };
      };
      safe-buffer = {
        "5.2.1" = {
          fetchInfo = {
            narHash = "sha256-wXBrp88QpZPUzawZ33OaWsjCtWTVMsflFJRBg2/U4y8=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz";
          };
          ident = "safe-buffer";
          ltype = "file";
          treeInfo = { };
          version = "5.2.1";
        };
      };
      semver = {
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
      simple-concat = {
        "1.0.1" = {
          fetchInfo = {
            narHash = "sha256-DRNOwhXSWMUSt3NmuJZi5axuvunwDVFvQnjlsG8N9+s=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/simple-concat/-/simple-concat-1.0.1.tgz";
          };
          ident = "simple-concat";
          ltype = "file";
          treeInfo = { };
          version = "1.0.1";
        };
      };
      simple-get = {
        "4.0.1" = {
          depInfo = {
            decompress-response = {
              descriptor = "^6.0.0";
              pin = "6.0.0";
              runtime = true;
            };
            once = {
              descriptor = "^1.3.1";
              pin = "1.4.0";
              runtime = true;
            };
            simple-concat = {
              descriptor = "^1.0.0";
              pin = "1.0.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-zaiktkv5aVFkI0KQJrve56rS0QnzgW/T6QhgTO+790g=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/simple-get/-/simple-get-4.0.1.tgz";
          };
          ident = "simple-get";
          ltype = "file";
          treeInfo = {
            "node_modules/decompress-response" = {
              key = "decompress-response/6.0.0";
              link = true;
            };
            "node_modules/once" = {
              key = "once/1.4.0";
              link = true;
            };
            "node_modules/simple-concat" = {
              key = "simple-concat/1.0.1";
              link = true;
            };
          };
          version = "4.0.1";
        };
      };
      string_decoder = {
        "1.3.0" = {
          depInfo = {
            safe-buffer = {
              descriptor = "~5.2.0";
              pin = "5.2.1";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-eazGQAivX9/7FphEMbSzJR9w+AWaAUazWJjVCVdriUY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz";
          };
          ident = "string_decoder";
          ltype = "file";
          treeInfo = {
            "node_modules/safe-buffer" = {
              key = "safe-buffer/5.2.1";
              link = true;
            };
          };
          version = "1.3.0";
        };
      };
      strip-json-comments = {
        "2.0.1" = {
          fetchInfo = {
            narHash = "sha256-4Pv18Bsl21NJ9tNewxiklEvxiD0n+MANfEqyzoe4kY0=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-2.0.1.tgz";
          };
          ident = "strip-json-comments";
          ltype = "file";
          treeInfo = { };
          version = "2.0.1";
        };
      };
      tar-fs = {
        "2.1.1" = {
          depInfo = {
            chownr = {
              descriptor = "^1.1.1";
              pin = "1.1.4";
              runtime = true;
            };
            mkdirp-classic = {
              descriptor = "^0.5.2";
              pin = "0.5.3";
              runtime = true;
            };
            pump = {
              descriptor = "^3.0.0";
              pin = "3.0.0";
              runtime = true;
            };
            tar-stream = {
              descriptor = "^2.1.4";
              pin = "2.2.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-ZiYUmZzZDkwOeZ0uJpE6CRL7FdWILNR19h8EgRK8TFc=";
            type = "tarball";
            url = "https://registry.npmjs.org/tar-fs/-/tar-fs-2.1.1.tgz";
          };
          ident = "tar-fs";
          ltype = "file";
          treeInfo = {
            "node_modules/chownr" = {
              key = "chownr/1.1.4";
              link = true;
            };
            "node_modules/mkdirp-classic" = {
              key = "mkdirp-classic/0.5.3";
              link = true;
            };
            "node_modules/pump" = {
              key = "pump/3.0.0";
              link = true;
            };
            "node_modules/tar-stream" = {
              key = "tar-stream/2.2.0";
              link = true;
            };
          };
          version = "2.1.1";
        };
      };
      tar-stream = {
        "2.2.0" = {
          depInfo = {
            bl = {
              descriptor = "^4.0.3";
              pin = "4.1.0";
              runtime = true;
            };
            end-of-stream = {
              descriptor = "^1.4.1";
              pin = "1.4.4";
              runtime = true;
            };
            fs-constants = {
              descriptor = "^1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
            inherits = {
              descriptor = "^2.0.3";
              pin = "2.0.4";
              runtime = true;
            };
            readable-stream = {
              descriptor = "^3.1.1";
              pin = "3.6.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-V4gn04ZClfbBs9BW+zKEd9D4u7nfuvDEY/N5FL8l1Sg=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/tar-stream/-/tar-stream-2.2.0.tgz";
          };
          ident = "tar-stream";
          ltype = "file";
          treeInfo = {
            "node_modules/bl" = {
              key = "bl/4.1.0";
              link = true;
            };
            "node_modules/end-of-stream" = {
              key = "end-of-stream/1.4.4";
              link = true;
            };
            "node_modules/fs-constants" = {
              key = "fs-constants/1.0.0";
              link = true;
            };
            "node_modules/inherits" = {
              key = "inherits/2.0.4";
              link = true;
            };
            "node_modules/readable-stream" = {
              key = "readable-stream/3.6.0";
              link = true;
            };
          };
          version = "2.2.0";
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
            url =
              "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
          };
          ident = "tunnel-agent";
          ltype = "file";
          treeInfo = {
            "node_modules/safe-buffer" = {
              key = "safe-buffer/5.2.1";
              link = true;
            };
          };
          version = "0.6.0";
        };
      };
      util-deprecate = {
        "1.0.2" = {
          fetchInfo = {
            narHash = "sha256-rIdgRwu72yh5o+nvWoU8FWww1LMLAIKmtv8wPKglaeY=";
            type = "tarball";
            url =
              "https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz";
          };
          ident = "util-deprecate";
          ltype = "file";
          treeInfo = { };
          version = "1.0.2";
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
      yallist = {
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
    };
  };
}

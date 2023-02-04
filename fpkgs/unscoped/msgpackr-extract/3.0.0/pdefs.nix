{
  floco = {
    pdefs = {
      "@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-gsv1GW1DGRrrSZYtyP6x93ZUlzr1U/YXDjCdQzJzWqc=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-darwin-arm64/-/msgpackr-extract-darwin-arm64-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-darwin-arm64";
          ltype = "file";
          sysInfo = {
            cpu = [
              "aarch64"
            ];
            os = [
              "darwin"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-darwin-x64" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-i21x5boVd7CtRkeyKCig2PZ0zCKM6odls0Ih6Jm3Nh8=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-darwin-x64/-/msgpackr-extract-darwin-x64-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-darwin-x64";
          ltype = "file";
          sysInfo = {
            cpu = [
              "x86_64"
            ];
            os = [
              "darwin"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-arm" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-G7fNPuZMJbozs2kaXoEc9YPIJR1qM1FRnxkJuXrL/3c=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-arm/-/msgpackr-extract-linux-arm-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-linux-arm";
          ltype = "file";
          sysInfo = {
            cpu = [
              "aarch"
            ];
            os = [
              "linux"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-arm64" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-WdgQhA7GGKcI1QRbfVCaookzUjk/kyHthd42dNCL4C4=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-arm64/-/msgpackr-extract-linux-arm64-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-linux-arm64";
          ltype = "file";
          sysInfo = {
            cpu = [
              "aarch64"
            ];
            os = [
              "linux"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-x64" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-h0EqJ3NiReuamtXOetocktRcFdUcz55PVLwCb8ptD/4=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-x64/-/msgpackr-extract-linux-x64-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-linux-x64";
          ltype = "file";
          sysInfo = {
            cpu = [
              "x86_64"
            ];
            os = [
              "linux"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-win32-x64" = {
        "3.0.0" = {
          fetchInfo = {
            narHash = "sha256-Efa7rjCbzPY/Vrvy4BAbSgdEU2t8Nyhh9vmiVyz98GA=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-win32-x64/-/msgpackr-extract-win32-x64-3.0.0.tgz";
          };
          ident = "@msgpackr-extract/msgpackr-extract-win32-x64";
          ltype = "file";
          sysInfo = {
            cpu = [
              "x86_64"
            ];
            os = [
              "win32"
            ];
          };
          treeInfo = { };
          version = "3.0.0";
        };
      };
      msgpackr-extract = {
        "3.0.0" = {
          binInfo = {
            binPairs = {
              download-msgpackr-prebuilds = "bin/download-prebuilds.js";
            };
          };
          depInfo = {
            "@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-darwin-x64" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-arm" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-arm64" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-x64" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-win32-x64" = {
              descriptor = "3.0.0";
              optional = true;
              pin = "3.0.0";
              runtime = true;
            };
            node-gyp-build-optional-packages = {
              descriptor = "5.0.7";
              pin = "5.0.7";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-rXh4peJ4XYsyf31mxIIdQO1mOaXte7kL2QGrrh1a0Ew=";
            type = "tarball";
            url = "https://registry.npmjs.org/msgpackr-extract/-/msgpackr-extract-3.0.0.tgz";
          };
          ident = "msgpackr-extract";
          lifecycle = {
            install = true;
          };
          ltype = "file";
          treeInfo = {
            "node_modules/@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
              key = "@msgpackr-extract/msgpackr-extract-darwin-arm64/3.0.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-darwin-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-darwin-x64/3.0.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-arm" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-arm/3.0.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-arm64" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-arm64/3.0.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-x64/3.0.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-win32-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-win32-x64/3.0.0";
              optional = true;
            };
            "node_modules/node-gyp-build-optional-packages" = {
              key = "node-gyp-build-optional-packages/5.0.7";
            };
          };
          version = "3.0.0";
        };
      };
      node-gyp-build-optional-packages = {
        "5.0.7" = {
          binInfo = {
            binPairs = {
              node-gyp-build-optional-packages = "bin.js";
              node-gyp-build-optional-packages-optional = "optional.js";
              node-gyp-build-optional-packages-test = "build-test.js";
            };
          };
          fetchInfo = {
            narHash = "sha256-aeRCMe5Vr8vfqmIvoWoFi0dytCkWtl4ZOlPjbXlogj8=";
            type = "tarball";
            url = "https://registry.npmjs.org/node-gyp-build-optional-packages/-/node-gyp-build-optional-packages-5.0.7.tgz";
          };
          ident = "node-gyp-build-optional-packages";
          ltype = "file";
          treeInfo = { };
          version = "5.0.7";
        };
      };
    };
  };
}
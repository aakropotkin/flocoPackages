{
  floco = {
    pdefs = {
      "@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-8i/7OIB9WyBsZPiKvEuxtImbUDE0N8vw6LDIWwY5Ous=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-darwin-arm64/-/msgpackr-extract-darwin-arm64-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-darwin-x64" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-HFpm8hGmIEd1Zzr97V3/ky1y+M5MUDIg2eXgBsUIQvQ=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-darwin-x64/-/msgpackr-extract-darwin-x64-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-arm" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-uj+esfuc+Hgi0CVmsYzRNu6fcP/J45VzAWQVU7uLlKk=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-arm/-/msgpackr-extract-linux-arm-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-arm64" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-oRrqVvPXnYcXZ1AL9GcsxWpJtvtVTHsHNqUFqVw/Ivo=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-arm64/-/msgpackr-extract-linux-arm64-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-linux-x64" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-tPjWZk2mhIrlLd5WpJzVmEATwMXCf9Q8FPz89itiOb4=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-linux-x64/-/msgpackr-extract-linux-x64-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      "@msgpackr-extract/msgpackr-extract-win32-x64" = {
        "2.2.0" = {
          fetchInfo = {
            narHash = "sha256-+GY+/b/CjEdPwRlArdZAKrrzqaIXjMp9dd9mIgIuxeE=";
            type = "tarball";
            url = "https://registry.npmjs.org/@msgpackr-extract/msgpackr-extract-win32-x64/-/msgpackr-extract-win32-x64-2.2.0.tgz";
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
          version = "2.2.0";
        };
      };
      msgpackr-extract = {
        "2.2.0" = {
          binInfo = {
            binPairs = {
              download-msgpackr-prebuilds = "bin/download-prebuilds.js";
            };
          };
          depInfo = {
            "@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-darwin-x64" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-arm" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-arm64" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-linux-x64" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            "@msgpackr-extract/msgpackr-extract-win32-x64" = {
              descriptor = "2.2.0";
              optional = true;
              pin = "2.2.0";
              runtime = true;
            };
            node-gyp-build-optional-packages = {
              descriptor = "5.0.3";
              pin = "5.0.3";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-80n+Zhx3y7NJeQOYK673gPR+xtBg7iJxtVwcCXwUNuo=";
            type = "tarball";
            url = "https://registry.npmjs.org/msgpackr-extract/-/msgpackr-extract-2.2.0.tgz";
          };
          ident = "msgpackr-extract";
          lifecycle = {
            install = true;
          };
          ltype = "file";
          treeInfo = {
            "node_modules/@msgpackr-extract/msgpackr-extract-darwin-arm64" = {
              key = "@msgpackr-extract/msgpackr-extract-darwin-arm64/2.2.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-darwin-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-darwin-x64/2.2.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-arm" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-arm/2.2.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-arm64" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-arm64/2.2.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-linux-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-linux-x64/2.2.0";
              optional = true;
            };
            "node_modules/@msgpackr-extract/msgpackr-extract-win32-x64" = {
              key = "@msgpackr-extract/msgpackr-extract-win32-x64/2.2.0";
              optional = true;
            };
            "node_modules/node-gyp-build-optional-packages" = {
              key = "node-gyp-build-optional-packages/5.0.3";
            };
          };
          version = "2.2.0";
        };
      };
      node-gyp-build-optional-packages = {
        "5.0.3" = {
          binInfo = {
            binPairs = {
              node-gyp-build-optional-packages = "bin.js";
              node-gyp-build-optional-packages-optional = "optional.js";
              node-gyp-build-optional-packages-test = "build-test.js";
            };
          };
          fetchInfo = {
            narHash = "sha256-+jJuRkm+ce/eJv1V9kFxh3jBas+ua2dbqB7wHbXWJaU=";
            type = "tarball";
            url = "https://registry.npmjs.org/node-gyp-build-optional-packages/-/node-gyp-build-optional-packages-5.0.3.tgz";
          };
          ident = "node-gyp-build-optional-packages";
          ltype = "file";
          treeInfo = { };
          version = "5.0.3";
        };
      };
    };
  };
}
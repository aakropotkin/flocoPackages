{
  floco = {
    pdefs = {
      bindings = {
        "1.5.0" = {
          depInfo = {
            file-uri-to-path = {
              descriptor = "1.0.0";
              pin = "1.0.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-kx8ia5rQyyOKxwkHk8+vpWMYslwaXItbkKRteae5D4A=";
            type = "tarball";
            url = "https://registry.npmjs.org/bindings/-/bindings-1.5.0.tgz";
          };
          ident = "bindings";
          ltype = "file";
          treeInfo = {
            "node_modules/file-uri-to-path" = {
              key = "file-uri-to-path/1.0.0";
              link = true;
            };
          };
          version = "1.5.0";
        };
      };
      file-uri-to-path = {
        "1.0.0" = {
          fetchInfo = {
            narHash = "sha256-kcvvsOfMYA4q50gpLItmorOwlmxvdmzx9nqlTw4lmCY=";
            type = "tarball";
            url = "https://registry.npmjs.org/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz";
          };
          ident = "file-uri-to-path";
          ltype = "file";
          treeInfo = { };
          version = "1.0.0";
        };
      };
      fsevents = {
        "1.2.13" = {
          depInfo = {
            bindings = {
              descriptor = "^1.5.0";
              pin = "1.5.0";
              runtime = true;
            };
            nan = {
              descriptor = "^2.12.1";
              pin = "2.17.0";
              runtime = true;
            };
          };
          fetchInfo = {
            narHash = "sha256-prK0V63HoVHzoQrTB6MzYEloOwBo5qvSnYVUrg9SFE8=";
            type = "tarball";
            url = "https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz";
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
          treeInfo = {
            "node_modules/bindings" = {
              key = "bindings/1.5.0";
              link = true;
            };
            "node_modules/nan" = {
              key = "nan/2.17.0";
              link = true;
            };
          };
          version = "1.2.13";
        };
      };
      nan = {
        "2.17.0" = {
          fetchInfo = {
            narHash = "sha256-5r+kH/G43Jk8vchs/zzepgd/5ouh0hIG7lWc6OfxLJ0=";
            type = "tarball";
            url = "https://registry.npmjs.org/nan/-/nan-2.17.0.tgz";
          };
          ident = "nan";
          ltype = "file";
          treeInfo = { };
          version = "2.17.0";
        };
      };
    };
  };
}

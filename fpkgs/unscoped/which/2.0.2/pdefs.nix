{
  floco = {
    pdefs = {
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
      which = {
        "2.0.2" = {
          binInfo = { binPairs = { node-which = "bin/node-which"; }; };
          depInfo = {
            isexe = {
              descriptor = "^2.0.0";
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
    };
  };
}

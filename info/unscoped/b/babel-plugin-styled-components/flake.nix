{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-styled-components?_rev=103-45f3b35e7c9fbc1416fdba2258e75ac5";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "babel-plugin-styled-components";
    ldir  = "info/unscoped/b/babel-plugin-styled-components";
    inherit packument fetchInfo;
  } // latest';

}

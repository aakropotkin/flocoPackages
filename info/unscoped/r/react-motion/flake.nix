{

  inputs.packument.url   = "https://registry.npmjs.org/react-motion?rev=87-c84efb58b7959ba809156cc437103309";
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
    ident = "react-motion";
    ldir  = "info/unscoped/r/react-motion";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

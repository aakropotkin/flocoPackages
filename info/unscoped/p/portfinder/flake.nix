{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/portfinder?_rev=68-a0c587e44ee6a6859a60be066022e8c9";
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
    ident = "portfinder";
    ldir  = "info/unscoped/p/portfinder";
    inherit packument fetchInfo;
  } // latest';

}

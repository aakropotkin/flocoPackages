{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/common-path-prefix?_rev=8-30cf718322100c0937bf005d0490602d";
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
    ident = "common-path-prefix";
    ldir  = "info/unscoped/c/common-path-prefix";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minizlib?_rev=47-964c95ee4734dfd52500447144447981";
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
    ident = "minizlib";
    ldir  = "info/unscoped/m/minizlib";
    inherit packument fetchInfo;
  } // latest';

}

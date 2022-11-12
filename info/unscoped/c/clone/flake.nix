{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/clone?_rev=178-40532fe1a3ee8aa8bfbe40aa44860122";
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
    ident = "clone";
    ldir  = "info/unscoped/c/clone";
    inherit packument fetchInfo;
  } // latest';

}

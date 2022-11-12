{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/utility?_rev=120-3d970f19a233796ecb9102db6e357513";
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
    ident = "utility";
    ldir  = "info/unscoped/u/utility";
    inherit packument fetchInfo;
  } // latest';

}

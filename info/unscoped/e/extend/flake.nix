{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/extend?_rev=92-da59970736a4f642e07cbaebf44fb798";
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
    ident = "extend";
    ldir  = "info/unscoped/e/extend";
    inherit packument fetchInfo;
  } // latest';

}

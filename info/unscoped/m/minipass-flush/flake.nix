{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minipass-flush?_rev=6-456975b058ed166410f42f314271b625";
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
    ident = "minipass-flush";
    ldir  = "info/unscoped/m/minipass-flush";
    inherit packument fetchInfo;
  } // latest';

}

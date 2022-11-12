{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/extend-shallow?_rev=25-0983623164aaa4722713c6e3345ba397";
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
    ident = "extend-shallow";
    ldir  = "info/unscoped/e/extend-shallow";
    inherit packument fetchInfo;
  } // latest';

}

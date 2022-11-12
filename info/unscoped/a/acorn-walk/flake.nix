{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/acorn-walk?_rev=17-da6d6fd0a8c5d4bd33719707b6ca4062";
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
    ident = "acorn-walk";
    ldir  = "info/unscoped/a/acorn-walk";
    inherit packument fetchInfo;
  } // latest';

}

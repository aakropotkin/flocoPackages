{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/arg?_rev=334-e6fa90bddbdb364f2279ec23ab706965";
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
    ident = "arg";
    ldir  = "info/unscoped/a/arg";
    inherit packument fetchInfo;
  } // latest';

}

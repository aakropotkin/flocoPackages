{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/handle-thing?_rev=15-94d7a087ec9b0f8d26a0378e85a77aa3";
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
    ident = "handle-thing";
    ldir  = "info/unscoped/h/handle-thing";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mimic-response?_rev=9-6910676cbce41e2aa259b3a1bf399d50";
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
    ident = "mimic-response";
    ldir  = "info/unscoped/m/mimic-response";
    inherit packument fetchInfo;
  } // latest';

}

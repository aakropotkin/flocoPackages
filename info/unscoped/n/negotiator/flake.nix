{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/negotiator?_rev=70-f2d2cea52dbad5b9ed03d214b9eb0ec0";
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
    ident = "negotiator";
    ldir  = "info/unscoped/n/negotiator";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/standard-engine?_rev=112-f483c496f41f4437088eb6fe517f13d5";
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
    ident = "standard-engine";
    ldir  = "info/unscoped/s/standard-engine";
    inherit packument fetchInfo;
  } // latest';

}

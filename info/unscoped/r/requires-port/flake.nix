{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/requires-port?_rev=15-681ddf92f0af0aee927b07502b28a4ab";
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
    ident = "requires-port";
    ldir  = "info/unscoped/r/requires-port";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nth-check?_rev=13-095741c8996f98df786b75d474491a46";
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
    ident = "nth-check";
    ldir  = "info/unscoped/n/nth-check";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/de-indent?_rev=5-a2ddaac268d9e19e680d4e2ef8d5c22e";
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
    ident = "de-indent";
    ldir  = "info/unscoped/d/de-indent";
    inherit packument fetchInfo;
  } // latest';

}

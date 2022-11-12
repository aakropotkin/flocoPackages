{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pascalcase?_rev=8-6d8ea8c58a2d9f3c6da56b03e4b327f3";
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
    ident = "pascalcase";
    ldir  = "info/unscoped/p/pascalcase";
    inherit packument fetchInfo;
  } // latest';

}

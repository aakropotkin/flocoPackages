{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pug-parser?_rev=31-7d5706546b81925b3c1fb8125fc46304";
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
    ident = "pug-parser";
    ldir  = "info/unscoped/p/pug-parser";
    inherit packument fetchInfo;
  } // latest';

}

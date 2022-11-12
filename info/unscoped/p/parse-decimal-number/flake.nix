{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parse-decimal-number?_rev=8-b8785309f4acc060a6d5d34ff6d21916";
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
    ident = "parse-decimal-number";
    ldir  = "info/unscoped/p/parse-decimal-number";
    inherit packument fetchInfo;
  } // latest';

}

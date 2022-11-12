{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parse-srcset?_rev=6-b6d15c1a33de1b9109b45102ebed4cfa";
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
    ident = "parse-srcset";
    ldir  = "info/unscoped/p/parse-srcset";
    inherit packument fetchInfo;
  } // latest';

}

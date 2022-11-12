{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fast-querystring?_rev=16-225b478e7eaa887650b8fa9b0de6fc5a";
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
    ident = "fast-querystring";
    ldir  = "info/unscoped/f/fast-querystring";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/didyoumean?_rev=36-8b28600ef7426487a78150eaa5dc15a0";
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
    ident = "didyoumean";
    ldir  = "info/unscoped/d/didyoumean";
    inherit packument fetchInfo;
  } // latest';

}

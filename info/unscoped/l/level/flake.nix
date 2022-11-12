{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/level?_rev=138-102da136bb75778a045e57d4f894c246";
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
    ident = "level";
    ldir  = "info/unscoped/l/level";
    inherit packument fetchInfo;
  } // latest';

}

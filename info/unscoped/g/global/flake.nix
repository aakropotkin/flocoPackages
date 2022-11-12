{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/global?_rev=63-78d8827648cebcf51ffb012e63fbfa5e";
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
    ident = "global";
    ldir  = "info/unscoped/g/global";
    inherit packument fetchInfo;
  } // latest';

}

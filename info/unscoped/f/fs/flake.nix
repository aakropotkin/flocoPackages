{

  inputs.packument.url   = "https://registry.npmjs.org/fs?rev=62-ea0b6ca30f4562ee1dc8c5683561192b";
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
    ident = "fs";
    ldir  = "info/unscoped/f/fs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

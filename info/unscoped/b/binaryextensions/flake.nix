{

  inputs.packument.url   = "https://registry.npmjs.org/binaryextensions?rev=98-25d6f1553d9cc5fd4adb40a59613becd";
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
    ident = "binaryextensions";
    ldir  = "info/unscoped/b/binaryextensions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

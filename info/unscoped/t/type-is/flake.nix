{

  inputs.packument.url   = "https://registry.npmjs.org/type-is?rev=105-67412decf8310c2ab6c64064878ccb88";
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
    ident = "type-is";
    ldir  = "info/unscoped/t/type-is";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

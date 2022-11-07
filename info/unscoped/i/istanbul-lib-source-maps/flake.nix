{

  inputs.packument.url   = "https://registry.npmjs.org/istanbul-lib-source-maps?rev=57-d8ddd423d15b7b7e30b41664c8e602d2";
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
    ident = "istanbul-lib-source-maps";
    ldir  = "info/unscoped/i/istanbul-lib-source-maps";
    inherit packument fetchInfo;
  } // latest';

}

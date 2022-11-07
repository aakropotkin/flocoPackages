{

  inputs.packument.url   = "https://registry.npmjs.org/sharp?rev=304-d1dab02ef89f072170f67e4a1cae27cf";
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
    ident = "sharp";
    ldir  = "info/unscoped/s/sharp";
    inherit packument fetchInfo;
  } // latest';

}

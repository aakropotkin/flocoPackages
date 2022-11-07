{

  inputs.packument.url   = "https://registry.npmjs.org/js-sdsl?rev=45-e0314f1d1fcba35492e0b9ed638abfd3";
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
    ident = "js-sdsl";
    ldir  = "info/unscoped/j/js-sdsl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/anymatch?rev=52-63f5b2b0074cae94c1bb7ef58c3730d1";
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
    ident = "anymatch";
    ldir  = "info/unscoped/a/anymatch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

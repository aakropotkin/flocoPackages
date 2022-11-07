{

  inputs.packument.url   = "https://registry.npmjs.org/lower-case?rev=24-90da947e3529d9709db891171c881211";
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
    ident = "lower-case";
    ldir  = "info/unscoped/l/lower-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

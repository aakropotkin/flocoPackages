{

  inputs.packument.url   = "https://registry.npmjs.org/@intlify/shared?rev=123-617910d20826a652d6b5fd369c453264";
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
    scope = "@intlify";
    ident = "@intlify/shared";
    ldir  = "info/intlify/shared";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/to-no-case?rev=14-5d2995221e3decd3e2053c4727a6c3c2";
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
    ident = "to-no-case";
    ldir  = "info/unscoped/t/to-no-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

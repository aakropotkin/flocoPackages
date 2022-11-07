{

  inputs.packument.url   = "https://registry.npmjs.org/chai?rev=521-75f303c8b52cd90c8d4a7f63f8a8d5ff";
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
    ident = "chai";
    ldir  = "info/unscoped/c/chai";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

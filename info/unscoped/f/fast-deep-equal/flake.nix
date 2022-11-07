{

  inputs.packument.url   = "https://registry.npmjs.org/fast-deep-equal?rev=24-a2aa17e20fc6209a262d41bf02733c2a";
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
    ident = "fast-deep-equal";
    ldir  = "info/unscoped/f/fast-deep-equal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

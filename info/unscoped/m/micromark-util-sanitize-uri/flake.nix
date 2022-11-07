{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-sanitize-uri?rev=6-735d7f9bc1831a66aefbf1292848c9c1";
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
    ident = "micromark-util-sanitize-uri";
    ldir  = "info/unscoped/m/micromark-util-sanitize-uri";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

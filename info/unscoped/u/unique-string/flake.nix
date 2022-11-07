{

  inputs.packument.url   = "https://registry.npmjs.org/unique-string?rev=9-76f7fa14432caaa2f8c1192180f217ae";
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
    ident = "unique-string";
    ldir  = "info/unscoped/u/unique-string";
    inherit packument fetchInfo;
  } // latest';

}

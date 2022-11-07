{

  inputs.packument.url   = "https://registry.npmjs.org/bunyan?rev=498-e0bb38a3fcd47d2ebd69ca9edc377318";
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
    ident = "bunyan";
    ldir  = "info/unscoped/b/bunyan";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

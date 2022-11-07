{

  inputs.packument.url   = "https://registry.npmjs.org/escape-regexp-component?rev=6-0c9b5533a72e85cfa9ce2f3164080e21";
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
    ident = "escape-regexp-component";
    ldir  = "info/unscoped/e/escape-regexp-component";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

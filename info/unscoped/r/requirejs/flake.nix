{

  inputs.packument.url   = "https://registry.npmjs.org/requirejs?rev=198-dd7e28ecee12305d7126165241f7e0a5";
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
    ident = "requirejs";
    ldir  = "info/unscoped/r/requirejs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

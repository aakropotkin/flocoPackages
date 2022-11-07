{

  inputs.packument.url   = "https://registry.npmjs.org/js-cookie?rev=122-b4be7cbed079ee2e49dcf064d27bffc4";
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
    ident = "js-cookie";
    ldir  = "info/unscoped/j/js-cookie";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/js-git?rev=83-0722ed64ad2f26f20b2cd06e0fe8cf9b";
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
    ident = "js-git";
    ldir  = "info/unscoped/j/js-git";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

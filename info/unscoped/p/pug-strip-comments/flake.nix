{

  inputs.packument.url   = "https://registry.npmjs.org/pug-strip-comments?rev=17-73e370c324da768f67477deb3db907fd";
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
    ident = "pug-strip-comments";
    ldir  = "info/unscoped/p/pug-strip-comments";
    inherit packument fetchInfo;
  } // latest';

}

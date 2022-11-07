{

  inputs.packument.url   = "https://registry.npmjs.org/gifsicle?rev=94-8d290ce7a780ff4475fdd94c8048b625";
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
    ident = "gifsicle";
    ldir  = "info/unscoped/g/gifsicle";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

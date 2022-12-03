{

  inputs.packument.url   = "https://registry.npmjs.org/@sinonjs/commons";
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
    scope = "@sinonjs";
    ident = "@sinonjs/commons";
    ldir  = "info/sinonjs/commons";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/connect-redis?rev=253-4c0bb0aeb01dda2d48713610de3ab04f";
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
    ident = "connect-redis";
    ldir  = "info/unscoped/c/connect-redis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

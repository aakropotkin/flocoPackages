{

  inputs.packument.url   = "https://registry.npmjs.org/just-extend?rev=61-fabf180f28b3bfeb6775c5367355c43c";
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
    ident = "just-extend";
    ldir  = "info/unscoped/j/just-extend";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/d3-random?rev=33-31e7618db527b7bb9491c14aa05941bd";
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
    ident = "d3-random";
    ldir  = "info/unscoped/d/d3-random";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

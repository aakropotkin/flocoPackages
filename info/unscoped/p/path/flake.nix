{

  inputs.packument.url   = "https://registry.npmjs.org/path?rev=135-2d393170337b8d525787076e09c098bd";
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
    ident = "path";
    ldir  = "info/unscoped/p/path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

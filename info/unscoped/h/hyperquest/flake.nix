{

  inputs.packument.url   = "https://registry.npmjs.org/hyperquest?rev=78-382f83fec445a2bd0bf6b74488bc3992";
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
    ident = "hyperquest";
    ldir  = "info/unscoped/h/hyperquest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/libnpmversion?rev=39-50d3760db8dca840e5903b4363d250d4";
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
    ident = "libnpmversion";
    ldir  = "info/unscoped/l/libnpmversion";
    inherit packument fetchInfo;
  } // latest';

}

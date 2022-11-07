{

  inputs.packument.url   = "https://registry.npmjs.org/bs-logger?rev=7-caf7b15e92119cacfd922a3a7c981c52";
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
    ident = "bs-logger";
    ldir  = "info/unscoped/b/bs-logger";
    inherit packument fetchInfo;
  } // latest';

}

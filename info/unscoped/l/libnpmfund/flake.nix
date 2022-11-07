{

  inputs.packument.url   = "https://registry.npmjs.org/libnpmfund?rev=41-9ed79e05661ca6facf957869cb1cf03e";
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
    ident = "libnpmfund";
    ldir  = "info/unscoped/l/libnpmfund";
    inherit packument fetchInfo;
  } // latest';

}

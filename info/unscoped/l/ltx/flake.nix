{

  inputs.packument.url   = "https://registry.npmjs.org/ltx?rev=122-ed9d83b69190a235cb346b9e14dbc993";
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
    ident = "ltx";
    ldir  = "info/unscoped/l/ltx";
    inherit packument fetchInfo;
  } // latest';

}

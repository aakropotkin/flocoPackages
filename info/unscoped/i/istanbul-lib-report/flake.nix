{

  inputs.packument.url   = "https://registry.npmjs.org/istanbul-lib-report?rev=42-7a2fb91c7a52582ef0c23dee0825c98a";
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
    ident = "istanbul-lib-report";
    ldir  = "info/unscoped/i/istanbul-lib-report";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/dotignore?rev=19-9c41e6cb873b00ca215fc2ff426d42d4";
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
    ident = "dotignore";
    ldir  = "info/unscoped/d/dotignore";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/mime-types?rev=155-5cd4eef0416d7ae4251b16ff0eb6b943";
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
    ident = "mime-types";
    ldir  = "info/unscoped/m/mime-types";
    inherit packument fetchInfo;
  } // latest';

}

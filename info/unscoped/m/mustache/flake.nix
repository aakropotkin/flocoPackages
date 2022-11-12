{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mustache?_rev=143-39b48d9df6c7260901b36ee0d43784c0";
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
    ident = "mustache";
    ldir  = "info/unscoped/m/mustache";
    inherit packument fetchInfo;
  } // latest';

}

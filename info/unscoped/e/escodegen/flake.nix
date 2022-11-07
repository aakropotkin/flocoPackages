{

  inputs.packument.url   = "https://registry.npmjs.org/escodegen?rev=142-bc8135d20abae40ef33c616c512ee1b0";
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
    ident = "escodegen";
    ldir  = "info/unscoped/e/escodegen";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

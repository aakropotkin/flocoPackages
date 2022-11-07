{

  inputs.packument.url   = "https://registry.npmjs.org/apollo-link?rev=60-7b86f0510fd48bea4c94ce53de0a32a1";
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
    ident = "apollo-link";
    ldir  = "info/unscoped/a/apollo-link";
    inherit packument fetchInfo;
  } // latest';

}

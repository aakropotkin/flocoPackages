{

  inputs.packument.url   = "https://registry.npmjs.org/totalist?rev=6-d6cca24dc57f9ba775770ebc477b526c";
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
    ident = "totalist";
    ldir  = "info/unscoped/t/totalist";
    inherit packument fetchInfo;
  } // latest';

}

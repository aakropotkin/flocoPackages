{

  inputs.packument.url   = "https://registry.npmjs.org/union-value?rev=16-95fa8ae8ae891288378aab1739b23ed6";
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
    ident = "union-value";
    ldir  = "info/unscoped/u/union-value";
    inherit packument fetchInfo;
  } // latest';

}

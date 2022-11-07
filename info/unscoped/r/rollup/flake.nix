{

  inputs.packument.url   = "https://registry.npmjs.org/rollup?rev=756-775d40540cdd0df1f5fe593826282511";
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
    ident = "rollup";
    ldir  = "info/unscoped/r/rollup";
    inherit packument fetchInfo;
  } // latest';

}

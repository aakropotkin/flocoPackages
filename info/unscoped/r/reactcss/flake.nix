{

  inputs.packument.url   = "https://registry.npmjs.org/reactcss?rev=36-acb9a12fb14fde06434678866d40d384";
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
    ident = "reactcss";
    ldir  = "info/unscoped/r/reactcss";
    inherit packument fetchInfo;
  } // latest';

}

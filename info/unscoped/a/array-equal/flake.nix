{

  inputs.packument.url   = "https://registry.npmjs.org/array-equal?rev=15-7d9e8fd13828086171b581770f83efce";
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
    ident = "array-equal";
    ldir  = "info/unscoped/a/array-equal";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/listr2?rev=173-3d087f612fa8d3aee5b3fa412fa562ff";
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
    ident = "listr2";
    ldir  = "info/unscoped/l/listr2";
    inherit packument fetchInfo;
  } // latest';

}

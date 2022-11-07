{

  inputs.packument.url   = "https://registry.npmjs.org/array-sort?rev=13-af1da00f4cac1862c2f9159f038b6984";
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
    ident = "array-sort";
    ldir  = "info/unscoped/a/array-sort";
    inherit packument fetchInfo;
  } // latest';

}

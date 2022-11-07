{

  inputs.packument.url   = "https://registry.npmjs.org/chardet?rev=39-c52234b918a5af86905cf68e195881b7";
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
    ident = "chardet";
    ldir  = "info/unscoped/c/chardet";
    inherit packument fetchInfo;
  } // latest';

}

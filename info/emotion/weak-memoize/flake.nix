{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/weak-memoize?rev=16-1f8eab3d1fa76a4a8ab23bb19ffe2ad6";
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
    scope = "@emotion";
    ident = "@emotion/weak-memoize";
    ldir  = "info/emotion/weak-memoize";
    inherit packument fetchInfo;
  } // latest';

}

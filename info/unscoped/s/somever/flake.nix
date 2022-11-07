{

  inputs.packument.url   = "https://registry.npmjs.org/somever?rev=8-90fd438f6af77f0084e273fb45f09300";
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
    ident = "somever";
    ldir  = "info/unscoped/s/somever";
    inherit packument fetchInfo;
  } // latest';

}

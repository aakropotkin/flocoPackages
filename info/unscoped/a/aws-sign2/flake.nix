{

  inputs.packument.url   = "https://registry.npmjs.org/aws-sign2?rev=9-76f4ba12bbbe2b3bec7c3421ab5eb4ab";
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
    ident = "aws-sign2";
    ldir  = "info/unscoped/a/aws-sign2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/@aws-sdk/util-buffer-from?rev=68-dfcd0472c128a2c84a47135f6df3c07e";
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
    scope = "@aws-sdk";
    ident = "@aws-sdk/util-buffer-from";
    ldir  = "info/aws-sdk/util-buffer-from";
    inherit packument fetchInfo;
  } // latest';

}

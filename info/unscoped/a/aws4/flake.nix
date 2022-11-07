{

  inputs.packument.url   = "https://registry.npmjs.org/aws4?rev=83-4b8b636f77574347fed4db41f9fd871f";
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
    ident = "aws4";
    ldir  = "info/unscoped/a/aws4";
    inherit packument fetchInfo;
  } // latest';

}

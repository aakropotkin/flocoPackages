{

  inputs.packument.url   = "https://registry.npmjs.org/tsscmp?rev=12-accd41d48d6e579a317f57b7a71ecd36";
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
    ident = "tsscmp";
    ldir  = "info/unscoped/t/tsscmp";
    inherit packument fetchInfo;
  } // latest';

}

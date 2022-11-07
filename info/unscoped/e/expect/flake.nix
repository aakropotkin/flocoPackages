{

  inputs.packument.url   = "https://registry.npmjs.org/expect?rev=339-7c5621224f8fad62844f8a1a0efe0a25";
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
    ident = "expect";
    ldir  = "info/unscoped/e/expect";
    inherit packument fetchInfo;
  } // latest';

}

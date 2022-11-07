{

  inputs.packument.url   = "https://registry.npmjs.org/mocha?rev=1262-873f7b0226d2a77b1bfd4bfba68546d0";
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
    ident = "mocha";
    ldir  = "info/unscoped/m/mocha";
    inherit packument fetchInfo;
  } // latest';

}

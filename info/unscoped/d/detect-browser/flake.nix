{

  inputs.packument.url   = "https://registry.npmjs.org/detect-browser?rev=67-c4b38b2b213463b10a49e68296c5f626";
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
    ident = "detect-browser";
    ldir  = "info/unscoped/d/detect-browser";
    inherit packument fetchInfo;
  } // latest';

}

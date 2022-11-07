{

  inputs.packument.url   = "https://registry.npmjs.org/unist-util-is?rev=23-00f4597f7a9b404f771c2c90ffb8b7bf";
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
    ident = "unist-util-is";
    ldir  = "info/unscoped/u/unist-util-is";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/copy-to?rev=24-88d07ec281a31ce1ef5790ecd6e781e9";
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
    ident = "copy-to";
    ldir  = "info/unscoped/c/copy-to";
    inherit packument fetchInfo;
  } // latest';

}

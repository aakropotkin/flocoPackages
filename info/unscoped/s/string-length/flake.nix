{

  inputs.packument.url   = "https://registry.npmjs.org/string-length?rev=22-b5c4f5100a8fce4e44a0c8b61cd95338";
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
    ident = "string-length";
    ldir  = "info/unscoped/s/string-length";
    inherit packument fetchInfo;
  } // latest';

}

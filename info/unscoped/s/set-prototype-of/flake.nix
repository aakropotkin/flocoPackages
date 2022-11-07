{

  inputs.packument.url   = "https://registry.npmjs.org/set-prototype-of?rev=3-43edb8344b5c866baa2693186e22078d";
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
    ident = "set-prototype-of";
    ldir  = "info/unscoped/s/set-prototype-of";
    inherit packument fetchInfo;
  } // latest';

}

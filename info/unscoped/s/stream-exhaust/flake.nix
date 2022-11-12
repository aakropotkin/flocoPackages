{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-exhaust?_rev=9-c3a85096d96b5f9e6b0bd22fc557fc96";
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
    ident = "stream-exhaust";
    ldir  = "info/unscoped/s/stream-exhaust";
    inherit packument fetchInfo;
  } // latest';

}

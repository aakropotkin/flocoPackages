{

  inputs.packument.url   = "https://registry.npmjs.org/zone.js?rev=152-011353f34748cede96ca681e3a0331f0";
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
    ident = "zone.js";
    ldir  = "info/unscoped/z/zone.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

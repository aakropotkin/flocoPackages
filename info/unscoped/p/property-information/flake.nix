{

  inputs.packument.url   = "https://registry.npmjs.org/property-information?rev=29-1165966b8e042a83cbae2b5e3fad4a72";
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
    ident = "property-information";
    ldir  = "info/unscoped/p/property-information";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

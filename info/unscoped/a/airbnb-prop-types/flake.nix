{

  inputs.packument.url   = "https://registry.npmjs.org/airbnb-prop-types?rev=58-0523ac7bfe604bc5739a5f178bc7f543";
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
    ident = "airbnb-prop-types";
    ldir  = "info/unscoped/a/airbnb-prop-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

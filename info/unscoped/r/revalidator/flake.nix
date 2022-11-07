{

  inputs.packument.url   = "https://registry.npmjs.org/revalidator?rev=45-fcf51cf9b6edacda264394225512c989";
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
    ident = "revalidator";
    ldir  = "info/unscoped/r/revalidator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

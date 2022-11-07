{

  inputs.packument.url   = "https://registry.npmjs.org/p-transform?rev=5-fe022b938226d0d05813ecc09ff89393";
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
    ident = "p-transform";
    ldir  = "info/unscoped/p/p-transform";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

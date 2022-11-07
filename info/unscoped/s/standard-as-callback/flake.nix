{

  inputs.packument.url   = "https://registry.npmjs.org/standard-as-callback?rev=6-8e32233d90e1f709a1daa0e42d806060";
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
    ident = "standard-as-callback";
    ldir  = "info/unscoped/s/standard-as-callback";
    inherit packument fetchInfo;
  } // latest';

}

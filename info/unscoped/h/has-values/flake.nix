{

  inputs.packument.url   = "https://registry.npmjs.org/has-values?rev=12-ca797a27bde3fc3cfe42d276869361a1";
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
    ident = "has-values";
    ldir  = "info/unscoped/h/has-values";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helpers?rev=111-77ada917ff6dc2838e40df6fc5c19962";
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
    ident = "babel-helpers";
    ldir  = "info/unscoped/b/babel-helpers";
    inherit packument fetchInfo;
  } // latest';

}

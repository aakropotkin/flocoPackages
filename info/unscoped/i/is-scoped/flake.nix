{

  inputs.packument.url   = "https://registry.npmjs.org/is-scoped?rev=6-6ffc7452b6ec41f9c4d308a3254818a5";
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
    ident = "is-scoped";
    ldir  = "info/unscoped/i/is-scoped";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/drange?rev=8-96fa6605eb30e1380001408d8298235b";
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
    ident = "drange";
    ldir  = "info/unscoped/d/drange";
    inherit packument fetchInfo;
  } // latest';

}

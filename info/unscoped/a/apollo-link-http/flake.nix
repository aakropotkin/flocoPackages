{

  inputs.packument.url   = "https://registry.npmjs.org/apollo-link-http?rev=62-224bc28562bc9f1911a0afdc820de9f4";
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
    ident = "apollo-link-http";
    ldir  = "info/unscoped/a/apollo-link-http";
    inherit packument fetchInfo;
  } // latest';

}

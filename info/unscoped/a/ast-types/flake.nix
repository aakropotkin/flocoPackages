{

  inputs.packument.url   = "https://registry.npmjs.org/ast-types?rev=287-1c0c47729e3f928b74a35f8f353a6202";
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
    ident = "ast-types";
    ldir  = "info/unscoped/a/ast-types";
    inherit packument fetchInfo;
  } // latest';

}

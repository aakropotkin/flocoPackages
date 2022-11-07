{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-url?rev=66-b8d6c7f9df58eb9f026c2af602be7852";
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
    ident = "postcss-normalize-url";
    ldir  = "info/unscoped/p/postcss-normalize-url";
    inherit packument fetchInfo;
  } // latest';

}

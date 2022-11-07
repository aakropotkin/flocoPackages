{

  inputs.packument.url   = "https://registry.npmjs.org/ts-jest?rev=205-65215ad37f77c8d893ea61bcab7519d8";
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
    ident = "ts-jest";
    ldir  = "info/unscoped/t/ts-jest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

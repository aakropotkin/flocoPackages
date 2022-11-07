{

  inputs.packument.url   = "https://registry.npmjs.org/postcss?rev=438-9ab48f0a3f9f168bc828c2f127d0bdb6";
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
    ident = "postcss";
    ldir  = "info/unscoped/p/postcss";
    inherit packument fetchInfo;
  } // latest';

}

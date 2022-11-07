{

  inputs.packument.url   = "https://registry.npmjs.org/trim-repeated?rev=6-6c44460741b5fa3dff92984f497dd878";
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
    ident = "trim-repeated";
    ldir  = "info/unscoped/t/trim-repeated";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-positions?rev=39-960d106362bcfea49111597cf4e89bec";
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
    ident = "postcss-normalize-positions";
    ldir  = "info/unscoped/p/postcss-normalize-positions";
    inherit packument fetchInfo;
  } // latest';

}

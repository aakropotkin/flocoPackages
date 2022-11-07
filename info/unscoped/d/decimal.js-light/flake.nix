{

  inputs.packument.url   = "https://registry.npmjs.org/decimal.js-light?rev=27-a01326310759379cd1219151f11ef7d5";
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
    ident = "decimal.js-light";
    ldir  = "info/unscoped/d/decimal.js-light";
    inherit packument fetchInfo;
  } // latest';

}

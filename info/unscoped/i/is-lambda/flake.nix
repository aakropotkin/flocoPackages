{

  inputs.packument.url   = "https://registry.npmjs.org/is-lambda?rev=4-ad739fba71f99829f2cc965076762da8";
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
    ident = "is-lambda";
    ldir  = "info/unscoped/i/is-lambda";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

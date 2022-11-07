{

  inputs.packument.url   = "https://registry.npmjs.org/css-color-function?rev=31-0571f97194c2a1f35bcf2b8d51f5048d";
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
    ident = "css-color-function";
    ldir  = "info/unscoped/c/css-color-function";
    inherit packument fetchInfo;
  } // latest';

}

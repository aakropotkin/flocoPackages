{

  inputs.packument.url   = "https://registry.npmjs.org/min-indent?rev=5-d8654634bcd642cf736cc7bb8cc0b0f8";
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
    ident = "min-indent";
    ldir  = "info/unscoped/m/min-indent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

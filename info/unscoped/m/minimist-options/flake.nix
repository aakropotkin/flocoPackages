{

  inputs.packument.url   = "https://registry.npmjs.org/minimist-options?rev=18-9c6f4ccbc26859405f5870fb2983cec2";
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
    ident = "minimist-options";
    ldir  = "info/unscoped/m/minimist-options";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

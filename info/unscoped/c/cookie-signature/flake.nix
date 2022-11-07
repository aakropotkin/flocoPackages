{

  inputs.packument.url   = "https://registry.npmjs.org/cookie-signature?rev=40-1da42ffcf3a3e14a688795e66bd9647c";
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
    ident = "cookie-signature";
    ldir  = "info/unscoped/c/cookie-signature";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

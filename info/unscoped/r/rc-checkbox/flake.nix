{

  inputs.packument.url   = "https://registry.npmjs.org/rc-checkbox?rev=53-37d3053acf08af7252e7ec8eb5ec6bb8";
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
    ident = "rc-checkbox";
    ldir  = "info/unscoped/r/rc-checkbox";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

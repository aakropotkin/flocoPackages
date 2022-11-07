{

  inputs.packument.url   = "https://registry.npmjs.org/rc-rate?rev=38-1fe77dec6c4c2dd50ea464034088b02c";
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
    ident = "rc-rate";
    ldir  = "info/unscoped/r/rc-rate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

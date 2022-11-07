{

  inputs.packument.url   = "https://registry.npmjs.org/phin?rev=74-9bc0aec407fce8e4c44483bca6fc6e43";
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
    ident = "phin";
    ldir  = "info/unscoped/p/phin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

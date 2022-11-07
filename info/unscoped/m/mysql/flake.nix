{

  inputs.packument.url   = "https://registry.npmjs.org/mysql?rev=724-1b5deb72df88b73b55f448899bb80617";
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
    ident = "mysql";
    ldir  = "info/unscoped/m/mysql";
    inherit packument fetchInfo;
  } // latest';

}

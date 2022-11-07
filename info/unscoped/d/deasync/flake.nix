{

  inputs.packument.url   = "https://registry.npmjs.org/deasync?rev=96-43c905e429ec0c4ce1630d6044fe00d0";
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
    ident = "deasync";
    ldir  = "info/unscoped/d/deasync";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/saxes?rev=31-293e396a3e76f3db7c970e266dba537b";
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
    ident = "saxes";
    ldir  = "info/unscoped/s/saxes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

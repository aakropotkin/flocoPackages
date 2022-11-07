{

  inputs.packument.url   = "https://registry.npmjs.org/stream-each?rev=19-f8f59670f3e7f9bbcfefd1336f8c1de1";
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
    ident = "stream-each";
    ldir  = "info/unscoped/s/stream-each";
    inherit packument fetchInfo;
  } // latest';

}

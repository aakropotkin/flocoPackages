{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/libnpmpublish?_rev=57-a67d5911b328c93dff65697fa486a6c5";
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
    ident = "libnpmpublish";
    ldir  = "info/unscoped/l/libnpmpublish";
    inherit packument fetchInfo;
  } // latest';

}

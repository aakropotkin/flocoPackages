{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/double-ended-queue?_rev=19-bb7e32dc0865b50b07cb11d92be29240";
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
    ident = "double-ended-queue";
    ldir  = "info/unscoped/d/double-ended-queue";
    inherit packument fetchInfo;
  } // latest';

}

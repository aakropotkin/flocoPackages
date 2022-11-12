{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sideway%2faddress?_rev=6-a8d822e604c5b297e8d4b5a03caec52c";
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
    scope = "@sideway";
    ident = "@sideway/address";
    ldir  = "info/sideway/address";
    inherit packument fetchInfo;
  } // latest';

}

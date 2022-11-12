{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@electron%2fget?_rev=39-ffbfc9b9507596e8f4af11453b882067";
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
    scope = "@electron";
    ident = "@electron/get";
    ldir  = "info/electron/get";
    inherit packument fetchInfo;
  } // latest';

}

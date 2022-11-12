{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@acuminous/bitsyntax?_rev=1-752b300eb2f3b5637f8641536d27d8f6";
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
    scope = "@acuminous";
    ident = "@acuminous/bitsyntax";
    ldir  = "info/acuminous/bitsyntax";
    inherit packument fetchInfo;
  } // latest';

}

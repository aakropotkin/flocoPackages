{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/domelementtype?_rev=32-dbf733e089f3111dcda4d777086c0897";
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
    ident = "domelementtype";
    ldir  = "info/unscoped/d/domelementtype";
    inherit packument fetchInfo;
  } // latest';

}

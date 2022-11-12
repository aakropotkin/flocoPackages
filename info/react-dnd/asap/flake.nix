{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-dnd/asap?_rev=6-6c150565c108e1cad14716dee3101e39";
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
    scope = "@react-dnd";
    ident = "@react-dnd/asap";
    ldir  = "info/react-dnd/asap";
    inherit packument fetchInfo;
  } // latest';

}

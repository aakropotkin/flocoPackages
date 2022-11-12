{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fcoord?_rev=82-100a80e8a49bb06e77beb6f0ffac8990";
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
    scope = "@antv";
    ident = "@antv/coord";
    ldir  = "info/antv/coord";
    inherit packument fetchInfo;
  } // latest';

}

{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/json2mq?_rev=7-87ae61ff2b09f63c7f215ed82fdb10e8";
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
    ident = "json2mq";
    ldir  = "info/unscoped/j/json2mq";
    inherit packument fetchInfo;
  } // latest';

}

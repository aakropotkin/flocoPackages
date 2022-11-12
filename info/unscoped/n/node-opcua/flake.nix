{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua?_rev=383-4c68c69fcb0b528fbe6b8de5828478f4";
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
    ident = "node-opcua";
    ldir  = "info/unscoped/n/node-opcua";
    inherit packument fetchInfo;
  } // latest';

}

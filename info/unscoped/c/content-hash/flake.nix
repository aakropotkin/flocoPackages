{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/content-hash?_rev=26-fa0aeb729d608e3b47762b102124b915";
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
    ident = "content-hash";
    ldir  = "info/unscoped/c/content-hash";
    inherit packument fetchInfo;
  } // latest';

}

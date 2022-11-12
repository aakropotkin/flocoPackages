{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/async-promise-queue?_rev=9-0b6e9f7b582f79ff7ee7cb05d0a4f6be";
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
    ident = "async-promise-queue";
    ldir  = "info/unscoped/a/async-promise-queue";
    inherit packument fetchInfo;
  } // latest';

}

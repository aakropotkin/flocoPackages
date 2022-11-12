{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/core-lro?_rev=176-1a200a2566f183b2b081d8674b050377";
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
    scope = "@azure";
    ident = "@azure/core-lro";
    ldir  = "info/azure/core-lro";
    inherit packument fetchInfo;
  } // latest';

}

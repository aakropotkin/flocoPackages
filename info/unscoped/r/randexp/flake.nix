{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/randexp?_rev=45-77442b3e5363262bd20a14ddca37899b";
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
    ident = "randexp";
    ldir  = "info/unscoped/r/randexp";
    inherit packument fetchInfo;
  } // latest';

}
